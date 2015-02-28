
int lastX;
int lastY;
Point center;
int speed;
int maxSpeed = 20;
List<MonsterPoint> points;
List<Point> circlePoints;
int numCirc = 44;
int randomCirc = 10;
float circRadius = 50;
int maxDistX = 16;
int maxDistY = 16;
int radius = 8;

class Point {
  int x = 0;
  int y = 0;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  boolean isValid() {
    return x >= 0 && x <= width && y >= 0 && y <= height;
  }
}

class MonsterPoint extends Point {
  Point center;
  int diffX;
  int diffY;
  
  MonsterPoint(int x, int y, Point center) {
    super(x,y);
    this.center = center;
    diffX = x - center.x;
    diffY = y - center.y;
    if(diffX == 0) {
      diffX = 1;
    }
    if(diffY == 0) {
      diffY = 1;
    }
  }
  
  void move(){
    x = x + diffX;
    y = y + diffY;
  }
}
 
void setup() {
  size(512, 512);
  points = new ArrayList<MonsterPoint>();
  fill(255, 255, 255, 50);
  
}
 
void draw() {
  background(0);
  center = new Point(mouseX, mouseY);
  strokeWeight(1);
  stroke(255, 0, 0);
  
  circlePoints = new ArrayList<Point>(numCirc);
  float angle = radians(360 / (float) numCirc);
  for (int i = 0; i < numCirc; i++) {
    int x = (int) (cos(angle * i) * circRadius + random(-randomCirc, randomCirc));
    int y = (int) (sin(angle * i) * circRadius + random(-randomCirc, randomCirc));
    Point p = new Point(x, y);
    circlePoints.add(p);
  }
  
  for (int i = 0; i < circlePoints.size(); i++) {
    Point p = circlePoints.get(i);
    line(center.x, center.y, center.x + p.x, center.y + p.y);
  }
  noStroke();
  
  speed = abs(mouseX - lastX) + abs(mouseY - lastY);
  if(speed > maxSpeed) {
    speed = maxSpeed;
  }  
  lastX = mouseX;
  lastY = mouseY; 
     
  for (int i = 0; i < speed; i++) {
    int x = center.x + (int) random(-maxDistX, maxDistX);
    int y = center.y + (int) random(-maxDistY, maxDistY);
    MonsterPoint p = new MonsterPoint(x, y, center);
    points.add(p);
  }
  for (int i = points.size() - 1; i >= 0; i--) {
    MonsterPoint p = points.get(i);
    p.move();
    if(!p.isValid()) {
      points.remove(i);
    } else {
      ellipse(p.x, p.y,radius,radius);
    }
  }
   

}

