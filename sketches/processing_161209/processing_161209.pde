
// Continuous accumulated deviation of normal distribution
// by John Clavin - September 2014
 
Point[] points;
int numOfPoints;
int frameNumberCount;
 
void setup() {
  size(500, 500);
  frameRate(25);
  background(220);
  numOfPoints = 1000;
  frameNumberCount = 4;
  points = new Point[numOfPoints];
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}
 
void draw() {
  background(255);
  translate(width/6, height/6);
  stroke(50);
  noStroke();
  for (int i = 0; i < points.length; i++) {
    Point a = points[i];
    a.setPoint();
  }
  for (int i = 0; i < points.length; i++) {
    Point b = points[i];
    fill(b.objectFill);
    ellipse(b.randCount1, b.randCount2, 6, 6);
  }
 
  frameNumberCount++;
  if (frameNumberCount >= 6000)
    noLoop();
}
 
void mousePressed() {
  reStart();
}
 
void reStart() {
  for (int i = 0; i < points.length; i++) {
    Point c = points[i];
    c.resetObjects();
  }
  frameNumberCount = 0;
  loop();
}
 
 
class Point {
  float rand;
  int randCount1;
  int randCount2;
  color objectFill;
 
  Point() {
    setColor();
  }
 
  void setPoint() {
    rand = random(1);
    if (rand >= .40)
      randCount1 += 1;
    else
      randCount1 -= 1;
    rand = random(1);
    if (rand >= .40)
      randCount2 += 1;
    else
      randCount2 -= 1;
  }
 
  void setColor() {
    if (50 > (int)random(100)) {
      objectFill = color(random(250), 0, 0);
    } else if (50 > (int)random(100)) {
      objectFill = color(0, random(240), 0);
    } else {
      objectFill = color(20,40,255);
    }
  }
 
  void resetObjects() {
    randCount1 = 50;
    randCount2 = 50;
    setColor();
  }
}



