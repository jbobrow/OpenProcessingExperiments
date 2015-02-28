
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  noStroke();
  for (int x = 100; x < width; x = x+125) {
    for (int y = 100; y < height; y = y+125) {
      for (int h = 75; h > 5; h = h-15) {
        fill(255, 0, 0);
        ellipse(x, y, h, h);
        fill(255);
        ellipse(x, y, h-7.5, h-7.5);
      }
    }
  }
}



