

/**
 *    Connect points! Create them by clicking on the canvas. Pressing spacebar clears the canvas.
 *
 *    <ul>
 *      <li>Lucas Nogueira</li> pr
 *    </ul>
 */



int WSIZE = 700;
ArrayList<Point> plist = new ArrayList<Point>();

// example
void initCircle() {
  float radius = WSIZE/2;
  float increment = 30; // degree

  for (float angle = 0; angle < 360.0; angle += increment) {
    Point p = new Point(radius * cos(radians(angle)) + radius, radius * sin(radians(angle)) + radius);
    plist.add(p);
  }
  ellipse(WSIZE/2, WSIZE/2, WSIZE, WSIZE);
  noFill();
}

void setup() {
  size(700, 700);
  initCircle();
}

void draw() {
  //clear();
  background(255);
  for (Point p : plist) {
    drawPoint(p);

    for (Point ptr : plist) {
      drawLine(p, ptr);
    }
  }
}

void mousePressed() {
  Point p = new Point(mouseX, mouseY);
  plist.add(p);
}

// pressing spacebar clears the screen
void keyPressed() {
  if (int(key) == 32) {
    plist.clear();
  }
}

class Point {
  float x;
  float y;
 
  Point(float x0, float y0) {
    setX(x0);
    setY(y0);
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void setX(float x0) {
    x = x0;
  }
  
  void setY(float y0) {
    y = y0;
  }
}

void drawLine(Point a, Point b) {
  line(a.getX(), a.getY(), b.getX(), b.getY());
}

void drawPoint(Point a) {
  float radiusX = 2.0;
  float radiusY = 2.0;
  ellipse(a.getX(), a.getY(), radiusX, radiusY);
}


