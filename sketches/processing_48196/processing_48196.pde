
Character chara;
ArrayList<Enemy> enemies;
ArrayList<Projectile> projs;
boolean keys = new boolean[256];
int limiter = 15;
int timer = 0;
void setup() {
    size(400,450);
    chara = new Character();
    enemies = new ArrayList<Enemy>();
    addEnemies(6);
    projs = new ArrayList<Projectile>();
}

void draw() {
    background(0);
    processKeys();
    stroke(0);
    fill(255);
    chara.checkBounds();
    chara.draw();
    timer++;
    for (int s = 0; s < projs.size(); s++) {
        Projectile a = projs.get(s);
        a.move();
        a.draw();
        
        if (a.counter <= 0) {
            projs.remove(s);
        }
        /*
        if (a.enemy) {
            a.checkPlayerColl();
        }
        else {
            a.checkEnemyColl();
        }
        */
    }
    fill(200,50,50);
    stroke(0);
    for (int a = enemies.size() - 1; a >= 0; a--) {
        enemies.get(a).move();
        enemies.get(a).shoot();
        enemies.get(a).draw();
        if (enemies.get(a).loc.y > height) {
            enemies.remove(a);
            addEnemies(1);
        }
    }
}

void keyReleased() {
     if (keyCode < keys.length) {
        keys[keyCode] = false;
    }
}
 
void keyPressed() {
    if (keyCode < keys.length && keyCode ) {
        keys[keyCode] = true;
    }
}
 
void processKeys() {
    if (keys[37]) {
        chara.loc.add(-chara.speed,0);
    }
    if (keys[38]) {
        chara.loc.add(0,-chara.speed);
    }
    if (keys[39]) {
        chara.loc.add(chara.speed,0);
    }
    if (keys[40]) {
         chara.loc.add(0,chara.speed);
    }
    if (keys[32]) {
        shoot();
    }
}

void shoot() {
    if (timer % limiter == 0) {
     projs.add(new Projectile(chara.loc.x + chara.rectWidth / 2,chara.loc.y,2,5,120,90,false));
     }
}

void addEnemies(int s) {
    for (int a = 0; a < s; a++) {
        enemies.add(new Enemy((int)random(width),-30, (int)random(10), 1));
    }
}    

class Character {
    PVector loc;
    int rectWidth = 30;
    int rectHeight = 30;
    int speed = 4;
    Character() {
        loc = new PVector(width / 2 - rectWidth / 2, height - 60);
    }
    
    void checkBounds() {
        if (loc.x < 0) {
            loc.set(width - rectWidth,loc.y);
        }
        if (loc.x + rectWidth > width) {
            loc.set(0,loc.y);
        }
        if (loc.y < 0) {
            loc.set(loc.x,0);
        }    
        if (loc.y + rectHeight > height) {
            loc.set(loc.x,height - rectHeight);
        }
    }
    
    void draw() {
        rect(loc.x,loc.y,rectWidth,rectHeight);
    }
}

class Enemy {
    PVector loc;
    int rectWidth = 30;
    int rectHeight = 30;
    int speed = 2;
    int b;
    int counter;
    String[] behaviors = {"random","circle","horizontal","charge","charge forw","charge ran","static","follow","vertical","zigzag"};
    int radius;
    int timer = 0;
    int limiter = 15;
    int degree = 270;
    Enemy(int x, int y, int ran, int rad) {
        loc = new PVector(x,y);
        b = ran;
        radius = rad;
    }
    
