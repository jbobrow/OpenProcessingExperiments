
PImage bg;
PImage myblue;
PImage mygreen;
PImage myclear;



void setup() {
  size(800, 400);
  bg = loadImage("bg.jpg");
  myblue = loadImage("blue.jpg");
  mygreen = loadImage("green.jpg");
  myclear = loadImage("clear.png", "png");
  frameRate(1);
}

void draw() {
  imageMode(CORNERS);

  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(100, 500);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(50, 100);
  //tint(r, g, b, a);
  image (bg, 0, 0, 960, 540);

  imageMode(CENTER);
  x = random(width);
  y = random(height);
  d = random(100, 300);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(r, g, b, a);


  image(myblue, x, y, d, d);

  x = random(width);
  y = random(height);
  d = random(100, 300);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(r, g, b, a);

  image(mygreen, x, y, d, d);

  x = random(width);
  y = random(height);
  d = random(100, 300);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(50, 100);
  tint(r, g, b, a);
  image(myclear, x, y, d, d);
}


