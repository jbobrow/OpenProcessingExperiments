
void setup() {
  size(1024, 768);
  background(255);
  smooth();
}

void draw() {
  stroke(0, 100);
  line(0, 0, mouseX, mouseY);
  
  // wenn die Maus gedrückt ist…
  if (mousePressed) {
    // zeichne eine ellipse an der Mausposition
    ellipse (mouseX, mouseY, 5, 5);
  }
}

