
void setup() {
  size(500,400);
  background (0);
}
void draw() {
    if (mousePressed) {
        stroke (0);
        fill (55);
        rect (mouseX, mouseY, 60,60);
    } else {
    stroke (255);
    fill (150);
    ellipse (mouseX, mouseY,60,60);
    }
}
