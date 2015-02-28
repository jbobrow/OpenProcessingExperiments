
// Learning Processing Exercise 13-7. Breathe.

float theta = 0.0;

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  int r = 100 + (int)((sin(theta) + 1) * (width / 4));
  noStroke();
  fill(33, 200 - (sin(theta) + 1) * 100);
  ellipse(width / 2, height / 2, r, r);
  theta += mouseX / float(5 * width);
}
