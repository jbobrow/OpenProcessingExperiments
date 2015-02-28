
Ship ship;
Bullet bullets = new Bullet[12];
ArrayList<Asteroid> asts = new ArrayList<Asteroid>();
boolean key = new boolean[256];
int count = 0;
boolean hit = true;
int lives = 1;
boolean canShoot = false;
boolean gameOver = false;
int counter = 0;
int score = 0;
int level = 1;
public void setup() { 
    size(600,400);
    frameRate(60);
    set();
}

public void set() {
    ship = new Ship(width, height);
    hit = false;
    count = 0;
    if (lives == 0) {
        lives = 1;
    }
    lives += 2;
    bullets = new Bullet[12 + level * 6];
    for (int a = 0; a < bullets.length; a++) {
        bullets[a] = null;
    }
    asts = new ArrayList<Asteroid>();
    createAsteroids(level);
      
}

public void draw() {  //draw function loops 
    if (!gameOver) {
        if (asts.size() == 0) {
            level++;
            set();
        }
        else {
            textAlign(LEFT);
            background(0);
            text("Lives: " + lives,20,30);
            text("Level: " + level,20,60);
            text("Score: " + score,20,90);
            fill(255);
      
            if (hit) {
                count++;
                if (count == 30) {
                    count = 0;
                    hit = false;
                }
            }
            fill(255 - count * 8);
            ship.move();
            stroke(255);
            ship.draw();
            ship.friction();
            
            if (lives == 0) {
                level = 1;
                count = 0;
                gameOver = true;
            }  
            //text(ship.degree,width/2,height/2);
            //text(sin(radians(ship.degree)),width/2,height/2 + 30);
            //text(cos(radians(ship.degree)),width/2,height/2 + 60);
            
            fill(255);
            counter++;
            if(counter>=15) {
                canShoot = true;
            }
            
            for (int a = 0; a < bullets.length; a++) {
                if (bullets[a] != null) {
                    bullets[a].move();
                    bullets[a].draw();
                    
                    if (bullets[a].counter > 60) {
                        bullets[a] = null;
                    }
                    
                }
            }
            for (int a =  asts.size() - 1; a >= 0; a--) {
                if (asts.get(a) != null) {
                    asts.get(a).move();
                    asts.get(a).draw();
                    for (int b = 0; b < bullets.length; b++) { 
                        if (bullets[b] != null) {
                            if (asts.get(a).checkCollision(bullets[b])) {
                                bullets[b] = null;
                                score += (int)((50 - asts.get(a).rad) * (abs(asts.get(a).movement.x) +abs(asts.get(a).movement.y)) / 4);
                                asts.remove(a);
                                break;
                            }
                        }
                    }
                }
                if (!hit) {
                    if (asts.get(a) != null) {
                        if (ship.checkCollision(asts.get(a))) {
                            hit = true;
                            lives--;
                            asts.remove(a);
                        }
                    }
                }
            }
            processKeys();
        }
    }
    else {
        count++;
        background(0);
        textAlign(CENTER);
        text("Score: " + score,width/2,height/2-40);
        text("Game Over",width / 2, height / 2 - 20);
        text("Press any key to restart",width / 2, height / 2);
    }
    
}        

public void keyReleased() {
     if (keyCode < key.length) {
        key[keyCode] = false;
    }
}

public void keyPressed() {
    if (keyCode < key.length) {
        key[keyCode] = true;
    }
    if (gameOver && count >= 20) {
        gameOver = false;
        score = 0;
        set();
    }
}  

public void processKeys() {
    if (key[37]) {
        ship.turnLeft();
    }
    if (key[38]) {
        ship.accelerate();
    }
    if (key[39]) {
        ship.turnRight();
    }
    if (key[40]) {
        ship.movement.set(0,0);
    }
    if (key[32]) {
        if (canShoot) {
            shoot(ship.loc.x,ship.loc.y,ship.degree);
            counter = 0;
            canShoot = false;
        }
    }
}

