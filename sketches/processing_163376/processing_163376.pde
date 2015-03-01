
int value = 0;

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
}

void keyPressed(any key) {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}




