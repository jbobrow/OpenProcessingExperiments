
void setup() {
  size (200, 200);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  background(0);
  fill((mouseX+mouseY)/2);
  ellipse(mouseX, mouseY, mouseX/3, mouseY/3);
  fill(0);
  ellipse(mouseX, mouseY, mouseX/10, mouseY/10);
}
