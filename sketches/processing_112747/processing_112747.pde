
// Exercise 5-8. Revising Example 4-3 to set a ball in motion once the mouse is pressed.

boolean move = false;

int circleX = 0;
int circleY = 100;

void setup() {
  size(400, 200);
}

void draw() {
  background(100);
  stroke(255);
  fill(0);
  ellipse(circleX, circleY, 50, 50);
  if (move) circleX = constrain(++circleX, 0, width);
}

void mousePressed() {
  move = !move;
}
