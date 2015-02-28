
ellipse(50, 50, 80, 80);void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
