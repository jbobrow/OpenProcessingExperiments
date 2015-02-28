
PImage img;
int smallPoint, largePoint;

void setup() {
  size(1000,647);
  img = loadImage("fss.png");
  smallPoint = 5;
  largePoint = 50;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
}

