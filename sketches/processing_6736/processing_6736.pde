
color bg;
Observer o;
Renderer r;
Cube c;
Point p = new Point(0,0,0);
PFont myFont;

int state = 0;

void setup() {
  o = new Observer(0,0,-100);
  r = new Renderer();
  c = new Cube();
  c.t.z = 30;
  o.speed = 0;
  r.setObserver(o);

  size(600, 600, P3D);
  bg = color(150,150,150);
  smooth();
  textMode(SCREEN);
  myFont = loadFont("Helvetica-32.vlw");
  textFont(myFont,32);
  loop();
}

void draw() {
  background(bg);
  r.transform(c.t, p);
  camera(o.x,o.y,o.z,0,0,30, 0, 1, 0);
  c.draw(r);
  
  
  switch(state) {
    case 0: 
      text("Normal Speed << C", 30, 100);
      text("speed="+nf(o.speed,1,2)+"c", 60, 150);
      c.t.z -= 0.4; c.t.x += 0.1;
      if(p.z < -40) {
        state = 1;
        c.t.z = 30;
        c.t.x = 0;
        o.speed = 0.9;
      }
      break;
    case 1:
      text("Speed = 0.9 * C", 30, 100);
      text("speed="+nf(o.speed,1,2)+"c", 60, 150);
      c.t.z -= 0.4; c.t.x += 0.1;
      if(p.z < -180) {
        state = 2;
        c.t.z = 30;
        c.t.x = 0;
        o.speed = 0.9;
      }
      break;
    case 2:
      text("Speed from 0.9 * C to normal speed", 30, 100);
      text("speed="+nf(o.speed,1,2)+"c", 60, 150);
      c.t.z -= 0.4; c.t.x += 0.1;
      if(o.speed > 0.1) o.speed -= 0.003;
      if(p.z < -180) {
        state = 3;
        c.t.z = 30;
        c.t.x = 0;
        o.speed = 0;
      }
      break;
    case 3:
      text("Speed from normal speed to 0.9 * C", 30, 100);
      text("speed="+nf(o.speed,1,2)+"c", 60, 150);
      c.t.z -= 0.4; c.t.x += 0.1;
      if(o.speed < 0.93) o.speed += 0.003;
      if(p.z < -250) {
        state = 0;
        c.t.z = 30;
        c.t.x = 0;
        o.speed = 0;
      }
      break;
     
  }
  //if(o.speed > 0.02) o.speed -= 0.003;
}


class Point {
  public float x;
  public float y;
  public float z;

  public Point(float x0, float y0, float z0) {
    x=x0; 
    y=y0;
    z=z0;
  }
  public Point copyTo(Point b) {
    b.x = x;
    b.y = y;
    b.z = z;
    return b;
  }
}

class Observer extends Point {
  public float speed = 0.90 ;

  public  Observer(float x0, float y0, float z0) {
    super(x0,y0,z0);
  }
}

class Renderer {
  public Observer obs;
  public float c = 1.0;

  public void setObserver(Observer o) {
    obs = o;
  }

  public boolean transform(Point p, Point res) {
    float x = p.x - obs.x;
    float y = p.y - obs.y;
    float z = p.z - obs.z;
    
    float beta = obs.speed / c;
    float g2 = 1.0 - beta*beta;
    
    res.z = z / g2 - beta*sqrt(x*x + y*y + g2*z*z) / sqrt(g2);    
    res.y = y;
    res.x = x;
        
    return true;
  }
}

class Line {
  int p0;
  int p1;

  public Line(int a,int b) { 
    p0=a; 
    p1=b;
  }
}

class Shape {
  public Point t = new Point(0,0,0); //translation
  public Point s = new Point(30,30,30); //scale
  public Point r = new Point(0,0,0); //rotation
  Point p0_ = new Point(0,0,0); //temporaries
  Point p1_ = new Point(0,0,0);

  Point[] points;
  Line[] lines;


  public Shape() {
  }

  Point a_ = new Point(0,0,0);
  Point b_ = new Point(0,0,0);
  Point c_ = new Point(0,0,0);
  Point d_ = new Point(0,0,0);

  public void draw(Renderer r) {
    for(int i=0; i < lines.length; i++) {
      
      stroke(0);
      localTransform(points[lines[i].p0], a_);
      localTransform(points[lines[i].p1], b_);
      for(float k=0.0; k<=1.0; k+=0.1) {
        interpolate(a_,b_,k,c_);
        interpolate(a_,b_,k+.1,d_);
        r.transform(c_, p0_); 
        r.transform(d_, p1_);
        if (p0_.z >= r.obs.z && p1_.z >= r.obs.z) 
          line(p0_.x, p0_.y, p0_.z, p1_.x, p1_.y, p1_.z);
      }
      /*
      stroke(255,0,0);
      if(r.transform(localTransform(points[lines[i].p0], p), p0) && r.transform(localTransform(points[lines[i].p1],p), p1))
        line(p0.x, p0.y, p0.z, p1.x, p1.y, p1.z);
    */
    }    
  }

  Point interpolate(Point a, Point b, float k, Point c) {
    c.x = k*a.x + (1.0-k)*b.x;
    c.y = k*a.y + (1.0-k)*b.y;
    c.z = k*a.z + (1.0-k)*b.z;
    return c;
  }

  Point localTransform(Point a, Point b) {
    b.x = t.x + a.x * s.x;
    b.y = t.y + a.y * s.y;
    b.z = t.z + a.z * s.z;
    return b;
  }
}


class Cube extends Shape {
  public Cube() {
    super();
    points    = new Point[8];
    points[0] = new Point(-1,1,-1);
    points[1] = new Point(-1,1,1);
    points[2] = new Point(1,1,1);
    points[3] = new Point(1,1,-1);
    points[4] = new Point(-1,-1,-1);
    points[5] = new Point(-1,-1,1);
    points[6] = new Point(1,-1,1);
    points[7] = new Point(1,-1,-1);

    lines     = new Line[12];
    lines[0]  = new Line(0,1);
    lines[1]  = new Line(1,2);
    lines[2]  = new Line(2,3);
    lines[3]  = new Line(3,0);
    lines[4]  = new Line(4,5);
    lines[5]  = new Line(5,6);
    lines[6]  = new Line(6,7);
    lines[7]  = new Line(7,4);
    lines[8]  = new Line(0,4);
    lines[9]  = new Line(1,5);
    lines[10] = new Line(2,6);
    lines[11] = new Line(3,7);
  }
}


