
boolean button = false;

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

  if (circleX > 230) {
    circleX = circleX-200;
  }
  if (button) {
    circleX = circleX+1;
  }
}
void mousePressed() {
  button=!button;
}


