
public ArrayList<Point> points;

private float r = 10;
private float theta = 0;

public void setup() {
  size(700, 700);
  background(255);
  
  points = new ArrayList<Point>();
  
  for(int i = 0; i < 100; i++) {
    points.add(new Point(new PVector(random(width), random(height)), 
    new PVector(random(-3,3), random(-3, 3)), random(-50, 50), random(2 * PI),
      random(-PI / 32, PI / 32)));
  }
  fill(0);
  smooth();
}

public void draw() {
    fill(255,255,255,30);
    rect(-100,-100,width+100,height+100);
    fill(0);
    for(int i = 0; i < (points.size() - 1); i++) {
        Point traveler = points.get(i);
        Point follower = points.get(i + 1);
        
        if(points.indexOf(traveler) != 0)
          ellipse(traveler.p.x, traveler.p.y, 3, 3);
        
        updateTraveler(traveler);
        updateFollower(follower, traveler);
        
        line(traveler.p.x,traveler.p.y,follower.p.x,follower.p.y);
    
        ellipse(follower.p.x, follower.p.y, 3, 3);
    }
}

public void updateTraveler(Point t) {
  t.p.set(t.p.x + t.v.x, t.p.y + t.v.y, 0);
  if(t.p.x < 0 || t.p.x > width) {
   t.v.set(t.v.x * -1, t.v.y, 0);
  }
  if(t.p.y < 0 || t.p.y > height) {
    t.v.set(t.v.x, t.v.y * -1);
  }
}

public void updateFollower(Point f, Point t) {
  f.p.set(t.p.x + f.r * cos(f.theta), t.p.y + f.r * sin(f.theta), 0);
  f.theta += f.dtheta;
}

public class Point {
  public PVector p;
  public PVector v;
  public float r;
  public float theta;
  public float dtheta;
  
  public Point(PVector p, PVector v, float r, float theta, float dtheta) {
    this.p = p;
    this.v = v;
    this.r = r;
    this.theta = theta;
    this.dtheta = dtheta;
  }
}

public void mousePressed() {
  saveFrame((int) random(100000) + ".png");
}
