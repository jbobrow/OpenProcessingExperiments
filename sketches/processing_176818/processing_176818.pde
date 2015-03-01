
void setup() {
  size(480, 480);
}

void draw() {
  if (mousePressed) {
    fill(255,0,0);
  } else {
    fill(0,0,255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
