
final int POINT_SIZE = 10;
final color POINT_COLOR = #FFB380;
final int VINE_SIZE = 40;
final int PATCH_SIZE = 100;
final float MIN_HB = 0.75;
final float MAX_HB = 1.00;
final int MAX_PATCH_DISTANCE = 150;

PImage bg;
Vector pointlist;
Vector edgeList;
Vector patchList;
float fps = 30;

class Point {
  public int x, y;
  public Point(int x_, int y_) { 
    x = x_; y = y_;
  }
  public int getClosestPoint(Vector pointlist) {
    float d = pow(MAX_PATCH_DISTANCE, 2);
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
  public float hb, dhb;
  public edge(Point a_, Point b_) { 
    a = a_; b = b_;
    age = 0; hb = 1; dhb = 1;
  }
  public void update() { 
    age = age + 0.3/fps*(1-age);

    if(hb < MIN_HB) dhb = 1;
    if(hb > MAX_HB) dhb = -1;
    hb = hb + 0.5/fps * dhb;
  }
  public void infest() { 
     int N=20;
     float hb_ = hb, dhb_ = -dhb;
     for (int i = 0; i < N; ++i){
       float xi = (a.x - b.x)*float(i)/float(N) + b.x;
       float yi = (a.y - b.y)*float(i)/float(N) + b.y;
       
       noStroke();
       fill(160,150,150,50);
       
       if(hb_ < MIN_HB) dhb_ = 1;
       if(hb_ > MAX_HB) dhb_ = -1;
       hb_ = hb_ + 0.5/N * dhb_;
       
       float r = (VINE_SIZE - ((float)i) * 0.75) * age * hb_;
       ellipse(xi,yi,r,r);
     }
  }
  
}

class patch {
  public Point p;
  public edge e;
  public float age;
  public boolean isDying, isFirst;
  public patch(Point p_, edge e_, boolean perna) {
    p = p_; e = e_; age = 0;
    isDying = false; isFirst = perna;  
  }  
  public void update() {
    if(isDying == false || isFirst == true){
      if(e == null || e.age > 0.75){
        age = age + 0.3/fps*(1-age);
        if(age > 0.9) age = 0.9;
      }
      if(e == null && age > 0.75){
        isDying = true;
      }
    } else {
        age = age - 0.3/fps*(1-age);
        if(age < 0.1) {
          age = 0.1;
          for (int i = 0; i < pointlist.size(); ++i){
            Point p_ = (Point) pointlist.get(i);
            if(p_ == p) pointlist.remove(i);
          }
          for (int i = 0; i < edgeList.size(); ++i){
            edge e_ = (edge) edgeList.get(i);
            if(e_.b == p){
              edgeList.remove(i);
              for (int j = 0; j < patchList.size(); ++j){
                patch pch_ = (patch) patchList.get(j);
                if(pch_.e == e_) pch_.e = null;
              }          
            }
          }
        }
    }
  }
  public void infest() { 
     noStroke();
     fill(100,200,100,96);
     ellipse(p.x,p.y,PATCH_SIZE*age,PATCH_SIZE*age);
  }
}

void drawpoint(Point pt) {
  stroke(POINT_COLOR);
  strokeWeight(POINT_SIZE);
  point(pt.x, pt.y);
}

void drawEdge(edge e) {
  strokeWeight(e.age*5+0.2);
  stroke(100);
  line(e.a.x, e.a.y, e.b.x, e.b.y);
}

void setup() {
  size(800, 600);
  background(255);
  frameRate(30);
  smooth();
  bg = loadImage("bg.jpg");

  pointlist = new Vector();
  edgeList = new Vector();
  patchList = new Vector();
}

void draw() {
  background(240);
  image(bg, 0, 0);
  for (int i = 0; i < edgeList.size(); ++i){
    edge e = (edge) edgeList.get(i);
    e.infest(); 
  }
  for (int i = 0; i < edgeList.size(); ++i){
    edge e = (edge) edgeList.get(i);
    e.update();
    drawEdge(e);
  }
  for (int i = 0; i < patchList.size(); ++i){
    patch p = (patch) patchList.get(i);
    p.infest();
    p.update();
  }

  for (int i = 0; i < pointlist.size(); ++i){
    drawpoint((Point) pointlist.get(i));
  }

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

  boolean isFirst = (pointlist.size() < 1);
  Point p;
  p = new Point(mouseX, mouseY);
 
  int ind = p.getClosestPoint(pointlist);

  edge e;
  e=null;
  if(ind !=-1)
  {
    e = new edge(p,(Point) pointlist.get(ind));
    edgeList.add(e);
    
  }
  
  pointlist.add(p);

  patch pch;
  pch = new patch(p, e, isFirst);
  patchList.add(pch);
}

void keyPressed() {
  switch (key) {
  case BACKSPACE:
    pointlist.clear();
    break;
  }
}



