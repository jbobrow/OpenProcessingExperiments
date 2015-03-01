
void setup() {
  size(800, 800);
}

void draw() { 
  println (mousePressed);
  if (mousePressed) {
    fill(83, 179, 250);
    ellipse (mouseX, mouseY, 40, 40);
  }
  else {
   fill(253, 83, 108);
    ellipse (mouseX, mouseY, 10, 10);
  }
}
