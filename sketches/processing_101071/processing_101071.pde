
int timer=10;  
float fX=220;
float fY=220;
float eX=280;
float eY=280;
float pX=320;
float pY=320;
float easing =.05;
color pColor=color(#0BFF00);
PFont font;

void setup() {
  size(500, 500);
  frameRate(48);
  background(0);
  font=loadFont("AndaleMono-24.vlw");
  textFont(font);
  
} 

void draw() {
  player1();
  virus();
  collisions();
  fill(#FFFFFF);
  text("Level= 1", 25, 480);
  text("KILL THE VIRUS", 25, 30);
  strokeWeight(5);
  fill(#F22C16);
  text("SAVE MANKIND",300,30);
  text("Score= 0",300, 480); 
  fill(#16EDF2);
  
}
void virus() {
  //respawn
  timer++;
  if (timer >=48) {
    fX=random(width);
    fY=random(height);
    timer=0;
  }
  fill(#EDFF03);
  rect(fX, fY, 20, 20);
}
void player1() {
 

  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(pColor);
  ellipse(pX, pY, 30, 30);
}

void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <=25) {
    pColor=color(#3ABF9C);
    pColor=color(#6ABF3A);
  }
  else {
    pColor=color(#0BFF00);
  }
}
