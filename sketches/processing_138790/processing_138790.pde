
import generativedesign.*;

Tablet tablet;
ArrayList<Point> points;

void setup() {
  size(640, 480);
  tablet = new Tablet(this);
  points = new ArrayList<Point>();
  background(255);
  stroke(0);
  strokeWeight(0.1);
}

void draw() {
  Point this_point;
  float min_dist, max_dist, d;
  if (mousePressed) {
    
    this_point = new Point(mouseX, mouseY);
    points.add(this_point);
    
    min_dist = 10*tablet.getPressure();
    max_dist = min_dist*10;
    
    for (int i = 0; i<points.size(); i++) {
      Point that_point = points.get(i);
      d = dist(this_point.x, this_point.y, that_point.x, that_point.y);
      if ((d < max_dist) && (d > min_dist))
        line(this_point.x, this_point.y, that_point.x, that_point.y);
    }
    Point that_point = points.get(points.size()-1);
    line(this_point.x, this_point.y, that_point.x, that_point.y);
  } 
}

void keyPressed() {
  switch (key) {
    case BACKSPACE:
    points.clear();
      background(255);
      break;
    case 's':
    case 'S':
      saveFrame("screenshot-#####.png");
      break;
  }
}

class Point {
  float x, y;
  Point(float xval, float yval) {
    x = xval;
    y = yval;
  }
}
