
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage notebook;
PImage read;

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

  frameRate(1.5);
}

void draw() {
  background(255);

  image(notebook, 0, 0, 600, 600);
  //planet
  float x = random(width);
  float y = random(height/2);
  float v = random(80);
  image(a, 300, y);
  image(b, x, y+10);
  image(c, v-30, y+30);
  image(d, x-10, x);
  image(e, y, v+10);
  image(f, x+15, y+10);
  image(read, random(100, 120), random(50,100),200,500);
}



