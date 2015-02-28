
// Exercise 4-3. Growing circle.

int circleSize = 0;
int growthRate = 5;
int circleX = 100;
int circleY = 100;

void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  stroke(255);
  fill(175);
  ellipse(mouseX, mouseY, circleSize, circleSize);
  circleSize += growthRate;
}
