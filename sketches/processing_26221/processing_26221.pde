

int circleSize = 0;


void setup() {
  size(200,200);
  smooth();
  frameRate(15);
}

void draw() {
  background(255);
  stroke(0);
  fill(mouseX, mouseY, 0,150);
 
  ellipse(mouseX,mouseY,circleSize,circleSize);
 
  circleSize = circleSize + 1;

}

