
void setup() {
  size(480, 220);
}

void draw() {
  if (mousePressed) {
    fill(mouseX);
  } else {
    fill(255,35,45);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
