
// Exercise 5-6. Fading square tiles in and out based on mouse position.

int centerAxis;
int fillColorUpperLeft = 255;
int fillColorUpperRight = 255;
int fillColorLowerLeft = 255;
int fillColorLowerRight = 255;

void setup() {
  size(400, 400);
  centerAxis = width / 2;
  background(255);
}

void draw() {
  background(255);
  stroke(0);
  if (mouseX < centerAxis && mouseY < centerAxis) {
    --fillColorUpperLeft;
    ++fillColorUpperRight;
    ++fillColorLowerLeft;
    ++fillColorLowerRight;
  } else if (mouseX > centerAxis && mouseY < centerAxis) {
    --fillColorUpperRight;
    ++fillColorUpperLeft;
    ++fillColorLowerLeft;
    ++fillColorLowerRight;
  } else if (mouseX < centerAxis && mouseY > centerAxis) {
    --fillColorLowerLeft;
    ++fillColorUpperLeft;
    ++fillColorUpperRight;
    ++fillColorLowerRight;
  } else if (mouseX > centerAxis && mouseY > centerAxis)  {
    --fillColorLowerRight;
    ++fillColorUpperLeft;
    ++fillColorUpperRight;
    ++fillColorLowerLeft;
  }
  fillColorUpperLeft = constrain(fillColorUpperLeft, 0, 255);
  fillColorUpperRight = constrain(fillColorUpperRight, 0, 255);
  fillColorLowerLeft = constrain(fillColorLowerLeft, 0, 255);
  fillColorLowerRight = constrain(fillColorLowerRight, 0, 255);
  fill(fillColorUpperLeft);
  rect(0, 0, centerAxis, centerAxis);
  fill(fillColorUpperRight);
  rect(centerAxis, 0, width, centerAxis);
  fill(fillColorLowerLeft);
  rect(0, centerAxis, centerAxis, centerAxis);
  fill(fillColorLowerRight);
  rect(centerAxis, centerAxis, height, width);
}
