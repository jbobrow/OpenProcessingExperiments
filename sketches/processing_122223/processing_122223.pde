
// Learning Processing Example 15-14. Pointillism.

PImage hoff;
final int POINTILLIZE = 16;

void setup() {
  hoff = loadImage("hoff.jpg");
  size(hoff.width, hoff.height);
  background(0);
}

void draw() {
  int x = (int)random(hoff.width);
  int y = (int)random(hoff.height);
  int loc = x + y * hoff.width;
  loadPixels();
  float r = red(hoff.pixels[loc]);
  float g = green(hoff.pixels[loc]);
  float b = blue(hoff.pixels[loc]);
  noStroke();
  fill(r, g, b, 100);
  ellipse(x, y, POINTILLIZE, POINTILLIZE);
}


