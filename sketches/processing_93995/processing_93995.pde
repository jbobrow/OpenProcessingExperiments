
import fisica.util.nonconvex.*;
import fisica.*;

/*==========FIELDS==========*/
PFont font = createFont("Arial", 16, true);

FWorld myWorld;

Player myPlayer;
Coin[] myCoins;
int myScore;
int myLives;
int myLevel;

int time;

boolean isAlive;

boolean start;

int numBalls;

boolean upKey;
boolean leftKey;
boolean rightKey;

boolean allowPower;
int powerUpTime;
boolean invincible;
int doubleP;
boolean clear;
boolean life;
int powerTimer;

PImage myCoinImg = loadImage("coin.png");


/*==========METHODS=========*/
void setup() {
  size(1200, 700);
  background(255);

  Fisica.init(this);

  isAlive = false;
  start = true;
}

void draw() {
  background(255);

  checkAlive();

  if (isAlive) {
    background(255);

    myPlayer.act(mouseX, mouseY);

    adjustCoins();

    if ((millis() - time) % (1000 / (myLevel + 2)) < 15) {
      setBall();
    }

    checkPowerUpTime();
    checkPower();

    adjustLevel();

    myWorld.step();
    myWorld.draw();

    drawCoins();

    drawText();
  }
  else if (start) {
    startGame();
  }
  else {
    gameOver();
  }
}

void drawText() {
  fill(0);
  stroke(0);
  textAlign(LEFT);
  textFont(font, 16);
  text("Level: " + myLevel, 1090, 50);
  text("Score: " + myScore, 1090, 70);
  text("Lives: " + myLives, 1090, 90);

  if (invincible) {
    fill(255, 0, 0);
    text("INVINCIBLE", 1090, 110);
  }
  else if (doubleP == 2) {
    fill(0, 0, 255);
    text("DOUBLE PTS", 1090, 130);
  }
  else if (life) {
    fill(0, 255, 0);
    text("EXTRA LIFE", 1090, 150);
  }
  else if (clear) {
    fill(255, 0, 255);
    text("CLEAR", 1090, 170);
  }
}

void adjustLevel() {
  if ((int)((millis() - time) / 10000) != myLevel) {
    allowPower = true;
  }
  myLevel = (int)((millis() - time) / 10000);
}

void setPowerUpTime() {
  powerUpTime = (int)random(3000, 8000);
}

void checkPowerUpTime() {
  if (millis() % 10000 > powerUpTime && allowPower) {
    setPowerUp();
    setPowerUpTime();
    allowPower = false;
  }
}

void setPowerUp() {
  Ball b = new Ball((int)random(max(50 - myLevel * 5, 5), 30), 1);
  b.setPosition(random(50, 1150), -b.getSize()/2);
  b.setRestitution(random(1.5, 3));
  b.setVelocity(random(0, myLevel), random(0 + myLevel * 4, myLevel * 6));
  b.setFill(0, 0, 0);
  b.setStroke(255, 0, 0);
  int p = (int)random(0, 5.5);
  switch(p) {
  case 0:
  case 1:
    b.setName("invincible");
    break;
  case 2:
  case 3:
    b.setName("doubleP");
    break;
  case 4:
    b.setName("life");
    break;
  case 5:
    b.setName("clear");
    break;
  }
  myWorld.add(b);
}


void setBall() {
  if (numBalls < myLevel * 3 + 10) {
    Ball b = new Ball((int)random(myLevel * 5 + 30, 80));
    b.setPosition(random(50, 1150), -b.getSize()/2);
    b.setRestitution(random(1.5, 3));
    b.setVelocity(random(0, myLevel), random(0 + myLevel * 2, myLevel * 5));
    b.setFill((int)random(10, 250), (int)random(10, 250), (int)random(10, 250));
    b.setNoStroke();
    b.setName("ball");
    myWorld.add(b);
    numBalls++;
  }
}

void setCoins() {
  for (int i = 0; i < 5; i++) {
    if (myCoins[i] == null) {
      myCoins[i] = new Coin((int)random(50, 1150), (int)random(492, 680));
    }
  }
}

void drawCoins() {
  for (int i = 0; i < myCoins.length; i++) {
    myCoins[i].drawCoin();
  }
}

