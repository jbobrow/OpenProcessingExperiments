
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;

PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;

PImage t1;
PImage t2;
PImage t3;
PImage t4;
PImage t5;
PImage t6;

PImage m1;
PImage m2;
PImage m3;
PImage m4;
PImage m5;
PImage m6;

PImage b1;
PImage b2;
PImage b3;
PImage b4;
PImage b5;
PImage b6;
PImage b7;

void setup() {
  size(640,480);
  smooth();
  noLoop();

  a = loadImage("B1.jpg");
  b = loadImage("B2.jpg");
  c = loadImage("B3.jpg");
  d = loadImage("B4.jpg");
  e = loadImage("B5.jpg");

  p1 = loadImage ("P1.jpg");
  p2 = loadImage ("P2.jpg");
  p3 = loadImage ("P3.jpg");
  p4 = loadImage ("P4.jpg");
  p5 = loadImage ("P5.jpg");
  p6 = loadImage ("P6.jpg");
  p7 = loadImage ("P7.jpg");

  t1 = loadImage ("T1.png");
  t2 = loadImage ("T2.png");
  t3 = loadImage ("T3.png");
  t4 = loadImage ("T4.png");
  t5 = loadImage ("T5.png");
  t6 = loadImage ("T6.png");

  m1 = loadImage ("M1.png");
  m2 = loadImage ("M2.png");
  m3 = loadImage ("M3.png");
  m4 = loadImage ("M4.png");
  m5 = loadImage ("M5.png");
  m6 = loadImage ("M6.png");

  b1 = loadImage ("D1.png");
  b2 = loadImage ("D2.png");
  b3 = loadImage ("D3.png");
  b4 = loadImage ("D4.png");
  b5 = loadImage ("D5.png");
  b6 = loadImage ("D6.png"); 
  b7 = loadImage ("D7.png");
}

void draw() {

  int bg = floor(random(1,5));
  a = loadImage("B"+bg+".jpg");
  image (a,0,0);


  int fg = floor(random(1,7));
  p1 = loadImage("P"+fg+".jpg");
  tint (255,70);
  image (p1,0,0);
  tint (255,255);


  int q = floor(random(1,6));
  t1 = loadImage ("T"+q+".png");
  image (t1,0,0);

  int w = floor(random(1,6));
  m1 = loadImage ("M"+w+".png");
  image (m1,0,0);

  int e = floor(random(1,7));
  b1 = loadImage ("D"+e+".png");
  image (b1,0,0);
}

void mousePressed() {
  redraw();
}


