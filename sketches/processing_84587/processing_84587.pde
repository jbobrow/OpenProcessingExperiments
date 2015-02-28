
void setup() {
  size (200, 200);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  background(0);
  fill((mouseX+mouseY)/2);
  ellipse(mouseX, mouseY, (mouseX+5)/3, (mouseY+5)/3);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
}
