
boolean moving = true;

int circleX = 0;
int circleY = 100;

void setup() {
  size(200,200);
}

void draw() {
  background(100);
  stroke(255);
  fill(0);
  ellipse(circleX,circleY,50,50);
  
if (moving) circleX = circleX + 1;
}

void mousePressed() {
  moving=false;
  
