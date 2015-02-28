
void setup() {
  size(720, 480);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(255, 0, 0);
  }else {
    noStroke();
  }
  ellipse(mouseX, mouseY, 30, 30);
}
