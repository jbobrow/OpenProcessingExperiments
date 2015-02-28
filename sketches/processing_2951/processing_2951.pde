
/* 
 * Spaghetti by Algirdas Rascius (http://mydigiverse.com).
 */
/** 
 * Click to restart. Each time parameters used to generate lines will differ.
 */ 

static final float MARGIN = 50;
static final int POINTS_PER_MOVE = 3;
static final float LINE_WIDTH = 2.0;
static final float OUTLINE_WIDTH = 5.0;

LinkedList points;
float minDistance = 30;
float maxDistance = 80;
float directionLength = 20;

void setup() {
  size(750, 500);
  smooth();
  noFill();
  
  initialize();
}

void initialize() {
  background(255);
  stroke(0);
  minDistance = random(10, 30);
  maxDistance = minDistance*random(3, 10);
  directionLength = minDistance*random(0.8, 2);
  float pointCount = random(500000, 2000000)/minDistance/maxDistance;
  points = new LinkedList();
  for (int i=0; i<pointCount; i++) {
    float x = random(-MARGIN, width+MARGIN);
    float y = random(-MARGIN, height+MARGIN);
    float angle = random(TWO_PI);
    points.add(new Point(x, y, angle));
    points.add(new Point(x, y, (angle+PI)%TWO_PI));  
  }
}

void mouseClicked() {
   initialize();
}

void keyPressed() {
   initialize();
}

void draw() {
  for (int i=0; i<POINTS_PER_MOVE; i++) {
    connectPoints();
  }
}

void connectPoints() {
  if (points.size() >= 1) {
    Point start = (Point)points.get(0);
    points.remove(0);
    
    LinkedList possibleConnections = new LinkedList();
    for (Iterator i=points.iterator(); i.hasNext();) {
      Point p = (Point)i.next();
      float distance = dist(start.x, start.y, p.x, p.y);
      if (distance >= minDistance && distance <= maxDistance) {
        possibleConnections.add(p);
      } 
    }
    
    Point end = null;
    while (possibleConnections.size() > 0 && end == null) {
      Point p = (Point)possibleConnections.get((int)random(possibleConnections.size()));
      if (canConnect(start, p)) {
        end = p;
      } else {
        possibleConnections.remove(p);
      }
    }
    
    if (end != null) {
      connect(start, end);
      points.remove(end);
    }
  }
}

boolean canConnect(Point p1, Point p2) {
  return dist(p1.x, p1.y, p2.x, p2.y) >= dist(p1.x+sin(p1.angle), p1.y+cos(p1.angle), p2.x+sin(p2.angle), p2.y+cos(p2.angle));
}

void connect(Point p1, Point p2) {
  stroke(255);
  strokeWeight(OUTLINE_WIDTH);
  strokeCap(SQUARE);
  connectBezier(p1, p2);
  stroke(0);
  strokeWeight(LINE_WIDTH);
  strokeCap(ROUND);
  connectBezier(p1, p2);
}

void connectBezier(Point p1, Point p2) {
  
  bezier(
      p1.x, p1.y, 
      p1.x+directionLength*sin(p1.angle), p1.y+directionLength*cos(p1.angle),
      p2.x+directionLength*sin(p2.angle), p2.y+directionLength*cos(p2.angle),
      p2.x, p2.y);    
}

class Point {
  float x;
  float y;
  float angle;
  
  Point(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }
}

