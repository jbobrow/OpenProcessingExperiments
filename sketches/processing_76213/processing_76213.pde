
float enemyX = 200;
float enemyY = 200;
float enemyV = 900;
float enemyZ = 400;
float enemyA = 700;
float enemyB = 600;
float enemyC = 200;
float enemyD = 500;
float enemyE = 800;
float enemyF = 300;
int win = 0;
int timer=10;
int timeLast = 0;
int x = 0;
PFont font;
PImage fail;
PImage olympics;
PImage cool;
PImage good;
void setup() {
  size(1000, 600);
  smooth();
  timeLast=second();
  font = loadFont("Serif.plain-48.vlw");
  textFont(font, 32); 
  good = loadImage("good effort.png");
  fail = loadImage("fail1.png");
  olympics = loadImage("not impressed at all.png");
  cool = loadImage("colordots1.png");
}
void draw() {
  background(125);
  image(cool, 0, 0);
  if (timer>0) {
    game();
  }
  enemyX-=1;
  enemyY-=1;
  enemyV-=2;
  enemyZ-=2;
  enemyA-=1.5;
  enemyB-=1.5;
  enemyC-=1;
  enemyD-=1;
  enemyE-=1;
  enemyF-=1;
  if (enemyV<0|| enemyV>1000) {
    enemyV=random(1000);
  }
  if (enemyZ<0|| enemyZ>600) {
    enemyZ=random(600);
  }
  if (enemyA<0|| enemyA>1000) {
    enemyA=random(1000);
  }
  if (enemyB<0|| enemyB>600) {
    enemyB=random(600);
  }
  if (enemyC<0|| enemyC>1000) {
    enemyC=random(1000);
  }
  if (enemyD<0|| enemyD>600) {
    enemyD=random(600);
  }
  if (enemyE<0|| enemyE>1000) {
    enemyE=random(1000);
  }
  if (enemyF<0|| enemyF>600) {
    enemyF=random(600);
  }
  if (timer==0) {
    if (enemyX<1000&& enemyX>0&& enemyY<600&& enemyY>0){
     win=1; 
    }
    if (win==1) {
       image(good, 0, 0);
    }
  }
}
  void game() {
    if (second()!=timeLast) {
      timeLast=second(); 
      timeLast=second();
      timer-=1;
    }
      if (enemyX<0|| enemyX>1000) {
    image(olympics, 0, 0);
  }
  if (enemyY<0|| enemyY>600) {
    image(fail, 0, 0);
  }
  float a = random(0,255);
  float b = random(0,255);
  float c = random(0,150);
  fill(a, b, c);
   ellipse(enemyX, enemyY, 50, 50);
float d = random(0,255);
  float e = random(0,255);
  float f = random(0,255);
    fill(d, e, f);
    ellipse(enemyV, enemyZ, 50, 50);
    ellipse(enemyV*1.5, enemyZ*1.5, 50, 50);
    ellipse(enemyV*2, enemyZ*2, 50, 50);
    ellipse(enemyV/2, enemyZ/2, 50, 50);
    ellipse(enemyA, enemyB, 50, 50);
    ellipse(enemyA*1.5, enemyB*1.5, 50, 50);
    ellipse(enemyA*2, enemyB*2, 50, 50);
    ellipse(enemyA/2, enemyB/2, 50, 50);
    ellipse(enemyC, enemyD, 50, 50);
    ellipse(enemyC*1.5, enemyD*1.5, 50, 50);
    ellipse(enemyC*2, enemyD*2, 50, 50);
    ellipse(enemyC/2, enemyD/2, 50, 50);
    ellipse(enemyE, enemyF, 50, 50);
    ellipse(enemyE*1.5, enemyF*1.5, 50, 50);
    ellipse(enemyE*2, enemyF*2, 50, 50);
    ellipse(enemyE/2, enemyF/2, 50, 50);
    fill(255, 255, 255);
    text("Timer: "+timer, 520, 50);
  }
  void mousePressed() {
    if (mouseX < enemyX+50 && mouseX > enemyX-50) {
      if (mouseY < enemyY+50 && mouseY > enemyY-50) {
        enemyX=random(1000);
        enemyY=random(600);
      }
    }
  }

