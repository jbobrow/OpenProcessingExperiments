
PImage img;

int smallPoint = 2;
int largePoint;
int top, left;

void setup() {
  size (800, 527);
  img = loadImage("hemo-color.jpg");
  noStroke();
  background(255);
  smooth();
  largePoint = min(width, height) / 10;
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
}

void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(left + x, top + y, pointillize, pointillize);
}

