
void setup() {
  size(600,450);
}

void draw() {
  background(255);
  noStroke();
  for (int i = 0; i < height; i += 20) {
    fill(140, 210, 247);
    ellipse (0, i, width, 10);
    fill(204, 147, 120);
    ellipse (i, 0, 10, height);
  }
}

