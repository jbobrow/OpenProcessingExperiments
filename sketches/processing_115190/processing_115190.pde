
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage cloud;

PImage notebook;
PImage read;

float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;

void setup() {
  size(600, 600);
  smooth();
  a = loadImage("1.png");
  b = loadImage("2.png");
  c = loadImage("3.png");
  d = loadImage("4.png");
  e = loadImage("5.png");
  f = loadImage("6.png");
  notebook = loadImage("lines.png");
  read = loadImage("read.png");
 cloud = loadImage("23.png");

}

void draw() {

  background(0);

  image(notebook, 0, 0, 600, 600);

 float x = offset + cos(angle) * scalar;
     float y = offset + sin(angle) * scalar;
     image(e,x, y );

  image(a, 220+y, x);
     angle += speed;

  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.4) * scalar;
  float y3 = offset + sin(angle + 0.8) * scalar;
  float y4 = offset + sin(angle + 3.8) * scalar; 
  float y5 = offset + sin(angle + 8.8) * scalar; 




  image(b, 460, y4+320);
  image(c, 78, y3+90);
  image(d, 230, y4+30);
  image(f, 315, y2+10);
  
  image(a, 220, y5+200);


  angle += speed;
  
 image(read, 100, 100, 200, 500);

}




