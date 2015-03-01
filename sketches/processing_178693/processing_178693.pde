
void setup() {
  size(680, 680);
}

void draw() {
  if (mousePressed) {
    fill(23,23,45);
  } else {
    fill(23,23,45);
  }
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(mouseY, mouseX, 10, 10);
}
