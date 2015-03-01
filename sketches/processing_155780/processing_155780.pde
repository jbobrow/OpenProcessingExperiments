
void setup() {
  size(500,400);
  background (0);
}
void draw() {
    if (mousePressed) {
      background (0);
    }
    stroke (255);
    fill (150);
    ellipse (mouseX, mouseY,60,60);
}