    void shoot() {
        timer++;
        if (timer % limiter == 0) {
            if (behaviors[b].equals("random")) {
                projs.add(new Projectile(loc.x + rectWidth / 2, loc.y + rectHeight,0,5,120,degree - 5 + random(10), true));
            }
            else if (behaviors[b].equals("circle")) {
                projs.add(new Projectile(loc.x + rectWidth / 2, loc.y + rectHeight / 2,0,5,120,degree, true));
            }
            else if (behaviors[b].equals("horizontal")) {
                projs.add(new Projectile(loc.x , loc.y + rectHeight / 2,0,5,120,degree - 90, true));
                projs.add(new Projectile(loc.x + rectWidth, loc.y + rectHeight / 2,0,5,120,degree + 90, true));
            }
            else if (behaviors[b].equals("charge")) {
               projs.add(new Projectile(loc.x + rectWidth / 2, loc.y + rectHeight,0,5,120,degree, true));
            }
            else if (behaviors[b].equals("charge forw")) {
                projs.add(new Projectile(loc.x + rectWidth / 2, loc.y + rectHeight,0,5,120,degree, true));
            }
            else if (behaviors[b].equals("charge ran")) {
                projs.add(new Projectile(loc.x + rectWidth / 2, loc.y + rectHeight,0,5,120,degree - 5 + random(10), true));
            }
            else if (behaviors[b].equals("static")) {
            
            }
            else if (behaviors[b].equals("follow")) {
                
            }
            else if (behaviors[b].equals("vertical")) {
    
            }
            else if (behaviors[b].equals("zigzag")) {
                
            }
        }
    }
    
    void move() {
        if (behaviors[b].equals("random")) {
            loc.add(5 - random(10),5 - random(10));
        }
        else if (behaviors[b].equals("circle")) {
            degree += speed;
            loc.set(cos(radians(degree)) * radius + loc.x, sin(radians(degree)) * radius + loc.y);
        }
        else if (behaviors[b].equals("horizontal")) {
             loc.add(1,0);
        }
        else if (behaviors[b].equals("charge")) {
           int ran = random(2);
           if (chara.loc.x < this.loc.x) {
               loc.add(-ran,speed);
           }
           else {
               loc.add(ran,speed);
           }
        }
        else if (behaviors[b].equals("charge forw")) {
            loc.add(0,speed);
        }
        else if (behaviors[b].equals("charge ran")) {
            int ran = 2 - random(4);
            loc.add(ran,speed);
        }
        else if (behaviors[b].equals("static")) {
             //loc.add(0,-1);
        }
        else if (behaviors[b].equals("follow")) {
            if (chara.loc.x < this.loc.x) {
                loc.add(-speed,0);
            }
            else {
                loc.add(speed,0);
            }
            if (chara.loc.y < this.loc.y) {
                //loc.add(0,-speed);
            }
            else {
                //loc.add(0,speed);
            }
        }
        else if (behaviors[b].equals("vertical")) {
            loc.add(0,1);
        }
        else if (behaviors[b].equals("zigzag")) {
            
        }
        loc.add(0,1);
    }
    
    void draw() {
        rect(loc.x,loc.y,rectWidth,rectHeight);
    }
}
      
class Projectile {
    PVector loc;
    String[] types = {"normal","large","fast"};
    int type;
    int rad;
    int speed = 5;
    int degree;
    int counter;
    boolean enemy;
    
    Projectile(int x, int y, int t, int r, int c, int d, boolean e) {
        loc = new PVector(x,y);
        type = t;
        rad = r;
        counter = c;
        degree = d;
        enemy = e;
        if (t == 1) {
            rad = r * 2;
        }
        else if (t == 2) {
            speed = speed * 3;
        }
    }
    
    void move() {
        if (types[type].equals("normal")) {
            loc.add(cos(radians(degree)) * speed, -sin(radians(degree)) * speed);
        }
        else if (types[type].equals("large")) {
            loc.add(cos(radians(degree)) * speed, -sin(radians(degree)) * speed);
        }
        else if (types[type].equals("fast")) {
            loc.add(cos(radians(degree)) * speed, -sin(radians(degree)) * speed);
        }
        counter--;
    }
    
    void draw() {
        stroke(255);
        fill(0);
        ellipse(loc.x,loc.y,rad,rad);
    }
    /*
    checkPlayerColl() {
        
        if (loc.x >= chara.loc.x && loc.x <= chara.loc.x + chara.rectWidth && loc.y >= chara.loc.y && loc.y <= chara.loc.y + chara.rectHeight) {
        
        }
        else {
            
        }
       
    }
    
    checkEnemyColl() {
    
    }
    */
}         
                                                                                                                                                                                                                                                                                                                                                               
