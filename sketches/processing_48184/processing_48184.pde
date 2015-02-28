
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(50, 50);
}

void draw() {
  ellipse(mouseX, mouseY, 10, 10);

  if (mousePressed) {
    background(0, 100);
    ellipse(mouseX, mouseY, mouseX, mouseY);
  }
}


