
// acd 20100819
// simple stripes taken from a photo

PImage img;
int x = 0;

void setup() {
  size(400, 400);
  img = loadImage("wouldbegoods.jpg");
  noStroke();
  smooth();
  frameRate(15);
}

void draw() {
  // stripes
  noSmooth();
  x = mouseX;//(int)random(400);  // mouse control
  //x = (x + 1) % width;  // alternative always looping
  for (int i = 0 ; i < width ; i++) {
    color c = img.get(x, i);
    stroke(c);
    line(0, i, width, i);
  }
  noLoop();
}

void mouseMoved() {
  redraw();
}

