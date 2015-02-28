
PImage ship;
PImage bug;
PImage tank;
PImage bg;

Orb[] orb = new Orb[3];
Enemy[] enemy = new Enemy[3];
Gui gui;
StopWatchTimer gt;
int level = 0;
 
 
void setup(){
  size(600,400);
  noStroke();
  textFont(createFont("Aparajita", 48));
  ship = loadImage("poopdone.gif");
  bug = loadImage("enemydone.gif");
  tank = loadImage("orbdone.gif");
  bg = loadImage("bg.png");
  p1 = new Playerguy(2,2);
  gui = new Gui();
  gt = new StopWatchTimer();
  for(int i = 0; i < orb.length; i++){
    orb[i] = new Orb(random(400),random(200));
  }
  for(int i = 0; i < enemy.length; i++){
    enemy[i] = new Enemy(random(500),random(500));
  }
}
 
void draw(){
  image(bg,0,0);
  println(level);
  levelUp();
}
 
void levelUp(){
  if(level == 0){
    gui.startMenu(width/2,height/2);
  }
  if(level == -1){
    gui.gameOver(width/2,height/2);
  }
  if(level == 1){
    levelOne();
  }
  if(level == 2){
    levelTwo();
  }
}
 
void levelOne(){
  noCursor();
  p1.updateP(3);
   level = 1;
  for(int i = 0; i < 1; i++){
    orb[i].updateF();
  }
  for(int i = 0; i < 2; i++){
    enemy[0].updateE(orb[0].xPos, orb[0].yPos);
  }
  if(gui.lifeValue <= 0){
    level = -1;
  }
  if(gui.orbValueC > gui.orbValueE +10){
    level = 2;
    gui.lifeValue = 20;
    gui.levelValue = 2;
  }
  if(gui.countDown <= 0){
    level = -1;
  }
  gui.levelGui();
}
 
void levelTwo(){
  noCursor();
  p1.easing = .8;
  p1.updateP(3);
  for(int i = 0; i < 2; i++){
    orb[i].timer1 = 5000;
    orb[i].updateF();
  }
  for(int i = 0; i < 3; i++){
    enemy[i].easing = .01;
    enemy[1].updateE(orb[1].xPos,orb[1].yPos);
    enemy[0].updateE(orb[0].xPos, orb[0].yPos);
  }
  if(gui.lifeValue <= 0){
    level = -1;
  }
  if(gui.countDown <= 0){
    level = -1;
  }  
  gui.levelGui();
}
 
 
class Enemy {
  float xPos, yPos;
  float targetX;
  float targetY;
  float easing = .01;
  color eC = color(185,194,178);
  Enemy(float tempX, float tempY) {
    xPos = tempX;
    yPos = tempY;
  }
  void updateE( float temptargetX, float temptargetY) {
    targetX = temptargetX;
    targetY = temptargetY;
    xPos += (targetX - xPos) * easing;
    yPos += (targetY - yPos) * easing;
    image(bug,xPos, yPos);
    for (int i = 0; i < orb.length; i++) {
      for (int j = 0; j < enemy.length; j++) {
        float distE = dist(orb[i].xPos, orb[i].yPos, enemy[j].xPos, enemy[j].yPos);
        if (distE < 30) {
          orb[i].xPos = random(600);
          orb[i].yPos = random(400);
          gui.orbValueE += 1;
        }
        float distD = dist(p1.xPos, p1.yPos, enemy[j].xPos, enemy[j].yPos);
        if (distD < 30) {
          gui.lifeValue -= .015;
        } else {
        }
      }
    }
  }
}
 
class Orb{
  float xPos, yPos;
  int savedTime;
 int timer1 = 3000;
  Orb(float tempX, float tempY){
  xPos = tempX;
  yPos = tempY;
  }
   
  void updateF(){
    int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    xPos = random(600);
    yPos = random(400);
    savedTime = millis();
  }
   image(tank, xPos, yPos);
     
  }
}
class Gui {
  float startX, startY;
  int orbValueC = 0, orbValueE = 0, countDown = 60, levelValue;
  float lifeValue = 20;
  Gui() {
  }
 
  void startMenu(float tempstartX, float tempstartY) {
    startX = tempstartX;
    startY = tempstartY;
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(249,253,206);
    text("Collect the Energy Tanks!", width/2, 50);
    textSize(24);
    text("Mouse to move, avoid the bugs!", width/2, 100);
    textSize(28);
    text("Click to Start!", startX, startY);
    float pStart = dist(mouseX, mouseY, startX, startY);
    if (mousePressed && pStart <= 30) {
      level = 1;
      gui.levelValue = 1;
      gt.start();
    }
  }
 
  void levelGui() {
    countDown = 60 - (round(gt.second()));
    textSize(20);
    textAlign(LEFT, TOP);
    fill(250,250,200);
    text("HEALTH = " + round(lifeValue), 10, 10);
    text("SCORE = " + orbValueC, 140, 10);
    text("ENEMY = " + orbValueE, 260, 10);
    text("TIMER = " + countDown, 380, 10);
    text("LEVEL = " + levelValue, 500, 10);
  }
   
  void gameOver(float tempstartX, float tempstartY) {
    cursor();
    startX = tempstartX;
    startY = tempstartY;
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(250,250,200);
    text("You Died!", width/2, height/2 -30);
    textSize(28);
    text("Retry?", startX, startY);
    float pStart = dist(mouseX, mouseY, startX, startY);
    if (mousePressed && pStart <= 30) {
      gt.start();
      gui.lifeValue = 20;
      gui.orbValueE = 0;
      gui.orbValueC = 0;
      level = 1;
      gui.levelValue = 1;
    }
  }
}
 
class Playerguy {
  float xPos, yPos, speed;
  float easing = 0.8;
  Playerguy(float tempXpos, float tempYpos) {
    xPos = tempXpos;
    yPos = tempYpos;
  }
  void updateP(float tempSpeed) {
    speed = tempSpeed;
    if (keyPressed) {
      if (key == 'w') {
        yPos -= speed;
      }
      if (key == 's') {
        yPos += speed;
      }
      if (key == 'a') {
        xPos -= speed;
      }
      if (key == 'd') {
        xPos += speed;
      }
    }
    float targetX = mouseX;
    float targetY = mouseY;
    if(mousePressed){
      xPos += (targetX - xPos) + speed;
      yPos += (targetY - yPos) + speed;
    }
    xPos += (targetX - xPos) * easing;
    yPos += (targetY - yPos) * easing;
    image(ship, xPos-20, yPos-10);
    for (int i = 0; i < orb.length; i++) {
      float distP = dist(xPos, yPos, orb[i].xPos, orb[i].yPos);
      if (distP < 30) {
        orb[i].xPos = random(500);
        orb[i].yPos = random(300);
        gui.orbValueC += 1;
      }
    }
  }
}
 
    class StopWatchTimer {
      int startTime = 0, stopTime = 0;
      boolean running = false;
      void start() {
        startTime = millis();
        running = true;
      }
      void stop() {
        stopTime = millis();
        running = false;
      }
       
    
     
      int getElapsedTime() {
        int elapsed;
        if (running) {
          elapsed = (millis() - startTime);
        }
        else {
          elapsed = (stopTime - startTime);
        }
        return elapsed;
      }
      int second() {
        return (getElapsedTime() / 1000) % 60;
      }
      int minute() {
        return (getElapsedTime() / (1000*60)) % 60;
      }
      int hour() {
        return (getElapsedTime() / (1000*60*60)) % 24;
      }
    }


