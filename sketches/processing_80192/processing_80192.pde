
void setup() {
  size(450, 320);
}

void draw() {
  if (mousePressed) {
    fill(0, 255, 0, 0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}



