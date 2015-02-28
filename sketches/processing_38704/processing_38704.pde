
void setup() {
  size(480, 480);
  smooth();
}
void draw() {
  if (mousePressed) {
    fill(50);
  } else {
    fill(255);
  }
  rectMode (CENTER);
  rect(mouseX, mouseY, 40, 50);
}

