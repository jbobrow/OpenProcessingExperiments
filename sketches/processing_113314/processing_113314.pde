
// Exercise 5-9. A more interesting bouncing ball.

int x = 0;
int y = 50;
float horizontalSpeed = 1;
float verticalSpeed = 1;
int horizontalDirection = 1;
int verticalDirection = 1;
int diameter = 32;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  if (x >= width || x < 0) {
    horizontalDirection *= -1;
    ++diameter;
    ++horizontalSpeed;
  }
  if (y >= height || y < 0) {
    verticalSpeed *= -1;
  }
  x += horizontalSpeed * horizontalDirection;
  y += verticalSpeed * verticalDirection;

  stroke(0);
  fill(175);
  ellipse(x, y, diameter, diameter);
  println(horizontalSpeed);
}
