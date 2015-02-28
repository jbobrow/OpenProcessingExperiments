
Character chara;
ArrayList<Tile> tiles;
ArrayList<Enemy> enemies;
boolean key = new boolean[256];
PVector backCoord = new PVector(0,0);
int level = 1;
int checkpoint = 0;

void setup() { 
  size(800, 400);
  frameRate(60);
  chara = new Character();
  enemies = new ArrayList<Enemy>();
  addEnemies(10);
  tiles = new ArrayList<Tile>();
  addTiles(level);
}

void draw() {
    println(chara.lives);
    noStroke();
    background(60,140,200);
    drawTiles();
    checkCheckpoint();
    processKeys();
    checkCollisions();
    chara.update();
    for (int a = enemies.size() - 1; a >= 0; a--) {
        enemies.get(a).update();
        if (enemies.get(a).lives <= 0) {
            enemies.remove(a);
        }
    }
}

void checkCollisions() {
    int x1 = chara.loc.x - backCoord.x;
    int y1 = chara.loc.y + backCoord.y;
    for (int a = enemies.size() - 1; a >= 0; a--) {
        Enemy e = enemies.get(a);
        int x2 = e.loc.x;
        int y2 = e.loc.y;
        if (x1 + chara.rectWidth > x2 && x1 < x2 + e.rectWidth) {
            if (y1 + chara.rectHeight > y2 && y1 < y2 + e.rectHeight){
                if (chara.turbo1) {
                    enemies.get(a).lives--;
                }
            }
        }
    }
}

void checkCheckpoint() {
    if (backCoord.x <= -1000) {
        checkpoint = -1000;
    }
}

void keyReleased() {
     if (keyCode < key.length) {
        key[keyCode] = false;
        if (keyCode == 32) {
            chara.turbo1 = false;
        }
    }
}

void keyPressed() {
    if (keyCode < key.length) {
        key[keyCode] = true;
    }
}

void processKeys() {
    if (key[37]) {   
        chara.right = false;
        if (chara.loc.x >= 200) {
            chara.loc.add(-3,0);
        }
        else {
            backCoord.add(3,0);
        }
    }
    if (key[38]) {
        if (chara.onGround) {
           chara.jump();
        }
    }
    if (key[39]) {
       chara.right = true;
       if (chara.loc.x <= width - 200) {
           chara.loc.add(3,0);
       }
       else {
           backCoord.add(-3,0);
       }
    }
    if (key[40]) {
        addEnemies(1);
    }
    if (key[32]) {
         if (chara.cooldown > 0) {
            chara.turbo1 = false;
         }
         else {
            chara.turbo1 = true;
            chara.turbo();
         }
    }
}

void addEnemies(int s) {
    for (int a = 0; a < s; a++) {
        enemies.add(new Enemy((int)random(width) - backCoord.x,(int)random(height - 80) + backCoord.y));
    }
}    

void addTiles(int l) {
    switch(l) {
        case 1:
            tiles.add(new Tile(0,height - 80,width,80)); 
            tiles.add(new Tile(80,height - 200,200,50));
            tiles.add(new Tile(width,height - 200,700,40));
            tiles.add(new Tile(width + 600,height - 100,700,40));
            tiles.add(new Tile(width + 100,height - 60,600,60));
            tiles.add(new Tile(-width,height - 40,width,80)); 
            tiles.add(new Tile(2200,height - 100,50,50));
            tiles.add(new Tile(2400,height - 100,50,50));
            tiles.add(new Tile(2600,height - 100,50,50));
            tiles.add(new Tile(2800,height - 120,50,50));
            tiles.add(new Tile(3000,height - 140,50,50));
            tiles.add(new Tile(3200,height - 160,50,50));
            tiles.add(new Tile(3500,height - 200,50,50));
            tiles.add(new Tile(3600,height - 320,50,50));
            tiles.add(new Tile(4000,height - 100,50,50));
            tiles.add(new Tile(4500,height - 100,width,200));
            break;
    }
}

void drawTiles() {
    for (int a = 0; a < tiles.size(); a++) {
        tiles.get(a).draw();
    }
}

