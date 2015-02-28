
int value = 0;
void draw() {
  background(255,0,0);
  fill(value);
  rect(25, 25, 50, 50);
}

void keyReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
