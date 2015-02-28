
// Learning Processing Exercise 13-9. A recursive pattern.

void setup() {
  size(400, 200);
}

void draw() {
  background(200);
  stroke(0);
  branch(width / 2, height, 100);
}

void branch(float x, float y, float h) {
  line(x, y, x - h, y - h);
  line(x, y, x + h, y - h);
  if (h > 2) {
    branch(x - h, y - h, h / 2);
    branch(x + h, y - h, h / 2);
  }
}
