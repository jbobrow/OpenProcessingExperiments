
void setup() {
  size(500, 200);
}

void draw() {
  if (mousePressed) {
      }
  noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
