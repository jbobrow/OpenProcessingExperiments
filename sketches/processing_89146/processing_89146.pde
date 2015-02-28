
//Ben Norskov In Class Feb 12
void setup() {
  size(300, 300);
}
void draw() {
  background(100, 150, 50);
  line(100, 0, 100, height);
  line(200, 0, 200, height);
  if (mouseX > 100) {
    if (mouseX < 200) {
      ellipse(mouseX, mouseY, 50, 50);
    }
  }

  if ((mouseX > 100) && (mouseX < 200)) {
    ellipse(mouseX, mouseY, 50, 50);
  }
}