void adjustCoins() {
  float px = myPlayer.getBound().getX() - 15;
  float py = myPlayer.getBound().getY() - 15;

  for (int i = 0; i < myCoins.length; i++) {
    float cx = myCoins[i].getX();
    float cy = myCoins[i].getY();

    if (((cx >= px && cx <= px + 30) && (cy >= py && cy <= py + 30)) ||
      ((cx + 17 >= px && cx + 17 <= px + 30) && (cy >= py && cy <= py + 30)) ||
      ((cx >= px && cx <= px + 30) && (cy + 17 >= py && cy + 17 <= py + 30)) ||
      ((cx + 17 >= px && cx + 17 <= px + 30) && (cy + 17 >= py && cy + 17 <= py + 30))) {
      myCoins[i] = null;
      myScore = myScore + 2 * doubleP;
    }
  }
  setCoins();
}

void contactStarted(FContact c) {
  FBody obj = null;
  if (c.getBody1() == myPlayer.getBound()) {
    obj = c.getBody2();
  } 
  else if (c.getBody2() == myPlayer.getBound()) {
    obj = c.getBody1();
  } 
  else {
    if (c.getBody1() == myWorld.bottom || c.getBody1() == myWorld.left || c.getBody1() == myWorld.right) {
      obj = c.getBody2();
    }
    else if (c.getBody2() == myWorld.bottom || c.getBody1() == myWorld.left || c.getBody1() == myWorld.right) {
      obj = c.getBody1();
    }

    if (obj == null) {
      return;
    }

    if (obj.getName() != null && obj.getName().equals("ball")) {
      if (!(((Ball)obj).checkHits())) {
        ((Ball)obj).addHit();
        return;
      }
      else {
        myWorld.remove(obj);
        numBalls--;
        myScore = myScore + 1 * doubleP;
        return;
      }
    }
    else {
      if (obj.getName() != null && (obj.getName().equals("invincible") || obj.getName().equals("doubleP") || obj.getName().equals("clear") || obj.getName().equals("life"))) { 
        if (!(((Ball)obj).checkHits())) {
          ((Ball)obj).addHit();
          return;
        }
        else {
          myWorld.remove(obj);
          myScore = myScore + 1 * doubleP;
          return;
        }
      }
    }
  }

  if (obj == null) {
    return;
  }

  if (obj.getName() != null && obj.getName().equals("ball")) {
    myWorld.remove(obj);
    numBalls--;
    if (!invincible) {
      myLives--;
      myScore = myScore + 3 * doubleP;
    }
    checkAlive();
  }
  else if (obj.getName() != null && obj.getName().equals("invincible")) {
    myWorld.remove(obj);
    invincible = true;
    doubleP = 1;
    life = false;
    clear = false;
    myPlayer.getBound().setFill(255, 0, 0);
    powerTimer = millis();
  }
  else if (obj.getName() != null && obj.getName().equals("doubleP")) {
    myWorld.remove(obj);
    invincible = false;
    doubleP = 2;
    life = false;
    clear = false;
    myPlayer.getBound().setFill(0, 0, 255);
    powerTimer = millis();
  }
  else if (obj.getName() != null && obj.getName().equals("life")) {
    myWorld.remove(obj);
    invincible = false;
    doubleP = 1;
    life = true;
    clear = false;
    myLives++;
    myPlayer.getBound().setFill(0, 255, 0);
    powerTimer = millis();
  }
  else if (obj.getName() != null && obj.getName().equals("clear")) {
    myWorld.remove(obj);
    invincible = false;
    doubleP = 1;
    life = false;
    clear = true;
    myPlayer.getBound().setFill(255, 0, 255);
    removeBalls();
    powerTimer = millis();
  }
}

void removeBalls() {
  ArrayList<FBody> objs = myWorld.getBodies();
  for (FBody obj : objs) {
    if (obj.getName() != null && obj.getName().equals("ball")) {
      myWorld.remove(obj);
    }
  }
}

void checkPower() {
  if (millis() - powerTimer > 3000) {
    invincible = false;
    doubleP = 1;
    clear = false;
    life = false;
    myPlayer.getBound().setFill(0, 0, 0);
  }
}

void checkAlive() {
  if (myLives == 0) {
    isAlive = false;
  }
}

void keyPressed() {
}

void keyReleased() {

  if (keyCode == 'R' && !isAlive) {
    if(start){
      start = false;
    }
    restart();
  }
}

