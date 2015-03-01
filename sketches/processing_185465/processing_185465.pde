
PImage img;
int smallPoint, largePoint;
int a = 100;

void setup() {
  size(580, 427);
  img = loadImage("Kings Inn Henrietta Street.jpg");
  smallPoint = 5;
  largePoint = 10;
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


