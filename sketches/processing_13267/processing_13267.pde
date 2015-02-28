
PImage monright;
PImage moncenter;
PImage moncenterUp;
PImage monleft;
int Px=20;
int Py=400;

void setup() {
  size(500,600);
  smooth();
  monright = loadImage("monster-right.png");
  moncenter = loadImage("monster-center.png");
  moncenterUp = loadImage("monster-centerUp.png");
  monleft = loadImage("monster-left.png");  
  noLoop();
}

void draw () {
  background(255);
  monstdisplay();
}


void monstdisplay() {
  image(monleft, 60,70);
  image(moncenterUp, 120, 60);
  image(moncenter, 120, 140);
  image(monright, 250, 120);
  }
  

