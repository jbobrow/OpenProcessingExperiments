
void setup() {
  size(640, 480);
  background(255);
  ellipseMode(CENTER);
}
void draw() {
  fill(255);
  stroke(0);
  for (int i = 0; i < 10; i ++) {
    for(int j = 0; j < 10; j++) {
      pushMatrix();
      translate((width / 10) * i, (height / 10) * j);
      scale(.1);
      base(i, j);
      stem(i, j);
      glass(i, j);
      drink(i, j);
      top(i, j);
      popMatrix();
    }
  }
}
void base(int i, int j) {
  ellipse(320, 400, 150 + (10 * i), 50 + (10 * j));
}
void stem(int i, int j) {
  beginShape();
  vertex(315 - (2 * i), 260 - (10 * j));
  vertex(315 - (2 * i), 400);
  bezierVertex(315 - (2 * i), 405, 325 + (2 * i), 405, 325 + (2 * i), 400);
  vertex(325 + (2 * i), 260 - (10 * j));
  bezierVertex(325 + (2 * i), 265 - (10 * j), 315 - (2 * i), 265 - (10 * j), 315 - (2 * i), 260 - (10 * j));
  endShape();
}
void glass(int i, int j) {
  curve(250, 480, 325 + (2 * i), 260 - (10 * j), 360 + (10 * i), 50, 300, 0);
  curve(390, 480, 315 - (2 * i), 260 - (10 * j), 280 - (10 * i), 50, 340, 0);
}
void top(int i, int j) {
  fill(255);
  stroke(0);
  ellipse(320, 50, 80 + (20 * i), 25 + (5 * j));
}
void drink(int i, int j) {
  fill(240 - (4 * i), 237 - (22 * i), 184 - (14 * i));
  stroke(0);
  float t = 1.0 - j / 10.0;
  float rx = curvePoint(250, 325 + (2 * i), 360 + (10 * i), 300, t);
  float lx = curvePoint(390, 315 - (2 * i), 280 - (10 * i), 340, t);
  float y = curvePoint(480, 260 - (10 * j), 50, 0, t);
  beginShape();
  curveVertex(250, 480);
  curveVertex(324 + (2 * i), 260 - (10 * j));
  curveVertex(rx - 1, y);
  curveVertex(300, 0);
  vertex(rx - 1, y);
  vertex(lx + 1, y);
  curveVertex(340, 0);
  curveVertex(lx + 1, y);
  curveVertex(316 - (2 * i), 260 - (10 * j));
  curveVertex(390, 480);
  endShape(CLOSE);
}

