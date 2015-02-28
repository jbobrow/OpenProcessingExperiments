
Point last;
Point current;
DistanceAverager avg;
private static final int CENTER_X = 200;
private static final int CENTER_Y = 200;
ArrayList points;

void setup() {
  size(400, 400);
  last = new Point(200, 200);
  avg = new DistanceAverager();
  points = new ArrayList();
}

void drawPoints() {
  for (int i = 0; i < points.size() - 1; i++) {
    Point from = (Point)points.get(i);
    Point to = (Point)points.get(i+1);
    line(from.x, from.y, to.x, to.y);
  }
}

void draw() {
  background(0);
  int newX = int(last.x + random(-10, 11));
  int newY = int(last.y + random(-10, 11));
  current = new Point(newX, newY);
  avg.addPoint(current);
  points.add(current);
  stroke(100);
  line(last.x, last.y, current.x, current.y);
  drawPoints();
  last = current;
  stroke(200, 0, 0);
  noFill();
  ellipseMode(CENTER);
  int average = round(avg.average);
  ellipse(CENTER_X, CENTER_Y, average, average);
  //ellipse(CENTER_X, CENTER_Y, (int)avg.average(), (int)avg.average());
    
}

public class Point {
  public int x, y;

  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

public class DistanceAverager {
  private int count;
  public float average;
  public DistanceAverager() {
    count = 0;
    average = 0;
  }

  public void addPoint(Point p) {
    int dx = p.x - CENTER_X;
    int dy = p.y - CENTER_Y;
    float distance = sqrt(dx*dx + dy*dy);
    average = ((count * average) + distance) / (count + 1);
    count = count + 1;
  }
  
  ///public float average() { return 100.0; }
}



