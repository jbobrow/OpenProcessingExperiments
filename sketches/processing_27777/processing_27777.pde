
final int POINT_SIZE = 10;
final color POINT_COLOR = #FFB380;
final color EDGE_COLOR = #FFB380;

Vector pointlist;
Vector edgeList;
float fps = 30;

class Point {
  public int x, y;
  public Point(int x_, int y_) { 
    x = x_; 
    y = y_; 
  }

  public int getClosestPoint(Vector pointlist) {

    float d = 10000000;
    float tmpD = 0;
    int ind = -1;
    for (int i = 0; i < pointlist.size(); ++i){
      Point p = (Point) pointlist.get(i);
      tmpD = pow(x-p.x,2) + pow(y-p.y,2);
      if(tmpD < d && tmpD > 0){
        d=tmpD;
        ind = i;
      }
    }

    return ind;
  }

}

class edge {
  public Point a, b;
  public float age;
  public edge(Point a_, Point b_) { 
    a = a_; 
    b = b_;
    age = 0; 
  }
  
  public void update() { 
    age = age + 0.3/fps*( 1 - age );
  }
 
  public void infest() { 
    int N=30;
     for (int i = 0; i < N; ++i){
       float xi = (a.x - b.x)*float(i)/float(N) + b.x;
       float yi = (a.y - b.y)*float(i)/float(N) + b.y;
       
       noStroke();
       fill(160,150,150,40);
       ellipse(xi,yi,80*age,80*age);
       
     }
  }
  
}

void drawpoint(Point pt) {
  stroke(POINT_COLOR);
  strokeWeight(POINT_SIZE);
  point(pt.x, pt.y);
}

void drawEdge(edge e) {
  strokeWeight(e.age*10+0.2);
  stroke(100);
  line(e.a.x, e.a.y, e.b.x, e.b.y);
}


void setup() {
  size(800, 600);
  background(255);
  frameRate(30);
  smooth();

  pointlist = new Vector();
  edgeList = new Vector();
}

void draw() {

  background(240);
  
  for (int i = 0; i < edgeList.size(); ++i){
    edge e = (edge) edgeList.get(i);
    e.infest(); 
  }
  
  for (int i = 0; i < edgeList.size(); ++i){
    edge e = (edge) edgeList.get(i);
    e.update();
    drawEdge(e);
  }
    

  for (int i = 0; i < pointlist.size(); ++i)
    drawpoint((Point) pointlist.get(i));

  //new node?
  Point p;
  p = new Point(mouseX, mouseY);
  drawpoint(p);

  int ind = p.getClosestPoint(pointlist);

  edge e;
  if(ind !=-1)
  {
    e = new edge(p,(Point) pointlist.get(ind));
    drawEdge(e);
  }


}

void mousePressed() {

  Point p;
  p = new Point(mouseX, mouseY);
 
  int ind = p.getClosestPoint(pointlist);

  edge e;
  if(ind !=-1)
  {
    e = new edge(p,(Point) pointlist.get(ind));
    edgeList.add(e);
  }
  
  pointlist.add(p);

}

void keyPressed() {
  switch (key) {
  case BACKSPACE:
    pointlist.clear();
    break;
  }
}


