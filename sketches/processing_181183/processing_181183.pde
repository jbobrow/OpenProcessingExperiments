
//import gifAnimation.*;

//GifMaker recording;
float theta = 0;
Point p;
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
  //recording = new GifMaker(this,"out.gif");
  //recording.setRepeat(1);
  //recording.setTransparent(0,0,0);
  p = new Point(10,10,0,0,0,5);
}

//Point rot(float rx, float ry, float px, float py,float r, float g, float b, float rad, float deg) {
Point rot(float rx, float ry, float px, float py, Point p, float deg) {
  float s = sin(deg);
  float c = cos(deg);
  //Point p = new Point(px,py,r,g,b,rad);
  
  
  p.px = px - rx;
  p.py = py - ry;
  
  float xn = p.px * c - p.py * s;
  float yn = p.px * s + p.py * c;
  
  p.px = xn + rx;
  p.py = yn + ry;
  return p;
}

void draw() {
  background(255);
  translate(width/2,height*.75);
  theta=theta+0.05;
  if (theta>PI*2) {
    theta=0;
    //recording.finish();
    print("RENDER DONE\n");
    exit();
  } else {
    print(theta + "\n");
    //recording.setDelay(100/60);
    //recording.addFrame();
  }
  rot(0.0, 0.0, 10, 10, p, theta).draw();

}
