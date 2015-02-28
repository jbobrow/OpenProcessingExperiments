
/*
Random Tiling by Philippe Guglielmetti, aka Dr. Goulu 2011
inspired by http://paulbourke.net/texture_colour/randomtile/
and http://www.openprocessing.org/visuals/?visualID=5464
*/

float c=1.1;
int n=0; // start with circles

float g(int i) {return pow(i,-c);}
float RiemannZeta() {
  float s=0;
  for (int i=1; g(i)>1E-6; i++) {s+=g(i);}
  return s;
}

float Angle2D(float x1,float y1,float x2,float y2)
{
   float dtheta = atan2(y2,x2) - atan2(y1,x1);
   while (dtheta > PI)
      dtheta -= 2*PI;
   while (dtheta < -PI)
      dtheta += 2*PI;
   return(dtheta);
}

boolean LineIntersect(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4)
{
   float eps=1e-9;
   float denom  = (y4-y3) * (x2-x1) - (x4-x3) * (y2-y1);
   float numera = (x4-x3) * (y1-y3) - (y4-y3) * (x1-x3);
   float numerb = (x2-x1) * (y1-y3) - (y2-y1) * (x1-x3);

   // Are the line coincident?
   if (abs(numera) < eps && abs(numerb) < eps && abs(denom) < eps)
      return(true);

   // Are the line parallel
   if (abs (denom) < eps)
      return(false);

   // Is the intersection along the the segments
   float mua = numera / denom;
   float mub = numerb / denom;
   if (mua < 0 || mua > 1 || mub < 0 || mub > 1)
      return(false);
   return(true );
}

class Poly {
  int pts; // points
  float area,phi;
  float cx,cy;
  float cr; // cercle circonscrit
  
  Poly(int n, float a) {
    area=a;
    pts=n;
    if (pts<3) {
      cr=sqrt(area/PI);
    }
    else if (pts==10){  // pentagram
      float t=2*sin(PI/5); 
      t=(5*t*t/4)*(tan(3*PI/10)-tan(PI/5));
      cr=sqrt(area/t);
    }
    else{
      cr=sqrt(2*area/(n*sin(2*PI/n))); //http://www.mathwords.com/a/area_regular_polygon.htm
    }
  }
  
  void Random(float pmin, float pmax) {
    cx=random(cr,width-cr);
    cy=random(cr,height-cr);
    phi=random(pmin,pmax);    
  }
  
  float X(int i) {
    float r=cr;
    if (pts==10 && i%2==1) {r=r/2.5;}
    return cx+r*cos(phi+i*2*PI/pts);
  }
  float Y(int i) {
    float r=cr;
    if (pts==10 && i%2==1) {r=r/2.5;}
    return cy+r*sin(phi+i*2*PI/pts);
  }
  
  void Draw() {
    if (pts<3) {
      // translate(cx, cy, 0); sphere(cr);
      ellipse(cx,cy,2*cr,2*cr);
    }
    else {
      beginShape();
      float a=phi;
      for (int i=0; i<pts; i++)  {
        vertex(X(i),Y(i));
        a+=2*PI/pts;
      }
      endShape(CLOSE);
    }
  }
  
  boolean In(float x, float y) {
    float d2=sq(x-this.cx)+sq(y-this.cy);
    if (d2>sq(this.cr)) return false;
    if (pts<3) return true;
    float angle=0;
    for (int i=0; i<pts; i++) {
      angle += Angle2D(X(i)-x,Y(i)-y,X((i+1)%pts)-x,Y((i+1)%pts)-y);
    }
    return abs(angle)>=PI;
  }
  
  boolean Intersect(Poly p) {
    float d=sqrt(sq(p.cx-this.cx)+sq(p.cy-this.cy));
    if (d>p.cr+this.cr) return false;
    // check if any point of p in inside this shape
    for (int i=0; i<p.pts; i++) {
      if (In(p.X(i),p.Y(i))) {return true;}
    }
    if (pts<3) return true; // it this shape is a circle, that's all
    //
    // check if any point of this polygon is in p
    for (int i=0; i<pts; i++) {
      if (p.In(X(i),Y(i))) {return true;}
    }
    // check if any edges intersect
    for (int i=0; i<pts; i++) {
      for (int j=0; j<p.pts; j++) {
        if (LineIntersect(X(i),Y(i),X((i+1)%pts),Y((i+1)%pts),p.X(j),p.Y(j),p.X((j+1)%p.pts),p.Y((j+1)%p.pts)))
          return true;
      }
    }
    return false; // ok, they do not intersect, after all
  }
}
  
ArrayList polys;

boolean Intersect(Poly p) {
  for (int i = 0; i<polys.size(); i++) // fast test
    {if (((Poly)polys.get(i)).In(p.cx,p.cy)) return true;}
  for (int i = 0; i<polys.size(); i++) // slower test
    {if (p.Intersect((Poly)polys.get(i))) return true;}
  return false;
}

float a;
int i=1;

void setup() {
  smooth();
  colorMode(RGB,255);
  size(800,600);
  background(0,0,64);  // dark blue
  noStroke();
  polys=new ArrayList();
  a=width*height/RiemannZeta();
  i=1;
}
  
void draw() {
  colorMode(HSB, 100);
  fill(i/10,100,100);
  Poly p=new Poly(n,a*g(i));
  p.Random(0,PI);
  for (int i=0; Intersect(p) && i<1000000; i++) {p.Random(0,PI);}
  if (i<1000000) {
    p.Draw();
    polys.add(p);
  }
  i++;
}

void keyPressed()
{
  if (key=='0') n=0;  // circle
  else if (key=='1') n=10;  // star
  else if (key=='2') n=4;
  else if (key=='3') n=3;
  else if (key=='4') n=4;
  else if (key=='5') n=5;
  else if (key=='6') n=6;
  else setup(); // restart
}

