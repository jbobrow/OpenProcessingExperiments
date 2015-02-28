
class Point {
  public float x;
  public float y;
  
  public void Add(Point p) {
    x += p.x;
    y += p.y;
  }
  
  public void FixDistance(Point p) {
    float dx = x - p.x;
    float dy = y - p.y;
    
    float distance = sqrt(dx*dx + dy*dy);
    
    if (distance < 1)
      return;
    
    dx = dx / distance;
    dy = dy / distance;
    
    x = p.x + dx * 10.0;
    y = p.y + dy * 10.0;
  }
}

ArrayList<Point> trail = new ArrayList<Point>();

Point velocity = new Point();

void setup() {
  size(800, 600);
  smooth();
  strokeWeight(5);
  stroke(0);
  frameRate(30);
  
  for (int i=0; i<100; ++i) {
    Point p = new Point();
    p.x = 200;
    p.y = 200;
    trail.add(p);
  }
  
  velocity.x = 1;
}

void draw() {
  background(226);
  
  update();
  
  //strokeWeight(5);
  //stroke(0);
  //for (Point p : trail) {
  //    point(p.x,p.y);
  //}
  
  strokeWeight(1);
  stroke(0,255,0);
  
  int segmentSize = 10;
  int i=0;
  while (i < trail.size()) {
    int i2 = min(i + segmentSize, trail.size()-1);
    
    Point p1 = trail.get(i);
    Point p2 = trail.get(i2);

    float dx = p1.x - p2.x;
    float dy = p1.y - p2.y;
    float l = sqrt(dx*dx + dy*dy);
    dx /= l;
    dy /= l;
    
    dx *= segmentSize;
    dy *= segmentSize;
    
    float dx1 = p2.x - dy;
    float dy1 = p2.y + dx;
    float dx2 = p2.x + dy;
    float dy2 = p2.y - dx;
    
    line(p1.x,p1.y, dx1,dy1);
    line(p1.x,p1.y, dx2,dy2);
    
    line(dx1,dy1, dx2,dy2);
    
    i += segmentSize;
  }
}

void update()
{
  Point p = trail.get(0);
  Point newPos = new Point();
  newPos.x = p.x;
  newPos.y = p.y;
  newPos.Add(velocity);

  trail.remove(trail.size()-1);
  trail.add(0, newPos);
}

void keyPressed() {
  switch (keyCode) {
    case UP:
      velocity.x = 0;
      velocity.y = -1;
      break;
    case DOWN:
      velocity.x = 0;
      velocity.y = 1;
      break;
    case LEFT:
      velocity.x = -1;
      velocity.y = 0;
      break;
    case RIGHT:
      velocity.x = 1;
      velocity.y = 0;
      break;
  }
}

