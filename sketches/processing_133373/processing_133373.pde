
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(1);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
