
void setup() {
  size(1280, 800);
  background(255);
}

void draw() {

if (mousePressed) {
  noStroke();
  fill(0);
  rect(mouseX, mouseY, 50, 50, 7, 7, 7, 7);
}
if (keyPressed && key == 'c') {
  for (int i = 0; i <= 100; i++) {

    int r = (int) random(100, 255);
    int g = (int) random(100, 255);
    int b = (int) random(100, 255);

    int size = (int) random(1, 600);
    int x = (int) random(1, 1280);
    int y = (int) random(1, 800);
    color circleColor = color(r, g, b);

    drawCircle(x, y, size, circleColor);
  }
}
}
void drawCircle(float x, float y, float size, color circleColor) {
  fill(circleColor);
  ellipse(x, y, size, size);
}
