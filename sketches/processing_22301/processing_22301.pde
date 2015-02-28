
void setup() {
  size(1024, 768);
  smooth();
}

void draw() {
  if (mousePressed) {
  fill(25,135,255);
  } else {
    fill(25, 145, 55);
  }
  ellipse(mouseX, mouseY, 80, 80);
}

                                
