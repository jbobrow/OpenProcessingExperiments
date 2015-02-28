
final int POINT_SIZE = 10;
final int LINK_SIZE = 5;
final int PATCH_SIZE = 160;
final int MAX_LINK_DISTANCE = 160;
final color POINT_COLOR = #FFB380;

Vector pointlist;
Vector linkList;
Vector patchList;
float fps = 30;
 
class Point
{
  public int x, y, z;
  public Point(int x_, int y_, int z_)
  {
    x = x_;
    y = y_;
    z = z_;
  }
  public void draw()
  {
    stroke(POINT_COLOR);
    strokeWeight(POINT_SIZE);
    point(x, y);
  }
  public Vector GetLinkPoints(Vector pointlist) {
    Vector indices = new Vector();
    for (int i = 0; i < pointlist.size(); ++i)
    {
      Point p = (Point) pointlist.get(i);
      float d = sqrt( pow(x - p.x, 2) + pow(y - p.y, 2) + pow(z - p.z, 2) );
      if(d > 0 && d < MAX_LINK_DISTANCE)
      {
        indices.add(p);
      }
    }
    return indices;
  }
}
 
class Link {
  public Point a, b;
  public float age;
  public Link(Point a_, Point b_) {
    a = a_; b = b_; age = 0;
  }
  public void update() {
    age = age + 0.3/fps*(1-age);
  }
  public void draw()
  {
    strokeWeight(age * LINK_SIZE + 0.2);
    stroke(100);
    line(a.x, a.y, b.x, b.y);
  }
}
 
class patch {
  public Point p;
  public Link l;
  public float age;
  public patch(Point p_, Link l_) {
    p = p_; l = l_; age = 0;   
  } 
  public void update() {
    if(l == null || l.age > 0.75){
      age = age + 0.3/fps*(1-age);
    }
  }
  public void infest() {
     noStroke();
     fill(100,200,100,40);
     ellipse(p.x,p.y,PATCH_SIZE*age,PATCH_SIZE*age);
  }
}
 
 
void setup() {
  size(800, 600);
  background(255);
  frameRate(30);
  smooth();
 
  pointlist = new Vector();
  linkList = new Vector();
  patchList = new Vector();
}
 
void draw() {
  background(240);
  for (int i = 0; i < linkList.size(); ++i){
    Link l = (Link)linkList.get(i);
    l.update();
    l.draw();
  }
  for (int i = 0; i < patchList.size(); ++i){
    patch p = (patch) patchList.get(i);
    p.infest();
    p.update();
  }
 
  for (int i = 0; i < pointlist.size(); ++i){
    ((Point)pointlist.get(i)).draw();
  }
 
  //new node?
  Point p = new Point(mouseX, mouseY, 0);
  p.draw();
 
  Vector indices = p.GetLinkPoints(pointlist);
  for(int i = 0; i < indices.size(); ++i)
  {
    Link l = new Link(p, (Point)indices.get(i));
    l.draw();
  }
}
 
void mousePressed() {
 
  Point p = new Point(mouseX, mouseY, 0);
  
  Vector indices = p.GetLinkPoints(pointlist);
  Link l = null;
  for(int i = 0; i < indices.size(); ++i)
  {
    l = new Link(p, (Point)indices.get(i));
    linkList.add(l);
  }
  
  pointlist.add(p);
 
  patch pch;
  pch = new patch(p, l);
  patchList.add(pch);
}
 
void keyPressed() {
  switch (key) {
  case BACKSPACE:
    pointlist.clear();
    break;
  }
}

