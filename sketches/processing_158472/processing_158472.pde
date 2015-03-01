
void setup() {
  size(800, 800);
  noCursor();
}
void draw() {
  background(0);
  fill(0, 255, 77);
  if (mousePressed)


    triangle(mouseX, mouseY, mouseX, mouseY+50, mouseX+50, mouseY+20);
}

