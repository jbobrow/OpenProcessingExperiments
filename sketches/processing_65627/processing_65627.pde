
PVector [] pj = new PVector[6];
void setup() {
  size(640, 480);
  pj[0] = new PVector(100, 150);
  pj[1] = new PVector(170, 210);
  pj[2] = new PVector(260, 220);
  pj[3] = new PVector(230, 100);
  pj[4] = new PVector(140, 150);
  pj[5] = new PVector(120, 90);
}
void draw() {
  //  translate(width*0.25,height*0.25);

  background(255);
  PVector m = new PVector(mouseX, mouseY);
  for (int i = 0; i < pj.length; i++) {
    ellipse(pj[i].x, pj[i].y, 10, 10);
    if (i<pj.length-1)line(pj[i].x, pj[i].y, pj[i+1].x, pj[i+1].y);
  }
  if (inPolyCheck(m, pj)==1) ellipse(m.x, m.y, 15, 15);
}
int inPolyCheck(PVector v, PVector [] p) {
  float a = 0;
  for (int i =0; i<p.length-1; ++i) {
    PVector v1 = p[i].get();
    PVector v2 = p[i+1].get();
    a += vAtan2cent180(v, v1, v2);
  }
  PVector v1 = p[p.length-1].get();
  PVector v2 = p[0].get();
  a += vAtan2cent180(v, v1, v2);
//  if (a < 0.001) println(degrees(a));

  if (abs(abs(a) - TWO_PI) < 0.01) return 1;
  else return 0;
}
float vAtan2cent180(PVector cent, PVector v2, PVector v1) {
  PVector vA = v1.get();
  PVector vB = v2.get();
  vA.sub(cent);
  vB.sub(cent);
  vB.mult(-1);
  float ang = atan2(vB.x, vB.y) - atan2(vA.x, vA.y);
  if (ang < 0) ang = TWO_PI + ang;
  ang-=PI;
  return ang;
}
