
/**
 * // left mouse button clicks to create polyline<br>
 * // right mouse button click to stop<br>
 * // press 'a' to add a new polyline<br>
 * // press 'c' to turn polyline into curveline<br>
 * // press 'l' to turn curveline into polyline<br>
 * schien@mail.ncku.edu.tw (2009)
 */

ArrayList paths;
boolean done = false;
Path lastpath;
boolean curved = false;

void setup() {
  size(300, 300);
  frameRate(12);

  paths = new ArrayList();
  paths.add(new Path());
}

void draw() {
  background(255);

  for (int i=0; i<paths.size(); i++) {
    Path path = (Path) paths.get(i);
    if (curved) {
      path.drawCurvedPath();
    } 
    else {
      path.drawPath();
    }
  }

  lastpath = (Path) paths.get(paths.size()-1);
  // draw hint
  if (!done && lastpath.tail>0) {
    color hc = color(0, 0, 0, 50);
    stroke(hc);
    line(mouseX, mouseY, lastpath.lastPoint().x, lastpath.lastPoint().y);
  }
}

void mouseReleased() {
  if (mouseButton == RIGHT) done = true;
  if (done) return;
  // otherwise
  Point _apoint = new Point(mouseX, mouseY);
  lastpath.addVertex(_apoint);
}

void keyReleased() {
  if (!done) return;
  if (key == 'a' || key == 'A') {
    curved = false;
    done = false;
    paths.add(new Path());
  }
  if (key == 'c' || key == 'C') {
    curved = true;
  }
  if (key == 'l' || key == 'L') {
    curved = false;
  }
}


// Definitions for new classes

// Point: a collection of x, y coordinates
class Point {
  float x;  // record x coordinate
  float y;  // record y coordinate

  // constructor
  Point(float a, float b) {
    x = a;
    y = b;
  }

} 

// Path: a collection of points to record a trace
class Path {
  Point[] vertices;
  int tail;  // the last point
  color c;

  Path() {
    vertices = new Point[100];
    tail = 0;
    c = color(random(255), random(255), random(255), random(255));
  }

  void addVertex (Point p) {
    if (tail < 100) {
      vertices[tail] = p;
      tail++;
    }
  }

  void drawPath () {
    stroke(c);
    for (int i=0; i<tail-1; i++) {
      line(vertices[i].x, vertices[i].y, vertices[i+1].x, vertices[i+1].y);
    }
  }

  void drawCurvedPath() {
    stroke(c);
    noFill();
    beginShape();
    curveVertex(vertices[0].x, vertices[0].y);
    for (int i=0; i<tail; i++) {
      curveVertex(vertices[i].x, vertices[i].y);
    }
    curveVertex(vertices[tail-1].x, vertices[tail-1].y);
    endShape();
  }

  Point lastPoint() {
    if (tail<1) return null;
    //otherwise
    return vertices[tail-1];
  }
}



