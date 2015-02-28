
void setup() {
  size (800, 600);
  background (10, 80, 100);
}

void draw() {
  if (mousePressed) {
    background (10, 80, 100);
  }
  
  stroke (0);
  fill (mouseX, 10, 10);
  ellipse (mouseX, mouseY, 200, 200);
  
}
  
