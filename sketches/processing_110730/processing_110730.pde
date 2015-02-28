
// Exercise 4-4c. Reproducing images and using variables.

int circleDiameter = 50;
int centerX = 100;
int centerY = 100;

int backgroundColor = 100;
int strokeColor = 0;
int fillColor = 255;

void setup() {
  size(200, 200);
}

void draw() {
  background(backgroundColor);
  stroke(strokeColor);
  fill(fillColor);
  ellipse(centerX, centerY, circleDiameter, circleDiameter);
  ++centerX;
  --centerY;
  --circleDiameter;
  ++strokeColor;
  --fillColor;
  --backgroundColor;
}
