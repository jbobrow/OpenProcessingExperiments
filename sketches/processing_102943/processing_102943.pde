
//main file
ArrayList bullets;
ArrayList enemies;

int numCol = 10;
Player player1;
Enemy testEnemy;
boolean keyAPressed = false, keyDPressed = false;
PImage alienImage1;
void setup() {
  size(500, 500);
  imageMode(CENTER);
  alienImage1 = loadImage("data/alien1.jpg");
  startGame();
}

void startGame(){
  player1 = new Player();
  bullets = new ArrayList();
  enemies = new ArrayList();
  generateEnemies(); 
}

void draw() {
  background(0);
  if (player1.lives <= 0){
    startGame();
  }
  showLives();
  player1.display();
  movePlayer1();
  player1.hitCheck();
  handleEnemies();
  handleBullets();
}

void checkEnemiesWall(){
  boolean anyTouchingWall = false;
  for (int i = 0; i < enemies.size(); i++){
    Enemy enemy = (Enemy) enemies.get(i);
//    if (    
  }
}


void showLives(){
  for (int i = 0; i <= player1.lives; i++){
    rect(width-40*i, 10, 30, 30);
  } 
}

void generateEnemies() {
  for (int i = 0; i < 20; i++) {
    float x = width*.1 + i%numCol*50;
    float y = 60 + int(i/numCol)*60 ;
    enemies.add(new Enemy(x, y));
  }
}

void handleEnemies() {
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    enemy.move();
    enemy.display();
    enemy.hitCheck();
    if (random(1) > .995) {
      enemy.shoot();
    }
  }
}


void handleBullets() {
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = (Bullet) bullets.get(i);
    b.move();
    b.display();
  }
}

void movePlayer1() {
  if (keyAPressed) {
    player1.x -=10;
  }
  if (keyDPressed) {
    player1.x +=10;
  }
}

void keyPressed() {
  if (key == 'a') {
    keyAPressed = true;
  }
  else {
    if (key == 'd') {
      keyDPressed = true;
    }
    else {
      if (key == ' ') {
        player1.shoot();
      }
    }
  }
}

void keyReleased() {
  if (key == 'a') {
    keyAPressed = false;
  }
  else {
    if (key == 'd') {
      keyDPressed = false;
    }
  }
}  

//Bullet
class Bullet {
  float x, y;
  float velocity;

  Bullet(float x, float y, float velocity) {
    this.x = x;
    this.y = y;
    this.velocity = velocity;
  }
  
  void display(){
    rect(this.x, this.y, 5,20);
  }
  
  void move(){
    this.y+=this.velocity;
    if (this.y > height || this.y < 0){
      bullets.remove(this);
    }
  }
}
//Enemy

class Enemy {
  float x, y;
  float velocity;
  PImage img;
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    this.velocity = 5;
    this.img = alienImage1;
  }

  void display() {
    ellipse(this.x, this.y, 30, 30);
 //   image(img, this.x, this.y);
  }

  void move() {
    this.x+=this.velocity;
    if (this.x > width*.9) {
      this.x = width*.9;
      this.velocity *= -1;
      this.y+=30;
    }

    if (this.x < width*.1) {
      this.velocity*=-1;
      this.x = width*.1;
      this.y+=30;
    }
  }  
  
  void shoot(){
    Bullet b = new Bullet(this.x, this.y, 5);
    bullets.add(b);
  }

  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++){
      Bullet b = (Bullet) bullets.get(i);      
      float distBetween = dist(b.x, b.y, this.x, this.y);
      if (distBetween < 15 && b.velocity < 0){
        enemies.remove(this);
        bullets.remove(b);
      }
    }
  }
}
boolean rectIntersect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  float[] r1 = new float[8];
  float[] r2 = new float[8];

   r1[0] = x1;
   r1[1] = y1;
   r1[2] = x1+w1;
   r1[3] = y1+h1;
   r1[4] = r1[0];
   r1[5] = r1[3];
   r1[6] = r1[2];
   r1[7] = r1[1];

   r2[0] = x2;
   r2[1] = y2;
   r2[2] = x2+w2;
   r2[3] = y2+h2;
   r2[4] = r2[0];
   r2[5] = r2[3];
   r2[6] = r2[2];
   r2[7] = r2[1];
  
  boolean intersect = false;
  
  for (int i = 0; i < 8; i=i+2){
    if (pointInRectangle(r2[0], r2[2], r2[1], r2[3], r1[i], r1[i+1])){
    intersect = true;
    }
  }
  
  for (int i = 0; i < 8; i=i+2){
    if (pointInRectangle(r1[0], r1[2], r1[1], r1[3], r2[i], r2[i+1])){
    intersect = true;
    }
  }
  return intersect;
}

boolean isBetween(float v1, float v2, float test) {
  if (test < v1 && test > v2) {
    return true;
  }
  else {
    if (test > v1 && test < v2) {
      return true;
    }
    else {
      return false;
    }
  }
}

boolean pointInRectangle(float x1, float x2, float y1, float y2, float xT, float yT) {
  if (((xT < x1 && xT > x2) || (xT > x1 && xT < x2)) && 
    ((yT < y1 && yT > y2) || (yT > y1 && yT < y2))) {
    return true;
  }
  else {
    return false;
  }
}

//Player

class Player {
  float x, y;
  int lives;
  int score;
  boolean canShoot;
  int timeLastShot;
  int coolDown;

  Player() {
    this.x = width/2;
    this.y = height-50;
    this.lives = 3;
    this.timeLastShot = 0;
    this.coolDown = 200;
  }

  void display() {
    rect(this.x, this.y, 30, 30);
  }

  void shoot() {
    if (millis() - timeLastShot > coolDown) {
      Bullet bullet = new Bullet(this.x+12.5, this.y, -5);
      bullets.add(bullet);
      timeLastShot = millis();
    }
  }

  void hitCheck() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = (Bullet) bullets.get(i);
      float distBetween = dist(b.x, b.y, this.x, this.y);
      if (b.velocity > 0 && rectIntersect(this.x, this.y, 30, 30, b.x, b.y, 5, 20)) {
        this.die();
        bullets = new ArrayList();
      }
    }
  }

  void die() {
    this.x = width/2;
    this.lives--;
  }
}



