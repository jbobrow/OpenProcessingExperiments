
// Exercise 5-3. Constraining a rectangle's movement.

float x = 0;

void setup() {
  size(400, 200);
  background(255);
}

void draw() {
  background(255);
  fill(0);
  rect(x, 100, 40, 20);
  x = constrain(++x, 0, 100);
}
