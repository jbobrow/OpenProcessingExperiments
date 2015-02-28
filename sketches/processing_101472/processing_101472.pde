
//startMenu
float sX=250;
float sY=450;
//virus
int timer=10;  
float vX=220;
float vY=220;
PImage virus;
//player
int player1;
float pX=320;
float pY=320;
float easing =.10;
color pColor=color(#0BFF00);
PFont font;
//level
int level=0;
int erase;
//gui and counters
int gui;
int vValue=5;
int scaler =100;
int pDist;

void setup() {
  size(700, 700);
  virus=loadImage("virus.jpg");
  frameRate(24);
  background(0);
  font=loadFont("AndaleMono-24.vlw");
  textFont(font);
} 

void draw() {
  smooth();
  strokeWeight(10);
  levelUp();
}
void virus() {
  //respawn
  timer++;
  if (timer >=50) {
    vX=random(width);
    vY=random(height);
    timer=10;
  }
  image(virus, vX, vY, 40, 40);
}
void player1() {
  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(#12F207);
  ellipse(pX, pY, 50, 50);
}
void startMenu() {
  image(virus, 400, 450);
  textSize(28);
  fill(#FA4423);
  text("A LETHAL VIRUS THREATENS MANKIND",115,180);
  text("CAN YOU STOP IT BEFORE IT'S TOO LATE?", 95, 220);
 
  fill(#FFFFFF);
  text("START", sX, sY);
  float pStart = dist(mouseX, mouseY, sX, sY);
  if (mousePressed && pStart <=100) {
    vValue=5;
    level=1;
  }
}  
void levelUp() {
  if (level ==0) {
    startMenu();
  }
  if (level== 1) {
    level1();
  }
  if (level==2) {
    level2();
  }
}
void level1() {
 background(0);
  virus();
  player1();
  gui();
  erase();
}
void level2() {
  background(0);
  fill(#FFFFFF);
  text("GAME OVER", sX, sY);
  fill(#F50727);
  text("YOU SAVED THE WORLD", 180, 180);
  gui();
}
void erase() {
  float pDist=dist(pX, pY, vX, vY);
  if (pDist <=30) {
    vX=random(400, 400);
    vY=random(400, 400);
    vValue += 5;
  }
  if (vValue >= 50) {
    level = 2;
  }
}

void gui() {
  textSize(36);
  textAlign(LEFT, BOTTOM);
  fill(#FAE121);
  text("SCORE = " + vValue, 5, 500);
}
