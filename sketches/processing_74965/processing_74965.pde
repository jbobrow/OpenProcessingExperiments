
void setup() {
  size (400, 400);
}

void draw() {
  background(56, 35, 78);
  noStroke();
  for (int y = 30; y <= height; y = y + 40) {
    for (int x = 30; x <= width; x = x + 40) {
      fill(255);
      ellipse(x, y, 20, 20);
    }
  }
  for (int y = 0; y <= height; y = y + 40) {
    for (int x = 0; x <= width; x = x + 40) {
      fill(0);
      rect(x, y, 30, 30);
    }
  }
}
