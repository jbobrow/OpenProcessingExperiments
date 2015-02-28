
void setup() {
  size(500, 500);
}
void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(random(73),random(125),random(147));
  }
  ellipse(mouseX, mouseY, 80, 80);
  }
