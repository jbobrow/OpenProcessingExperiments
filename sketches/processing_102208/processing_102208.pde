
void setup() {
  size(500, 500);
  strokeWeight(7);
  smooth();
  noCursor();
}

void draw() {
  background(204);
  ellipse(mouseX, mouseY, 10, 10);
}
