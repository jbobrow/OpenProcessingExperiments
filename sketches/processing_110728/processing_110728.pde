
// Exercise 4-4a. Reproducing images and using variables.

int backgroundColor = 255;
int strokeColor = 0;
int fillColor = 100;

final int DIAMETER = 50;

int upperLeftX = 50;
int upperLeftY = 50;
int upperRightX = 150;
int upperRightY = 50;
int lowerLeftX = 50;
int lowerLeftY = 150;
int lowerRightX = 150;
int lowerRightY = 150;

void setup() {
  size(200, 200);
}

void draw() {
  background(backgroundColor);
  stroke(strokeColor);
  fill(fillColor);
  ellipse(upperLeftX, upperLeftY, DIAMETER, DIAMETER);
  ellipse(upperRightX, upperRightY, DIAMETER, DIAMETER);
  ellipse(lowerLeftX, lowerLeftY, DIAMETER, DIAMETER);
  ellipse(lowerRightX, lowerRightY, DIAMETER, DIAMETER);

  fillColor += 10;
  lowerLeftX = lowerLeftX + 5;
  lowerRightY = lowerRightY - 5;
  upperRightX = upperRightX - 5;
  upperLeftY = upperLeftY + 5;
}
