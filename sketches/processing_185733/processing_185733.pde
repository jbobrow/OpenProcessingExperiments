
void setup() {
  size(600, 600);
}
void draw() {
  fill(0, 5); // negro transparente
  rect(0, 0, width, height); // rectangulo que ocupa toda la ventana
  fill(255);
  if (mousePressed) {
    ellipse(mouseX, mouseY, 50, 50);
  }
}

