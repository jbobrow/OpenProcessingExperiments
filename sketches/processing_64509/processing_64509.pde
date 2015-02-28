
float  angle;
float rad = 100;
float cx, cy;


PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage p8;
PImage p9;
PImage p10;

void setup() {
  size(625, 351);
  p1 = loadImage("1.png");
  p2 = loadImage("2.png");
  p3 = loadImage("3.png");
  p4 = loadImage("4.png");
  p5 = loadImage("5.png");
  p6 = loadImage("6.png");
  p7 = loadImage("7.png");
  p8 = loadImage("8.png");
  p9 = loadImage("9.png");
  p10 = loadImage("10.png");



  smooth();
  angle = radians(45);
  cx = width /6;
  cy = height/6;
}

void draw() {
  background(#E4EE96);
  float angle = frameCount/10.0;



  float x = cx+cos(angle)*rad;
  float y = cy+cos(angle)*rad;




  image(p7, tan(x), y);
  image(p10, tan(y), x);
  image(p8, x+y, cos(y));
  image(p9, cos(y), sin(y));

  image(p1, x, y);
  image(p2, x-100, y-100);
  image(p6, sin(x), y);


  image(p5, cos(x), y);
  image(p3, x+y, y+x);
  image(p4, y+60, x+60);
}



