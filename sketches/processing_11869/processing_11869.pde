
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
}


void blurredLine(float x1, float y1, float x2, float y2) {
  strokeWeight(random(1, 2));
  stroke(0, random(50, 255));
  for(int i = 0; i < 15; i++) {
    line(x1 + random(15), y1 + random(15), x2 + random(15), y2 + random(15));
  }
}


void blurredRect(float x, float y, float w, float h) {
  blurredLine(x, y, x+w, y);
  blurredLine(x+w, y, x+w, y+h);
  blurredLine(x+w, y+h, x, y+h);
  blurredLine(x, y+h, x, y);
}


void mousePressed() {
  blurredRect(mouseX, mouseY, random(40, 100), random(40, 100));
}


void keyPressed() {
  save("blurredRect.png");
}