class Character {
    PVector loc;
    PVector movement;
    int rectWidth = 30;
    int rectHeight = 30;
    int speed = 3;
    int counter = 0;
    boolean onGround = false;
    int lives = 3;
    int boost = 180;
    int boostLimit = 180;
    int cooldown = 0;
    boolean right = false;
    //find a way to trigger this on and off
    //when turbo is on it can attack enemies
    boolean turbo1 = false;
    Character() {
        loc = new PVector(20,height - 80 - rectHeight);
        movement = new PVector(0,0);
    }
    
    void update() {
        gravity();
        for (int a = 0; a < tiles.size(); a++) {
            checkTile(tiles.get(a));
        }
        onGround = checkGround();
        checkLife();
        draw();
        movement.set(0,movement.y);
        if (boost < boostLimit) {
            boost++;
        }
        if (cooldown > 0) {
            cooldown--;
        }
        drawBoost();
    }
    
    void drawBoost() {
        fill(100,50,50);
        rect(width - 120, 20, 104, 20);
        fill(0);
        rect(width - 118, 22, 100, 16);
        int percent = (float)(boost / boostLimit) * 100;
        if (cooldown > 0) {
            fill(80,100,150);
        } 
        else {
            fill(50,100,50);
        }
        rect(width - 118, 22, percent, 16);
    }
    
    void turbo() {
        if (boost > 0) {
            if (cooldown <= 0) {
                if (right) {
                    movement.set(3,movement.y);
                }
                else {
                    movement.set(-3,movement.y);
                }
                boost -=2;
            }
        }
        else {
            movement.set(0,movement.y);
            if (cooldown <= 0) {
                cooldown = boostLimit;
            }
        }
    }
    
    void jump() {
        movement.set(movement.x,-5);
    }
    
    void draw() {
        fill(255);
        rect(loc.x,loc.y,30,30);
    }
    
    void gravity() {
        counter++;
        if (movement.y < 5) {
            if (counter % 10 == 0) {
                movement.add(0,1);
            }
        }
        if (right) {
            if (loc.x <= width - 200) {
                loc.add(movement);
            }
            else {
                loc.add(0,movement.y);
                backCoord.add(-movement.x,0);
            }
        }
        else {
             if (loc.x >= 200) {
                loc.add(movement);
            }
            else {
                loc.add(0,movement.y);
                backCoord.add(-movement.x,0);
            }
        }
    }
    
    void checkLife() {
        if (loc.y > height) {
            lives--;
            backCoord.set(checkpoint,0);
            loc.set(20,0);
        }
        if (lives == 0) {
        
        }
    }
    
    //use distances to check further
    boolean checkTile(Tile t) {
        int x1 = loc.x;
        int x2 = t.loc.x + backCoord.x;
        int y1 = loc.y;
        int y2 = t.loc.y + backCoord.y;
        int a = calcDist(y1,y2 + t.rectHeight);
        int b = calcDist(y1 + rectHeight, y2);
        int c = calcDist(x1,x2 + t.rectWidth);
        int d = calcDist(x1 + rectWidth, x2);
        int ind = getShortest(a,b,c,d);
        if (x1 + rectWidth > x2 && x1 < x2 + t.rectWidth) {
            if (y1 +rectHeight > y2 && y1 < y2 + t.rectHeight){
                switch(ind) {
                    case 0:
                        loc.set(loc.x,y2 + t.rectHeight);
                        movement.set(movement.x,0);
                        break;
                    case 1:
                        loc.set(loc.x,y2 - rectHeight);
                        break;
                    case 2:
                        loc.set(x2 + t.rectWidth,loc.y);
                        break;
                    case 3:
                        loc.set(x2 - rectWidth, loc.y);
                        break;
                }
            }
        }
    }
    
