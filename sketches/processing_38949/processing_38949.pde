
PImage img;

int smallPoint = 1;
int largePoint;
int top, left;

void setup() {
  size(700, 700);
  img = loadImage("mitts.jpg");
  noStroke();
  background(0);
  smooth();
  largePoint = min(width, height) / 50;
  // center the image on the screen
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



