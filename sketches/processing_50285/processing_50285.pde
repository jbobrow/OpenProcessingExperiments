
void setup() {
  size(400, 400);
}

void draw() {
  background(150, 150, 0);
  for (int y= 0; y <= width; y += 10) {
    for (int x = 0; x <= width; x += 10) {
      noStroke();
      fill(x,255-y, 100);
      ellipse(x, y, 10, 10);
    }
  }
}


