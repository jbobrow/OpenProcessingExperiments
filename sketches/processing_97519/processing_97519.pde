

private ArrayList<Point> points;
private ArrayList<PointPair> pairs;
private final int NUM = 800;
PVector center;
void setup() {
  size(700, 700, OPENGL);
  background(0);
  lights();
  fill(0);
  //stroke(30, 40, 30);
  //strokeWeight(10);
  
  
  center = new PVector(width/2,height/2,200);
  points = new ArrayList<Point>();
  for(int i = 0; i < NUM; i++) {
    float r = 500;
    float theta = random(PI);
    float phi = random(2 * PI);
    
    Point p = new Point(r, theta, phi);
    points.add(p);
  }
  pairs = new ArrayList<PointPair>();
  for(Point p : points) {
      Point q = points.get((int) random(points.size()));
      if(abs(p.p.dist(q.p)) > 180 || abs(p.p.dist(q.p)) < 100) {
        pairs.add(new PointPair(p, q));
      }
 
  }
}


float rot = PI / 2;
void draw() {
  background(0);
  directionalLight(100, 100, 255, 1, 0, 0);
  ambientLight(100,255,100);
  pushMatrix();
  translate(center.x, center.y, center.z);
  rotateY(rot);
  for(PointPair pair : pairs) {
    beginShape();
    fill(100,100,255);
    noStroke();
    vertex(pair.a.p.x - 2,pair.a.p.y,pair.a.p.z);
    vertex(pair.a.p.x + 2,pair.a.p.y,pair.a.p.z);
    vertex(pair.b.p.x ,pair.b.p.y,pair.b.p.z);
    endShape(CLOSE);
//    pair.a.update();
//    pair.b.update();
  }
  popMatrix();
  rot += PI / 512;
  //saveFrame("caryAni#####.png");
  //noLoop();
}
  
    
  

public class Point {
  public float theta;
  public float phi;
  public PVector p;
  public float r;
  
  public Point(float r, float phi, float theta) {
    this.r = r;
    this.phi = phi;
    this.theta = theta;
    
    float x = r * sin(theta) * cos(phi);
    float y = r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    
    this.p = new PVector(x,y,z);
  }
  
  public void update() {
    phi += random(-PI/256, PI/256);
    theta += random(-PI/256, PI/256);
    
    float x = r * sin(theta) * cos(phi);
    float y = r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    
    this.p.set(x,y,z);
  }
}

public class PointPair {
  public Point a;
  public Point b;
  
  public PointPair(Point a, Point b) {
    this.a = a;
    this.b = b;
  }
}
    


