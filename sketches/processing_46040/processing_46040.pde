
int direction;
Player protagonist;
Player[] enemies;
boolean[] keys = new boolean[256];
int[] ints = {1, 4, 5, 6};
void setup() {
    size(400,400);
    for (int a = 0; a < keys.size; a++) {
        key[keyCode] = false;
    }
    protagonist = new Player(300, width/2, height/2);
    enemies = new Player[8];
    addEnemies();
    }

void draw() {
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    protagonist.drawProtagonist();
    protagonist.drawSword();
    move();
    for(int x=0; x<8; x++) {
        enemies[x].drawProtagonist();
        enemies[x].enemyMove(protagonist);
    }
    
    }

void addEnemies() {
    for(int x=0; x<8; x++) {
        boolean inRad = false;
        while (!inRad) {
            int x1 = random(width);
            int y1 = random(height);
            if (radCheck(protagonist,x1,y1, 100)) {
                inRad = true;
                enemies[x] = new Player(100, x1, y1);
            }
        }
        
    }
}

boolean radCheck(Player a, int x, int y, int rad) {
    return sqrt((a.xpos - x) * (a.xpos - x) + (a.ypos - y) * (a.ypos - y))> rad;
    
}

void move() {
    if (keys[37]) {
        protagonist.xpos -= 5;
        direction = 4;
    }
    if (keys[38]) {
        protagonist.ypos -= 5;
        direction = 8;
    }
    if (keys[39]) {
        protagonist.xpos += 5;
        direction = 6;
    }
    if (keys[40]) {
        protagonist.ypos += 5;
        direction = 2;
    }
}

void keyReleased() {
    for (int a = 0; a < keys.length; a++) {
        keys[a] = false;
    }
}

void keyPressed() {
    if (keyCode < keys.length) {
        keys[keyCode] = true;
    }
    /*
    if (key == 'a') {
    protagonist.xpos -= 5;
    direction = 4;
    }
    if (key == 'd') {
    protagonist.xpos += 5;
    direction = 6;
    }
    if (key == 's') {
    protagonist.ypos += 5;
    direction = 2;
    }
    if (key == 'w') {
    protagonist.ypos -= 5;
    direction = 8;
    }
    */
    }

class Player {
    int hp, health;
    int xpos, ypos;
    int xvelocity = 0;
    int yvelocity = 0;
    Player(int health, int xpos1,int ypos1) {
    hp = health;
    xpos = xpos1;
    ypos = ypos1;
    }
    
    void drawProtagonist() {
    noStroke();
    fill(50,150,200);
    smooth();
    ellipse(xpos, ypos, 20, 20);
    }
    
    void drawSword() {
    strokeWeight(2);
    stroke(255);
    if (direction == 8) {
    line(xpos, ypos-10, xpos, ypos-30);
    } 
    if (direction == 2) {
    line(xpos, ypos+10, xpos, ypos+30);
    } 
    if (direction == 4) {
    line(xpos-10, ypos, xpos-30, ypos);
    } 
    if (direction == 6) {
    line(xpos+10, ypos, xpos+30, ypos);
    } 
    }
    
    void enemyMove(Player a) {
    xpos += xvelocity;
    ypos += yvelocity;
    if (xpos < a.xpos) {
    xvelocity = .001*a.xpos
    }
    if (xpos > a.xpos) {
    xvelocity = -.001*a.xpos
    }
    if (ypos < a.ypos) {
    yvelocity = .001*a.ypos
    }
    if (ypos > a.ypos) {
    yvelocity = -.001*a.ypos
    }
    }
    
}
    

                
                
                
                                                                                
