
void setup() {
  size(500,400);
  background (0);
}
void draw() {
    if (mousePressed) {
      background (0);
    } else {
        stroke (0);
        fill (55);
        rect (mouseX, mouseY, 60,60);
        }
    
    stroke (255);
    fill (150);
    ellipse (mouseX, mouseY,60,60);
}
