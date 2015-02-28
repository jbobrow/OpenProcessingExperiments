
void setup() {
  size(480, 120);
  smooth();
  text("Thanasi Stratigakis", 50, 30);
}

void draw() {
  if (mousePressed) {
    fill (8);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY,80, 80);
}


