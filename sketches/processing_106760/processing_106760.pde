
// CircleLerp.pde - Marius Watz, Aug 2013
// http://workshop.evolutionzone.com/

// tools for linear interpolation between angles [A,B],
// taking into account that degrees A and B could
// lie on either side of zero degrees and thus the
// shortest delta angle could be negative.

float a, b, t;
float B=0;
boolean doInitVal=true;
int col[];


void setup() {
  size(650, 650);

  col=new int[] {
    color(255, 100, 0), color(0, 255, 255)
  };
}

void draw() {
  background(0, 25, 50);

  if (doInitVal) initVal();

  b=radianAbs(b+radians(1));  

  pushMatrix();
  translate(width/2, height/2);

  drawArc();
  drawAngles();

  popMatrix();

  drawDebugText();
}

//////// RADIAN MATH
// Methods for finding absolute radian value,
// shortest angle between two angles and
// linear interpolation between two angles.
// Copy and paste this section to use in your own code.

float radianAbs(float a) {
  while (a<0) {
    a+=TWO_PI;
  } 
  while(a>TWO_PI) {
    a-=TWO_PI;
  } 

  return a;
}

float radianLerp(float a, float b, float t) {
  float D=radianShortest(a, b);
  return a+D*t;//a+D*t;
}

float radianShortest(float a, float b) {
  float D, D2;

  D=radianAbs(b-a);
  D2=-radianAbs((a-b));

  if (abs(D)>abs(D2)) D=D2;
  return D;
}


// DRAWING METHODS

void drawAngles() {
  float r;

  PVector va=new PVector(200, 0, 0);
  PVector vb=new PVector(300, 0, 0);
  rotate(va, a);
  rotate(vb, b);

  fill(255);

  textAlign(CENTER);
  text("a", va.x+va.x/20, va.y+va.y/20+6);
  text("b", vb.x+vb.x/30, vb.y+vb.y/30+6);

  // draw unit circle for reference
  noFill();
  stroke(255);//0,100,200);
  strokeWeight(1);

  r=300;  
  ellipse(0, 0, r*2, r*2);
  r=320;
  line(-r, 0, r, 0);
  line(0, -r, 0, r);

  // draw angles a and b
  strokeWeight(3);  
  stroke(col[0]);

  r=200;
  //  arc(0,0,r*0.5,r*0.5, 0,a);
  arc(0, 0, r*2, r*2, 0, a);
  line(0, 0, va.x, va.y);


  stroke(col[1]);
  r=300;
  //  arc(0,0,r*0.5,r*0.5, 0,b);
  arc(0, 0, r*2, r*2, 0, b);
  line(0, 0, vb.x, vb.y);
}

void drawArc() {
  PVector vv=new PVector();
  float r=150;

  float c=radianLerp(a, b, 1);
  float D=radianShortest(a, b);
  float inc=3.0/degrees(abs(radianShortest(a, b)));

  strokeWeight(1);
  strokeCap(SQUARE);

  if (D<0) stroke(255, 0, 0);
  else stroke(255);

  fill(255);
  if (D<0) fill(255, 0, 0);
  vv.set(r, 0, 0);
  c=radianLerp(a, b, 0.5);
  rotate(vv, c);

  textAlign(CENTER);

  vv.add(vv.x/10, vv.y/10);
  line(0,0,vv.x,vv.y);
  vv.add(vv.x/10, vv.y/10);
  text("D = "+strDeg(D), vv.x,vv.y+6);

  for (float tt=0; tt<=1; tt+=inc) {
    vv.set(r, 0, 0);
    c=radianLerp(a, b, tt);

    rotate(vv, c);
    line(vv.x*0.5, vv.y*0.5, vv.x, vv.y);
  }

  float aa=radianAbs(a);
  float bb=(a+D);

  // arc(x,y,w,h,start,end) needs "start" < "end"
  // so we use min() and max to get the order right  
  //  arc(0, 0, r/2, r/2, min(aa, bb), max(aa, bb));

  noFill();
  arc(0, 0, r, r, min(aa, bb), max(aa, bb));
  arc(0, 0, r*2, r*2, min(aa, bb), max(aa, bb));
}

void drawDebugText() {
  float deg=radianShortest(a, b);

  textAlign(RIGHT);
  float tx=width-10, ty=20;

  fill(col[0]);
  text("a = "+strDeg(a), tx, ty);

  fill(col[1]);
  text("b = "+strDeg(radianAbs(b)), tx, ty+12);

  fill(255);
  if (deg<0) fill(255, 0, 0);
  text("shortest angle = "+strDeg(deg), tx, ty+24);
}

void initVal() {
  a=HALF_PI;
  B+=HALF_PI*0.33f;
  b=a+B;

  a=random(TWO_PI);
  b=a+random(0.1f, 1.2f)*rndSign()*PI;
  doInitVal=false;
}

// MISCELLANEOUS - Utility methods
void keyPressed() {
  doInitVal=true;
}

void mousePressed() {
  doInitVal=true;
}

String strDeg(float a) {
  return ""+(int)(a*RAD_TO_DEG);
}

float rndSign() {
  return random(100)<50 ? -1 : 1;
}

PVector rotate(PVector v, float deg) {
  double sindeg, cosdeg;
  double newy, newx;

  double x=v.x, y=v.y;
  sindeg=Math.sin(deg); 
  cosdeg=Math.cos(deg);
  newx=x*cosdeg-y*sindeg;
  newy=x*sindeg+y*cosdeg;
  v.set((float)newx, (float)newy);
  return v;
}

