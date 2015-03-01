
int value = 255;

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
