
boolean moving = false;
int circleX=100;
int circleY=150;
void setup() {
  size (500,500);
}

void draw(){
  background(#0780F5);
  stroke(0);
  fill(0);
  ellipse(circleX,circleY,100,100);
  if (moving) circleX = circleX + 1;
}

void mousePressed() {
  moving=true;
}