void restart() {
  myWorld = new FWorld();
  myWorld.setEdges();
  myWorld.remove(myWorld.top);
  myWorld.setGravity(0, 50);

  myPlayer = new Player(50, 50);

  myCoins = new Coin[5];
  setCoins();

  myScore = 0;

  myLives = 3;
  isAlive = true;

  myLevel = 0;

  numBalls = 0;

  setPowerUpTime();

  allowPower = true;

  invincible = false;
  doubleP = 1;
  clear = false;
  life = false;

  setBall();

  time = millis();
}

void startGame() {
  stroke(0);
  fill(0);
  textFont(font, 40);
  textAlign(CENTER);
  text("Dodgeball", width / 2, height / 2);

  textFont(font, 16);
  text("Dodgeball is a combination of two games, Tilt to Live and Falling Balls. The objective of Dodgeball is to move your piece (the black circle)", width / 2, height / 2 + 100);
  text("with your mouse and avoid the falling bouncy balls while collecting coins for points. Normal balls that can hurt your have no outline.", width / 2, height / 2 + 120);
  text("Powerup balls are black with a red outline and can give your one of 4 powerups: invincibility, double points, an extra life, or clearing", width / 2, height / 2 + 140);
  text("the game of balls that hurt you. Invincibility turns your piece red for 3 seconds and allows you to attack other balls for extra points.", width / 2, height / 2 + 160);
  text("Double points turns your piece blue for 3 seconds and doubles all points your earn in that time. Earning an extra life turns your piece", width / 2, height / 2 + 180);
  text("for a short time. The clear powerup clears the board of all balls and turns your piece purple for 3 seconds. You start with 3 lives.", width / 2, height / 2 + 200);

  text("Press the 'R' key to start.", width / 2, height / 2 + 250);
}

void gameOver() {
  stroke(0);
  fill(0);
  textFont(font, 40);
  textAlign(CENTER);
  text("Game Over", width / 2, height / 2);

  textFont(font, 16);
  text("Level: " + myLevel, width / 2, height / 2 + 50);
  text("Score: " + myScore, width / 2, height / 2 + 70);

  text("Press the 'R' key to restart.", width / 2, height / 2 + 200);
}

class Ball extends FCircle{
  /*==========FIELDS==========*/
  int hits;
  int hitLimit;
  
  /*==========CONSTRUCTORS==========*/
  Ball(int diameter){
    super(diameter);  
    hits = 0;
    hitLimit = 2;
  }
  
  Ball(int diameter, int hl){
    super(diameter);  
    hits = 0;
    hitLimit = hl;
  }
  
  /*==========METHODS==========*/
  boolean checkHits(){
    if(hits >= hitLimit){
      return true;
    }
    return false;
  }
  
  void addHit(){
    hits++;
  }
  
}
class Coin{
  /*==========FIELDS==========*/
  PImage myCoinImg;
  
  int x;
  int y;
  
  /*==========CONSTRUCTORS==========*/
  Coin(int x0, int y0){
    myCoinImg = loadImage("coin.png");
    
    x = x0;
    y = y0;
  }
  
  /*==========METHODS==========*/
  void drawCoin(){
    image(myCoinImg, x, y);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
}

class Player {
  /*==========FIELDS==========*/
  PImage myImage;
  FCircle myBound;
  float easing = 0.05;

  /*==========CONSTRUCTORS==========*/
  Player(int x, int y) {
    myBound = new FCircle(30);
    myBound.setPosition(x, y);
    myBound.setRotatable(false);
    myBound.setRestitution(0);
    myBound.setFillColor(#000000);
    myBound.setNoStroke();
    myBound.setFriction(0);
    myBound.setStatic(true);
    myWorld.add(myBound);
  }

  /*==========METHODS==========*/
  public void act(float mx, float my) {
    float x = myBound.getX();
    float dx = mx - x;
    if(abs(dx) > 1){
      x += dx * easing;
    }
    
    float y = myBound.getY();
    float dy = my - y;
    if(abs(dy) > 1){
      y += dy * easing;
    }
    
    myBound.setPosition(x, y);
  }

  public void setPosition(int x, int y) {
    myBound.setPosition(x, y);
  }

  public FCircle getBound() {
    return myBound;
  }
}



