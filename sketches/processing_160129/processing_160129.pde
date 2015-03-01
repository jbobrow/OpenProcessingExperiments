
// Continuous accumulated deviation of normal distribution 2
// by John Clavin - September 2014

Point[] points;
int middle;
int numOfPoints;
int widthCount;

void setup() {
  size(940, 540);
  noStroke();
  background(220);
  middle = height/2;
  numOfPoints = 10;
  widthCount = 0;
  points = new Point[numOfPoints];
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  for (int i = 0; i < points.length; i++) {
    Point a = points[i];
    a.setPoint();
  }
  for (int i = 0; i < points.length; i++) {
    Point b = points[i];
    fill(b.objectFill);
    ellipse(widthCount, middle + b.randCount, 3, 3);
  }
  loadPixels();
  if (widthCount > width - 5) {
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width -1; x++) {
        pixels[x + y*width] = pixels[(x+1) + y*width];
      }
    }
  } else {
    widthCount++;
  }
  updatePixels();
}

void mousePressed() {
  reStart();
}

void reStart() {
  for (int i = 0; i < points.length; i++) {
    Point c = points[i];
    c.resetObjects();
  }
  widthCount = 0;
  background(220);
}

class Point {
  float rand;
  int randCount;
  color objectFill;

  Point() {
    setColor();
  }

  void setPoint() {
    rand = random(1);
    if (rand >= .5)
      randCount += 1;
    else
      randCount -= 1;
  }

  void setColor() {
    objectFill = color(random(200), random(200), random(200));
  }

  void resetObjects() {
    randCount = 0;
    // setColor();
  }
}



