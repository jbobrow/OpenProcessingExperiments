
void setup() {
  size(600, 600);
  background(255);
  noLoop();
  smooth();
}

void draw() {
  stroke(0);
  for (int i = 0; i < width; i = i + 50) {
    for (int j = 0; j < height; j = j +50) {
      strokeWeight(3);
      fill(255);
      ellipse(i, j, 50, 50);
      fill(0);
      ellipse(i+8, j+8, 30, 30);
      fill(255);
      rect(i, j, 100, 100);
      fill(0);
      rect(i+25, j+25, 50, 50);
      fill(255);
      rect(i+35, j+35, 30, 30);
    }
  }
}

