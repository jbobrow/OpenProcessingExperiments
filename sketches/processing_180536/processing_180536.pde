
PImage img;
int smallPoint, largePoint;

void setup() {
  size(960, 640);
  img = loadImage("Mardi.jpg");
  smallPoint = 4;
  largePoint = 12;
  imageMode(CENTER);
  noStroke();
  background(255);
  frameRate(200);
}

void draw() { 
  float pointillize = map(mouseX, mouseY, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
}


