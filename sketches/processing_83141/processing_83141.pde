
ArrayList <PVector> points;

int pointCount = 8;
PVector startPoint;
PVector endPoint;
float ellipseX;
float ellipseY;
float progress;
PVector p;

PVector p0;
PVector p1;
PVector p2;
PVector p3;

void setup() {
  size(600, 600);
  points = new ArrayList<PVector>();
  for (int i = 0; i < pointCount; i++) {
    PVector p = new PVector(random(100, width-100), random(100, height-100));
    points.add(p);
  }
  for (int i = 0; i < 4; i++) {
    p0 = points.get(i);
    points.add(p0);
  }
  smooth();
}

void draw() {
  background(0);
  noFill();

  float progress1 = map(mouseX, 0, width, 0, 1);
  float progress2 = map(mouseX, 0, width, 0, pointCount);

  stroke(80);
  beginShape();
  for (int i = 0; i < pointCount; i++) {
    p = points.get(i);
    vertex(p.x, p.y);
  }
  endShape();

  int index = floor(progress2);
  startPoint = points.get(index);
  endPoint = points.get(index+1);
  float x = lerp(startPoint.x, endPoint.x, progress2-index);
  float y = lerp(startPoint.y, endPoint.y, progress2-index);
  noStroke();
  fill(80);
  ellipse(x, y, 15, 15);
  noFill();

  stroke(255, 255, 0);
  strokeWeight(6);
  beginShape();
  p = points.get(pointCount-1);
  curveVertex(p.x, p.y);
  for (int i = 0; i < pointCount; i++) {
    p = points.get(i);
    curveVertex(p.x, p.y);
    for (int j = 0; j < 5; j++) {
      float cpX = curvePoint(5, 5, 73, 73, 0);
      float cpY = curvePoint(26, 26, 24, 61, 0);
    }
  }
  p = points.get(0);
  curveVertex(p.x, p.y);
  p = points.get(1);
  curveVertex(p.x, p.y);
  endShape(); 

  strokeWeight(2);
  stroke(255, 0, 0);
  for (int i = 0; i < pointCount; i++) {
    p0 = points.get(i);
    p1 = points.get(i+1);
    p2 = points.get(i+2);
    p3 = points.get(i+3);
    curve(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }

  index = floor(progress2);
  p0 = points.get(index);
  p1 = points.get(index+1);
  p2 = points.get(index+2);
  p3 = points.get(index+3);
  x = curvePoint(p0.x, p1.x, p2.x, p3.x, progress2-index);
  y = curvePoint(p0.y, p1.y, p2.y, p3.y, progress2-index);
  noStroke();
  fill(255,0,0);
  ellipse(x, y, 15, 15);
}

void mousePressed() {
  for (int i = 0; i < pointCount; i++) {
    PVector p = points.get(i);
    p.x = random(width);
    p.y = random(height);
  }
}
