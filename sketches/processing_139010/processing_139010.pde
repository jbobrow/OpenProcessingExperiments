
PImage leaf;

int smallPoint = 4;
int largePoint;
int mediumPoint = 4;
int top, left;

void setup() {
  size(700, 700);
  frameRate(20);
  leaf = loadImage("IMGP0643.JPG");
  //img = loadImage("sunflower.jpg");  // an alternative image
  noStroke();
  background(0);
  smooth();
  largePoint = min(width, height) / 20;
  // center the image on the screen
  left = (width - leaf.width) / 2;
  top = (height - leaf.height) / 2;
}

void draw() { 
  float pointillize = map(height, 0, width, smallPoint, largePoint);
  int x = int(random(leaf.width));
  int y = int(random(leaf.height));
  color pix = leaf.get(x, y);
  fill(pix);
  triangle(random (0, width), random (0, height), random (0, width), random(0, height), pointillize, pointillize);
}


