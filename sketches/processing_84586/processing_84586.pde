
void setup() {
  size (400, 400);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  fill((mouseX+mouseY)/4);
  triangle (135, 200, 265, 200, mouseY, mouseX);
}
