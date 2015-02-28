
IFS Serp;
Point p0;
Set A;
boolean running;

void setup() {
  size(500, 250);
  background(0);
  A = new Set();
  /*Some other Transformations to try!
   Transformation[] tflake = {
   new Transformation(0.6, 0, 0, 0.6, 0, 0), 
   new Transformation(0.4, 0.2, 0.2, 0.4, 0.6, 0), 
   new Transformation(0.5, -0.5*sqrt(3), -0.5*sqrt(3), 0.5, 0, 0)
   };
   Flake = new IFS(tflake);
   
   
   Transformation[] ttree = {
   new Transformation(0.195, -0.488, 0.344, 0.443, 0.4431, 0.2452), 
   new Transformation(0.462, 0.414, -0.252, 0.361, 0.2511, 0.5692), 
   new Transformation(-0.058, -0.07, 0.453, -0.111, 0.5976, 0.0969), 
   new Transformation(-0.035, 0.07, -0.469, -0.022, 0.4884, 0.5069), 
   new Transformation(-0.637, 0, 0, 0.501, 0.8662, 0.2513)
   };
   Tree = new IFS(ttree);
   
   Transformation[] tcrys = {
   new Transformation(0.382, 0, 0, 0.382, 0.3072, 0.619), 
   new Transformation(0.383, 0, 0, 0.382, 0.6033, 0.4044), 
   new Transformation(0.383, 0, 0, 0.382, 0.0139, 0.4044), 
   new Transformation(0.383, 0, 0, 0.382, 0.1253, 0.0595), 
   new Transformation(0.383, 0, 0, 0.383, 0.492, 0.0595)
   };
   Crys = new IFS(tcrys);
   
   Transformation[] tbox = {
   new Transformation(0.333, 0, 0, 0.333, 0, 0), 
   new Transformation(0.333, 0, 0, 0.333, 0.666, 0), 
   new Transformation(0.333, 0, 0, 0.333, 0, 0.666), 
   new Transformation(0.333, 0, 0, 0.333, 0.666, 0.666), 
   new Transformation(0.333, 0, 0, 0.333, 0.333, 0.333)
   };
   TBox = new IFS(tbox);
   
   */
   Transformation[] ts = {
    new Transformation(0.5, 0, 0, 0.5, 0, 0), 
    new Transformation(0.5, 0, 0, 0.5, 0.5, 0), 
    new Transformation(0.45, 0, 0, 0.825, 0.25, 0.18)//old: new Transformation(0.5, 0, 0, 0.5, 0.25, 0.5)
    };
    Serp = new IFS(ts);
  p0 = new Point(0.2, 0.1);//randomly chosen..
  A.add(p0);
  iter = 0;
  noLoop();
}

int iter;
void draw() {
  background(0);
  A.display(0, 1, 0, 1, 0, width, 0, height);//extra coordinates tells the Set where to accurately draw the point...
  //we remap the points coordinates from being in [0,1]x[0,1] to [0,width]x[0,height]
}

void keyPressed() {
  if (key == ' ')
    A.runIFS(Serp);
  if (key == 'r' || iter > 7)
  {
    A.clear();
    A.add(new Point(random(1), random(0.3)));
    iter = 0;
  }
  redraw();
  iter++;
}

void mousePressed() {
  if(!running)
    loop();
  else
    noLoop();
  running = !running;
}

class IFS {
  ArrayList fs;

  IFS(Transformation[] transfs) {
    fs = new ArrayList();
    for (int i=0; i<transfs.length; i++)
      fs.add(transfs[i]);
  }

  Point[] applyTo(Point p) {
    Point[] returnable = new Point[fs.size()];
    for(int i=0; i<fs.size(); i++)
      returnable[i] = ((Transformation)fs.get(i)).applyTo(p);    
    return returnable;
  }
}

class Point {
  float x, y;

  Point(float _x, float _y) {
    x = _x;
    y = _y;
  }

  Point remap(float low1x, float high1x, float low1y, float high1y, 
  float low2x, float high2x, float low2y, float high2y) {
    return new Point(map(x, low1x, high1x, low2x, high2x), 
    map(y, low1y, high1y, low2y, high2y));
  }

  void display() {
    display(5);
  }
  void display(float r) {
    colorMode(HSB,100);
    fill(color(random(50,70),random(80,100),random(60,90)));
    noStroke();
    ellipse(x,y,r,r);
    
//    triangle(x,y, x-5,y+5, x+5,y+5);
//    triangle(x,y+4, x-10,y+10, x+10,y+10);
//    triangle(x,y+9, x-15,y+15, x+15,y+15);
//    rect(x-3,y+15,7,3);
  }
}

//Holds Points. Who would have thought? :)
class Set {
  ArrayList points;
  Set() { points = new ArrayList(); }
  
  void add(Point p){ points.add(p); }

  void runIFS(IFS system) {
    ArrayList pointsprime = new ArrayList();
    for (int i=0; i<points.size(); i++)
    {
      Point[] applied = system.applyTo((Point) points.get(i));
      for(int j=0; j<applied.length;j++)
        pointsprime.add(applied[j]);
    }
    points = pointsprime;
  }
  
  void clear(){ points = new ArrayList(); }
  
  void display(float low1x, float high1x, float low1y, float high1y, 
  float low2x, float high2x, float low2y, float high2y) {
    for (int i=points.size()-1; i>=0; i--)
    {
      Point p = ((Point)points.get(i)).remap(low1x, high1x, low1y, high1y, 
      low2x, high2x, low2y, high2y);
        p.display();
    }
  }
}

//Represents an Affine Transformation: z' = Az + bb
//A = [[a b][c d]], bb= [[e][f]] (and z is of course [[x][y]]
class Transformation {  
  float a, b, c, d, e, f;

  Transformation(float _a, float _b, float _c, float _d, float _e, float _f)
  {
    a = _a;
    b = _b;
    c = _c;
    d = _d;
    e = _e;
    f = _f;
  }
//We get a new point by feeding an old point through the transformation
  Point applyTo(Point p) {
    return new Point(a*p.x + b*p.y + e, c*p.x + d*p.y + f);
  }
}
