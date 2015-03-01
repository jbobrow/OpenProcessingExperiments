
float theta = 0;
class Point {
  float px,py,cr,cg,cb,pr;
  Point(int x,int y,int r,int g,int b,int rad) {
    px=float(x);
    py=float(y);
    cr=float(r);
    cg=float(g);
    cb=float(b);
    pr=float(rad);
  }
  Point(float x, float y, float r, float g, float b, float rad) {
    px=x;
    py=y;
    cr=r;
    cg=g;
    cb=b;
    pr=rad;
  }
  void draw() {
    fill(cr,cg,cb);
    ellipse(px,py,pr,pr);
  }
  void set(int x,int y,int r,int g,int b,int rad) {
    px=float(x);
    py=float(y);
    cr=float(r);
    cg=float(g);
    cb=float(b);
    pr=float(rad);
  }
  void set(float x, float y, float r, float g, float b, float rad) {
    px=x;
    py=y;
    cr=r;
    cg=g;
    cb=b;
    pr=rad;
  }
}
void setup() {
  size(800,600);
  strokeWeight(5);
}

Point rot(float rx, float ry, float px, float py,float r, float g, float b, float rad, float deg) {
  float s = sin(deg);
  float c = cos(deg);
  Point p = new Point(px,py,r,g,b,rad);
  
  p.px -= rx;
  p.py -= ry;
  
  float xn = p.px * c - p.py * s;
  float yn = p.px * s + p.py * c;
  
  p.px = xn + rx;
  p.py = yn + ry;
  return p;
}

void draw() {
  background(255);
  translate(width/2,height*.75);
  theta=theta+0.1;
  if (theta==360) theta=0;
  //for (float i=1;i<360;i++) 
  rot(0.0,0.0,10.0,10.0,0.0,128.0,255.0,5.0,theta).draw();
}
