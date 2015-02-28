
void setup() {
  size(400, 300);
  background(255);
  noFill();
  points = new PVector[2000];
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
  }
}

PVector[] points;

void draw() {
  background(255);
  noFill();
  strokeWeight(1);
  stroke(0);
  rect(width/2+100, height/2-100, -100, 100);
  arc(width/2, height/2, 200, 200, radians(270), radians(360));
  strokeWeight(2);
  for (PVector p : points) {
    stroke(0);
    if (dist(p.x, p.y, width/2, height/2) < 100 && p.x > width/2 && p.y <= height/2) {
      stroke(#ff0000);
    }
    point(p.x, p.y);
  }
}

void keyPressed() {
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
  }
}

