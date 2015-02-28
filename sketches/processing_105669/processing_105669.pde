
int xPos;
int yPos;

void setup() {
  size(400, 400);
  xPos = 0;
  yPos = 10;
}

void draw() {
  //  background(70, 30, 90);

  // if we want to make a trailing line,
  // fill with a rectangle with a transparent color
  // otherwise, just use the background function above
  fill(70, 30, 90, 50);
  rect(0, 0, width, height);
  fill(255);

  for (int i = 0; i < 10; i++) {
    drawBall(xPos, yPos + (i*50), 20);
  }

  drawBall(xPos, yPos, 20);
  moveBall(3);
  pacManBall();
}

// this function takes three arguments, which
// are used to draw an ellipse with a specific
// x-position, y-position, and diameter
void drawBall(int x, int y, int diameter) {
  ellipse(x, y, diameter, diameter);
}

// this function takes an argument that will be used
// to change the speed of the ball
void moveBall(int speedMultiplier) {
  xPos = xPos + (1 * speedMultiplier);
}

void pacManBall() {
  if (xPos > width + 5) {
    xPos = -5;
  }
}



