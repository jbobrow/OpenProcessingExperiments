
int circleSize=0;
int circleX=100;
int circleY=100;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  fill(175);
  ellipse(mouseX,mouseY,circleSize,circleSize);
  
  circleSize=circleSize+abs(mouseX-pmouseX)/5;
}
