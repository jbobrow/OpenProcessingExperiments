
void setup() {
  size(480, 120);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(158, 253, 56);
    stroke(50, 205, 50);
  } else {
    fill(0);
    stroke(0);
  }
  ellipse(mouseX, mouseY, 50, 50);
}



