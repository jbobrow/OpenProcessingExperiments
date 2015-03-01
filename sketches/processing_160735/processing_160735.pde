
Player player;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
Enemy enemy;
boolean hasShot = false;
void setup() {
size(720, 480);
player = new Player();
bullets = new ArrayList();
enemies = new ArrayList();
bullets.add(new Bullet(25, 300));

}

void draw() {
    int time = millis()
    background(0);
    player.update();
    //Generate enemies
    if(millis()%200 == 0) {
        enemies.add(new Enemy(random(700), -100));
    }
    //Update Game Objects
    for(int i = 0; i < bullets.size(); i++) {
        bullets.get(i).update();
    }
    
    for(int i = 0; i < enemies.size(); i++) {
        enemies.get(i).update();
    }
}


class Bullet {
    float x;
    float y;
    int width = 5;
    int height = 15;
    Bullet(x, y) {
        this.x = x;
        this.y = y;
    }
    
    void update() {
        y--;
        if(y < -height) {
            bullets.remove(this);
        }
        this.display();
    }
    
    void display() {
        fill(255, 255, 0);
        rect(x, y, width, height);
    }
    
}

class Enemy{
    float x;
    float y;
    int width = 20;
    int height = 30;
    Enemy(x, y) {
        this.x = x;
        this.y = y;
    }
    
    void update() {
    y++;
        if(y > 480 + height) {
            enemies.remove(this);
        }
        this.display();
    }
    
    void display() {
        fill(255, 0, 0);
        rect(x, y, width, height);
    }
    
}

class Player {
float x = 0;
float y = 400;
int width = 20;
int height = 30;
    Player() {
        
    }
    
    void update() {
        this.x = mouseX;
        this.display();
        if(mousePressed) {
            if(!hasShot) {
                bullets.add(new Bullet(this.x + (this.width/ 2) - ((new Bullet(0,0).width) / 2), this.y));
                hasShot = true;
            }
        }
    }
    
    void display() {
        fill(0, 0, 255);
        rect(x, y, width, height);
    }
}

void mouseReleased() {
    hasShot = false;
}