    int getShortest(int a, int b, int c, int d) {
        int[] arr = {a,b,c,d};
        int ind = 0;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < arr[ind]) {
                ind = i;
            }
        }
        return ind;
    }
    
    int calcDist(int i, int i1) {
        return abs(i - i1);
    }
    
    boolean checkGround() {
        for (int a = 0; a < tiles.size(); a++) {
            Tile t = tiles.get(a);
            int x1 = loc.x;
            int x2 = t.loc.x + backCoord.x;
            int y1 = loc.y;
            int y2 = t.loc.y + backCoord.y;
            if (x1 + rectWidth > x2 && x1 < x2 + t.rectWidth) {
                if (y1 + rectHeight == y2) {
                    movement.set(movement.x,0);
                    return true;
                }
            }
        }
        return false;
    }
} 
class Enemy {
    PVector loc;
    PVector movement;
    int rectWidth = 30;
    int rectHeight = 30;
    int speed = 2;
    int counter = 0;
    boolean onGround = false;
    int lives = 1;
    Enemy(int x, int y) {
        loc = new PVector(x,y);
        movement = new PVector(0,0);
    }
    
    void update() {
        move();
        gravity();
        for (int a = 0; a < tiles.size(); a++) {
            checkTile(tiles.get(a));
        }
        onGround = checkGround();
        if (onGround) {
            jump();
        }
        checkLife();
        draw();
    }
    
    void move() {
        if (chara.loc.x < this.loc.x + backCoord.x) {
            loc.add(-speed,0);
        }
        else {
            loc.add(speed,0);
        }
    }
    
    void jump() {
        movement.set(0,-5);
    }
    
    void draw() {
        fill(0);
        rect(loc.x + backCoord.x,loc.y + backCoord.y,30,30);
    }
    
    void gravity() {
        counter++;
        if (movement.y < 5) {
            if (counter % 10 == 0) {
                movement.add(0,1);
            }
        }
        loc.add(movement);
    }
    
    void checkLife() {
        if (loc.y > height) {
            lives--;
            loc.set(20,0);
        }
    }
    
    boolean checkGround() {
        if (loc.y + rectHeight >= height - 80) {
            loc.set(loc.x,height - 80 - rectHeight);
            movement.set(0,0);
            counter = 0;
            return true;
        }
        return false;
    }
    
    //use distances to check further
     //use distances to check further
    boolean checkTile(Tile t) {
        int x1 = loc.x;
        int x2 = t.loc.x;
        int y1 = loc.y;
        int y2 = t.loc.y;
        int a = calcDist(y1,y2 + t.rectHeight);
        int b = calcDist(y1 + rectHeight, y2);
        int c = calcDist(x1,x2 + t.rectWidth);
        int d = calcDist(x1 + rectWidth, x2);
        int ind = getShortest(a,b,c,d);
        if (x1 + rectWidth > x2 && x1 < x2 + t.rectWidth) {
            if (y1 +rectHeight > y2 && y1 < y2 + t.rectHeight){
                switch(ind) {
                    case 0:
                        loc.set(loc.x,y2 + t.rectHeight);
                        break;
                    case 1:
                        loc.set(loc.x,y2 - rectHeight);
                        break;
                    case 2:
                        loc.set(x2 + t.rectWidth,loc.y);
                        break;
                    case 3:
                        loc.set(x2 - rectWidth, loc.y);
                        break;
                }
            }
        }
    }
    
    int getShortest(int a, int b, int c, int d) {
        int[] arr = {a,b,c,d};
        int ind = 0;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < arr[ind]) {
                ind = i;
            }
        }
        return ind;
    }
    
    int calcDist(int i, int i1) {
        return abs(i - i1);
    }
    
    boolean checkGround() {
        for (int a = 0; a < tiles.size(); a++) {
            Tile t = tiles.get(a);
            int x1 = loc.x;
            int x2 = t.loc.x;
            int y1 = loc.y;
            int y2 = t.loc.y;
            if (x1 + rectWidth - 1 > x2 && x1 < x2 + t.rectWidth - 1) {
                if (y1 + rectHeight == y2) {
                    return true;
                }
            }
        }
        return false;
    }
    
    boolean checkCollision() {
    }
}

class Tile {
    PVector loc;
    int rectWidth;
    int rectHeight;
   
    Tile(int x, int y, int xLen, int yLen) {
        loc = new PVector(x,y);
        rectWidth = xLen;
        rectHeight = yLen;
    }
    
    void draw() {
        fill(100,160,80);
        rect(backCoord.x + loc.x,backCoord.y +loc.y,rectWidth,rectHeight);
    }
}     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
