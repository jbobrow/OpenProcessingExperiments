
PShape s;
PShape m;

float x=255;

float PX=0;
float PY=0;
float BX=0;
float BY=0;

float XSpeed=0.010;
float YSpeed=0.10;
float BSpeed= -1;


float w=0;
float h=0;

void setup() {
  m = loadShape("BG_City.svg");
  s = loadShape("Processing-Plane.svg");
  size(800, 500);
  smooth();
}
void draw() {
  noStroke();

  x = x -0.25;

  background(0);

  PX = PX + XSpeed;
  PY = PY + YSpeed;
  BX = BX + BSpeed;
  BY = BY + 0;
  //y=height/2;
  w=20;
  h=20;

  if ((PX<0) || (PX>20)) {
    XSpeed = XSpeed* -1;
  }

  if ((PY<0) || (PY>20)) {
    YSpeed = YSpeed* -1;
  }

  if (BX<-5000) {
    BX = 800;
  }

  fill(255);
  ellipse(50, 50, 50, 50);
  fill(random(255));

  ellipse(700, 50, 3, 3);
  ellipse(600, 30, 3, 3);
  ellipse(500, 30, 3, 3);
  ellipse(160, 60, 3, 3);


  shape(m, BX, 50, 6000, 500);
  shape(s, PX +width/4, PY+height/4, 150, 70);
}


