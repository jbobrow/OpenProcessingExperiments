
void setup() {
  size(400, 400);
  noCursor();
}


void draw() {
  background(0);
  drawCross(0, 0, 150);
  drawCross(0, 250, 150);
  drawCross(250, 0, 150);
  drawCross(250, 250, 150);
  drawCross(mouseX-50, mouseY-50, 100);
}

void mousePressed() {
}

void drawCross(float x, float y, float crossSize) {
  stroke(220, 220, 0);
  strokeWeight(2);
  line(x, y, x + crossSize, y + crossSize);
  line(x + crossSize, y, x, y + crossSize);
}

