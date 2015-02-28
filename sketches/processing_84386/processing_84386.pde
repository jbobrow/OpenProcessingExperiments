
List<PVector> vertices;

void setup() {
  size(640, 640);
  smooth();

  vertices = new ArrayList<PVector>();
}

void draw() {
  background(255);

  // draw curve
  stroke(0, 0, 255);
  strokeWeight(1);
  drawCurveVertex();

  // draw bezier curve
  stroke(255, 0, 0);
  strokeWeight(1);
  drawBezierVertex();

  // draw straght lines
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
  for (PVector v : vertices)
    vertex(v.x, v.y);
  endShape();

  // draw points
  strokeWeight(5);
  for (PVector v : vertices)
    point(v.x, v.y);
}

void mouseClicked() {
  vertices.add(new PVector(mouseX, mouseY));
}

void keyPressed() {
  vertices.clear();
}

void drawCurveVertex() {
  noFill();
  beginShape();
  for (PVector v : vertices)
    curveVertex(v.x, v.y);
  endShape();
}

void drawBezierVertex() {
  if (vertices.size() <= 0)
    return;

  noFill();
  beginShape();
  PVector begin = vertices.get(0);
  vertex(begin.x, begin.y);
  for (int i = 1; vertices.size()-i >= 3; i+=3) {
    PVector[] v = new PVector[3];
    for (int j = 0; j < v.length; j++) {
      v[j] = vertices.get(i+j);
    }
    bezierVertex(v[0].x, v[0].y,
             v[1].x, v[1].y,
             v[2].x, v[2].y);
  }
  endShape();
}


