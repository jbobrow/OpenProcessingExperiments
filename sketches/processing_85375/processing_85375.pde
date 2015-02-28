
void setup() {
  size(780,320);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(200);
  } else {
    fill(55);
  }
  ellipse(mouseX,mouseY,80,80);
}


