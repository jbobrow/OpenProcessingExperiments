
float P1AnX, P1AnY;
float P2AnX, P2AnY;
float P3AnX, P3AnY;
float P4AnX, P4AnY;
float P5AnX, P5AnY;
float P6AnX, P6AnY;
float P1posX, P1posY;
float P2posX, P2posY;
float P3posX, P3posY;
float P4posX, P4posY;
float P5posX, P5posY;
float P6posX, P6posY;

void setup() {
  size(800, 600, P3D);
  P1AnX=random(360);
  P1AnY=random(360);
  P2AnX=random(360);
  P2AnY=random(360);
  P3AnX=random(360);
  P3AnY=random(360);
  P4AnX=random(360);
  P4AnY=random(360);
  P5AnX=random(360);
  P5AnY=random(360);
  P6AnX=random(360);
  P6AnY=random(360);
  P1posX=random(-100, 100);
  P1posY=random(-100, 100);
  P2posX=random(-100, 100);
  P2posY=random(-100, 100);
  P3posX=random(-100, 100);
  P3posY=random(-100, 100);
  P4posX=random(-100, 100);
  P4posY=random(-100, 100);
  P5posX=random(-100, 100);
  P5posY=random(-100, 100);
  P6posX=random(-100, 100);
  P6posY=random(-100, 100);
}

void draw() {
  background(0);
  camera(30.0, mouseY, 220.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);     
  P1AnX+=0.5;
  P1AnY+=0.5;
  rotateX(radians(P1AnX));
  rotateY(radians(P1AnY));
  PImage P1;
  P1 = loadImage("P1.png");
  image(P1, 0+P1posX, 0+P1posY);
  P2AnX+=0.5;
  P2AnY+=0.5;
  rotateX(radians(P2AnX));
  rotateY(radians(P2AnY));
  PImage P2;
  P2 = loadImage("P2.png");
  image(P2, 0+P2posX, 0+P2posY); 
  P3AnX+=0.5;
  P3AnY+=0.5;
  rotateX(radians(P3AnX));
  rotateY(radians(P3AnY));
  PImage P3;
  P3 = loadImage("P3.png");
  image(P3, 0+P3posX, 0+P3posY);
  P4AnX+=0.5;
  P4AnY+=0.5;
  rotateX(radians(P3AnX));
  rotateY(radians(P3AnY));
  PImage P4;
  P4 = loadImage("P4.png");
  image(P4, 0+P4posX, 0+P4posY);
  P5AnX+=0.5;
  P5AnY+=0.5;
  rotateX(radians(P5AnX));
  rotateY(radians(P5AnY));
  PImage P5;
  P5 = loadImage("P5.png");
  image(P5, 0+P5posX, 0+P5posY);
  P6AnX+=0.5;
  P6AnY+=0.5;
  rotateX(radians(P6AnX));
  rotateY(radians(P6AnY));
  PImage P6;
  P6 = loadImage("P6.png");
  image(P6, 0+P6posX, 0+P6posY);
}


