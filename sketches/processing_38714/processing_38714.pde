
void setup() {
  size(480, 480);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(225);
  }
  ellipse(mouseX, mouseY, 30, 80);
}

