
void setup() {
  size(560, 560);
  background(0);
}

void draw() {
  background(0);
  noStroke();
  for (int x = 100; x < width; x += 120) {
    for (int y = 100; y < height; y += 120) {
      target(x, y);
    }
  }
  noLoop();
}

void target(int x, int y) {
  for (int r = 100; r >= 0; r -= 20) {
    fill(255, 0, 0);
    ellipse(x, y, r, r);
    fill(255);
    ellipse(x, y, r-10, r-10);
  }
}



