
void setup() {
  size(480, 480);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill (234, 21, 24);
  } else {
    fill (21, 106, 147);
  }
  ellipse(mouseX, mouseY, 50, 50);
}

