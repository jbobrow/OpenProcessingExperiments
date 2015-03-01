
void setup() {
  size(640, 360);
  noSmooth();
  fill(126);
  background(102);
}

void draw() {
  if (mousePressed) {
    fill(255);
  } else {
    fill(0);
  }
  stroke(155);
  ellipse(mouseX, mouseY, 100, 100);
}
