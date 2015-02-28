
PImage img;
int smallPoint, largePoint;

void setup() {
  size(600, 927);
  img = loadImage("gator.png");
  smallPoint = 1;
  largePoint = 70;
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




