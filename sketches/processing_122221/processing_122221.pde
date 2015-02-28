
PImage paw;
PImage head;
PImage mouse;

int xPoint, yPoint;

float xPos = 0.0;
float yPos = 0.0;
float easing = 20.0;

void setup() {
  size(800, 600);
  smooth();
  stroke(214, 147, 39);
  strokeWeight(40);
  xPoint = int(random(width));
  yPoint = int(random(height));
  noCursor();
  
  paw = loadImage("paw.png");
  head = loadImage("head.png");
  mouse = loadImage("mouse.png");
}

void draw() {
  background(255);
  xPoint = mouseX;
  yPoint = mouseY;
  image(mouse, xPoint - mouse.width/2, yPoint - mouse.height/2);
  line(xPos, yPos + paw.height - 20, width/2, height);
  image(paw, xPos - paw.width/2, yPos-20);
  image(head, width/2, height - head.height + 20);
  if (abs(xPos - xPoint) > 1 || abs(yPos - yPoint) > 1) {
    xPos = xPos + (xPoint - xPos) / easing;
    yPos = yPos + (yPoint - yPos) / easing;
  }

}