public void shoot(float x, float y, int deg) {
    int b = -1;
    for (int a = 0; a < bullets.length; a++) {
        if (bullets[a] == null) {
            b = a;
            break;
        }
    }
    if (b != -1) {
        bullets[b] = new Bullet(x + ship.dist * cos(radians(deg)),y - ship.dist * sin(radians(deg)),deg,5);
    }
}

public void createAsteroids(int s) {
    if (s > 7) {
        s = 7;
    }
    for (int a = 0; a < s + 5;a++) {
        if (asts.get(a) == null) {
            int randX = random(10) - 5;
            int randY = random(10) - 5;
            if (randX < 0) {
                randX -= s;
            }
            else {
                randX += s;
            }
            if (randY < 0) {
                randY -= s;
            }
            else {
                randY += s;
            }
            asts.add(new Asteroid(random(width),random(height),randX,randY,random(20) + 20));
        }
    }
}

class Ship {
    PVector loc;
    PVector movement;
    int counter = 0;
    int dist = 30;
    int degree = 90;
    float acc = .2;
    int x1;
    int x2;
    int x3;
    int y1;
    int y2;
    int y3;
    Ship(int w, int h) {
        loc = new PVector(w / 2, h / 2);
        movement = new PVector(0,0);
    }

    public void draw() {
        int x = (int)loc.x;
        int y = (int)loc.y;
        x1 = (int)(x + (dist + 5) * cos(radians(degree)));
        y1 = (int)(y - (dist + 5)* sin(radians(degree)));
        x2 = (int)(x + dist / 3 * cos(radians(degree - 90)));
        y2 = (int)(y - dist / 3 * sin(radians(degree - 90)));
        x3 = (int)(x + dist / 3 * cos(radians(degree + 90)));
        y3 = (int)(y - dist / 3 * sin(radians(degree + 90)));
        triangle(x1,y1,x2,y2,x3,y3);
    }
    
    public void accelerate() {
        //base acceleration on degree
        movement.add(cos(radians(degree)) * acc,-sin(radians(degree)) * acc);
        //if (abs(movement.x) + abs(movement.y) > 10) {
            //slow based on degree
        //
    }
    
    public void friction() {
        movement.add(-movement.x * .02,-movement.y * .02);
    }
  
    public void move() {
        counter++;
        loc.add(movement);
        if (loc.x <= 0) {
            loc.set(width,loc.y);
        }
        else if (loc.x >= width) {
            loc.set(0,loc.y);
        }
        if (loc.y <= 0) {
            loc.set(loc.x,height);
        }
        else if (loc.y >= height) {
            loc.set(loc.x,0);
        }
    }
    
    public void turnLeft() {
        degree += 3;
    }
    
    public void turnRight() {
        degree -= 3;
    }
    
    public boolean checkCollision(Asteroid a) {
        int xCen = a.loc.x;
        int yCen = a.loc.y;
        int xMid1 = getMid(x1,x2);
        int xMid2 = getMid(x2,x3);
        int xMid3 = getMid(x1,x3);
        int yMid1 = getMid(y1,y2);
        int yMid2 = getMid(y2,y3);
        int yMid3 = getMid(y1,y3);
        int r = a.rad - dist / 3;
        if (calculateDistance(x1,y1,xCen,yCen) <= r) {
            return true;
        }
        
        if (calculateDistance(x2,y2,xCen,yCen) <= r) {
            return true;
        }
        
        if (calculateDistance(x3,y3,xCen,yCen) <= r) {
            return true;
        }
        
        if (calculateDistance(xMid1,yMid1,xCen,yCen) <= r) {
            return true;
        }
        
        if (calculateDistance(xMid2,yMid2,xCen,yCen) <= r) {
            return true;
        }
        
        if (calculateDistance(xMid3,yMid3,xCen,yCen) <= r) {
            return true;
        }
        return false;
        /*
        int x4;
        int x5;
        int y4;
        int y5;
        
        int degree1 = degree - 90;
        int degree2 = degrees(tan((dist + 5) / -(dist / 3))) + degree;
        int degree3 = degrees(tan((dist + 5) / (dist / 3))) + degree;
        x4 = (int)(a.loc.x - cos(radians(degree1)) * a.rad);
        x5 = (int)(a.loc.x + cos(radians(degree1)) * a.rad);
        y4 = (int)(a.loc.y - sin(radians(degree1)) * a.rad);
        y5 = (int)(a.loc.y + sin(radians(degree1)) * a.rad);
        if (!checkAxis(x2,y2,x3,y3,x4,y4,x5,y5)) {
            return false;
        }
        x4 = (int)(a.loc.x - cos(radians(degree2)) * a.rad);
        x5 = (int)(a.loc.x + cos(radians(degree2)) * a.rad);
        y4 = (int)(a.loc.y - sin(radians(degree2)) * a.rad);
        y5 = (int)(a.loc.y + sin(radians(degree2)) * a.rad);
        if (!checkAxis(x1,y1,x3,y3,x4,y4,x5,y5)) {
            return false;
        }
        x4 = (int)(a.loc.x - cos(radians(degree3)) * a.rad);
        x5 = (int)(a.loc.x + cos(radians(degree3)) * a.rad);
        y4 = (int)(a.loc.y - sin(radians(degree3)) * a.rad);
        y5 = (int)(a.loc.y + sin(radians(degree3)) * a.rad);
        if (!checkAxis(x2,y2,x3,y3,x4,y4,x5,y5)) {
            return false;
        }
        
        return true;
        */
    }
    
