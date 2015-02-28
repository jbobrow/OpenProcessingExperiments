
void setup() {
  size(690, 690);
  background(247);
}

void draw() {
  stroke(90);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
