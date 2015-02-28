
/*
 * Draws a convex hull around points defined by clicking in the drawing area.
 * Press space to generate random points, and press backspace to clear.
 */

final int POINT_SIZE = 10;
final color POINT_COLOR = #FFB380;
final float HULL_SIZE = POINT_SIZE * 0.2;
final color HULL_STROKE = #809FFF;
final color HULL_FILL = #E6ECFF;
final int NUM_RAND_POINTS = 10;

Vector pointlist;
boolean update;

class Point {
  public int x, y;
  public Point(int x_, int y_) { x = x_; y = y_; }
}

// builds a convex hull around the given points
// using the Graham scan algorithm
Vector buildhull(Vector points) {
  if (points.size() < 3)
    return null;

  // find the point with the least y, then x coordinate
  Point p0 = null;
  for (int i = 0; i < points.size(); ++i) {
    Point curr = (Point) points.get(i);
    if (p0 == null ||
        curr.y < p0.y ||
        (curr.y == p0.y && curr.x < p0.x))
      p0 = curr;
  }

  // sort the points by angle around p0
  class PointAngleComparator implements Comparator {
    private Point p0;
    public PointAngleComparator(Point p0_) { p0 = p0_; }
    private float angle(Point pt) {
      return atan2(pt.y - p0.y, pt.x - p0.x);
    }
    public int compare(Object o1, Object o2) {
      Point p1 = (Point) o1, p2 = (Point) o2;
      float a1 = angle(p1), a2 = angle(p2);
      if (a1 > a2) return 1;
      if (a1 < a2) return -1;
      return Float.compare(dist(p0.x, p0.y, p1.x, p1.y), dist(p0.x, p0.y, p2.x, p2.y));
    }
  }
  Collections.sort(points, new PointAngleComparator(p0));

  // build the hull
  Stack hull = new Stack();
  hull.push(points.get(0)); hull.push(points.get(1)); hull.add(points.get(2));
  for (int i = 3; i < points.size(); ++i) {
    Point cur = (Point) points.get(i);
    while (hull.size() >= 3) {
      Point snd = (Point) hull.get(hull.size() - 2);
      Point top = (Point) hull.peek();
      int crossproduct = (top.x - snd.x) * (cur.y - snd.y) - (cur.x - snd.x) * (top.y - snd.y);
      if (crossproduct > 0) break;
      hull.pop();
    }
    hull.push(cur);
  }

  return hull;
}

void drawpoint(Point pt) {
  stroke(POINT_COLOR);
  strokeWeight(POINT_SIZE);
  point(pt.x, pt.y);
}

void drawhull(Vector hull) {
  if (hull == null) return;

  fill(HULL_FILL);
  stroke(HULL_STROKE);
  strokeWeight(HULL_SIZE);

  beginShape();
  for (int i = 0; i < hull.size(); ++i) {
    Point pt = (Point) hull.get(i);
    vertex(pt.x, pt.y);
  }
  endShape(CLOSE);
}

void setup() {
  size(500, 500);
  background(255);
  smooth();

  pointlist = new Vector();
  update = false;
}

void draw() {
  if (!update) return;

  background(255);
  drawhull(buildhull(pointlist));
  for (int i = 0; i < pointlist.size(); ++i)
    drawpoint((Point) pointlist.get(i));

  update = false;
}

void mousePressed() {
  pointlist.add(new Point(mouseX, mouseY));
  update = true;
}

void keyPressed() {
  switch (key) {
    case BACKSPACE:
      pointlist.clear();
      break;
    case ' ':
      for (int i = 0; i < NUM_RAND_POINTS; ++i)
        pointlist.add(new Point((int) random(0, width - 1), (int) random(0, height - 1)));
      break;
  }
  update = true;
}