    public boolean checkAxis(int a, int b, int a1, int b1, int c, int d, int c1, int d1) {
        //find a way to check when axis overlap
    }
    
    public int getMid(int a, int b) {
        return (a + b) / 2;
    }
    
    public float calculateDistance(int x, int y, int x1, int y1) {
        float a = abs(x - x1);
        float b = abs(y - y1);
        return (sqrt(a * a + b * b));
    }
}  

public class Bullet {
    int rad;
    PVector loc;
    PVector movement;
    int counter = 0;
    public Bullet(float x, float y, int deg,int r) {
        rad = r;
        counter = 0;
        loc = new PVector(x, y);
        //base movement on deg
        movement = new PVector(cos(radians(deg)) * 5,-sin(radians(deg)) * 5);
    }
    
    public void draw() {
        int x = (int)loc.x;
        int y = (int)loc.y;
        ellipse(loc.x, loc.y,rad,rad);
    }
    
    public void move() {
        counter++;
        loc.add(movement);
        if (loc.x + rad <= 0) {
            loc.set(width + rad,loc.y);
        }
        else if (loc.x - rad >= width) {
            loc.set(-rad,loc.y);
        }
        if (loc.y + rad <= 0) {
            loc.set(loc.x,height + rad);
        }
        else if (loc.y - rad >= height) {
            loc.set(loc.x,-rad);
        }
    }
}

public class Asteroid {
    int rad;
    PVector loc;
    PVector movement;
    int counter = 0;
    
    Asteroid(int x, int y, float xSpeed, float ySpeed, int r) {
        loc = new PVector(x, y);
        movement = new PVector(xSpeed, ySpeed);
        rad = r;
    }
    
    public void draw() {
        int x = (int)loc.x;
        int y = (int)loc.y;
        ellipse(x, y, rad,rad);
    }
    
    public void move() {
        counter++;
        loc.add(movement);
        if (loc.x + rad <= 0) {
            loc.set(width + rad,loc.y);
        }
        else if (loc.x - rad >= width) {
            loc.set(-rad,loc.y);
        }
        if (loc.y + rad <= 0) {
            loc.set(loc.x,height + rad);
        }
        else if (loc.y - rad >= height) {
            loc.set(loc.x,-rad);
        }
    }
    boolean checkCollision(Bullet b) {
            if (b != null) {
                int dist = calculateDistance(b.loc.x,b.loc.y,this.loc.x,this.loc.y);
                if (dist < b.rad + this.rad - 9) {
                    return true;
                }
            }
        
        return false;
    }
    public float calculateDistance(int x, int y, int x1, int y1) {
        float a = abs(x - x1);
        float b = abs(y - y1);
        return (sqrt(a * a + b * b));
    }
    
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
