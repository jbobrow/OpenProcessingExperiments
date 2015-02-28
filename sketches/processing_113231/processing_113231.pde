
void drawFace(float x, float y, float size) {
  fill(0, 3*size, 3*size);
  noStroke();
  ellipse(x, y, size, size);
  strokeCap(ROUND);
  stroke(0);
  strokeWeight(size/10.0);
  point(x - (size/4), y - (size/4));
  point(x + (size/4), y - (size/4));
  strokeCap(SQUARE);
  strokeWeight(size/3.0);
  line(x - (size/4), y + (size/6), x + (size/4), y + (size/6));
  for (int i = 0; i < 10; i++) {
    float ang = (i / 10.0) * 2 * 3.1519;
    drawSpoke(x + (size*3/5)*cos(ang), y + (size*3/5)*sin(ang), size/8.0, ang);
  }
}

void drawSpoke(float x, float y, float size, float ang) {
  PVector p1 = new PVector((-size) * cos(ang) - (size) * sin(ang), (-size) * sin(ang) + (size) * cos(ang));
  PVector p2 = new PVector((size) * cos(ang) - (size) * sin(ang), (size) * sin(ang) + (size) * cos(ang));
  PVector p3 = new PVector((0) * cos(ang) - (-size) * sin(ang), (0) * sin(ang) + (-size) * cos(ang));
  fill(30*size, 30*size, 10*size);
  noStroke();
  triangle(p1.x + x, p1.y + y, p2.x + x, p2.y + y, p3.x + x, p3.y + y);
}

void setup() {
  size(500, 500);
  background(0);
  for (float i = 0; i < 20; i+=0.7) {
    drawFace(250 + sin(i) * 5 * i * sqrt(i), 250 + cos(i) * 5 * i * sqrt(i), i*6);
  }
}
