
void setup() {
  size(500, 500);
  frameRate(10);
}

void draw() {
  for (int x = 0; x < width; x += 20) {
    for (int y = 0; y < height; y += 20) {
      fill(random(255));
      rect(x, y, 20, 20);
    }
  }
}
