
import processing.opengl.*;

float r = 0.5;
float radius = r*80;
float unit = radius/8;

PVector startPoint = new PVector(-140, -140);
PVector p;
PVector q = startPoint;

ArrayList<PVector> g;

void setup() {
  size(600,600);
  background(#000000);
  smooth();
  strokeWeight(0.2f);
  stroke(0, 100); 
  frameRate(20);
}
PVector o;
//  
void draw() {
  fill(#000000, 10);
  rect(0, 0, width, height);
  fill(#FF7700, 255);
  strokeWeight(0.2f);
  p = drawShape(new PVLine(q, +90-60, 90*r).p2, r);
  q = drawShape(new PVLine(p, +90-120, 90*r).p2, r);
  if (p.x > width)
  {
    q.x = startPoint.x;
    q.y = new PVLine(q, -90, 90*r).p2.y;
    if (q.y > height+180) {
      q.y = startPoint.y;
    }
  }
  drawScanlines();
}

void drawScanlines(){
  strokeWeight(1);
  for(int i=0; i<height; i=i+2) {
    line(0,i,width,i);
  }
}

PVector drawShape(PVector o, float r) {
  
  float aR, bR, cR, dR, eR;
  
  aR = 10*r;
  bR = 55.68*r;
  cR = 51.96*r;
  dR = 70*r;
  eR = 80*r;
  
  int org = 90;
  PVector a = new PVLine(o, org+60, aR).p2;
  PVector b = new PVLine(o, org+8.95, bR).p2;
  PVector c = new PVLine(o, org+30, cR).p2;  
  PVector d = new PVLine(o, org+38.21, dR).p2;
  PVector e = new PVLine(o, org+0, eR).p2;
  PVector f = new PVLine(o, org+-38.21, dR).p2;
  PVector g = new PVLine(o, org+-30, cR).p2;  
  PVector h = new PVLine(o, org+-8.95, bR).p2;
  PVector i = new PVLine(o, org+-60, aR).p2;
  org = 90+120;				       	      
  PVector a1 = new PVLine(o, org+60, aR).p2;
  PVector b2 = new PVLine(o, org+8.95, bR).p2;
  PVector c3 = new PVLine(o, org+30, cR).p2;  
  PVector d4 = new PVLine(o, org+38.21, dR).p2;
  PVector e5 = new PVLine(o, org+0, eR).p2;
  PVector f6 = new PVLine(o, org+-38.21, dR).p2;
  PVector g7 = new PVLine(o, org+-30, cR).p2;  
  PVector h8 = new PVLine(o, org+-8.95, bR).p2;
  PVector i9 = new PVLine(o, org+-60, aR).p2;
  org = 90+120*2;				       	      
  PVector aA = new PVLine(o, org+60, aR).p2;
  PVector bB = new PVLine(o, org+8.95, bR).p2;
  PVector cC = new PVLine(o, org+30, cR).p2;  
  PVector dD = new PVLine(o, org+38.21, dR).p2;
  PVector eE = new PVLine(o, org+0, eR).p2;
  PVector fF = new PVLine(o, org+-38.21, dR).p2;
  PVector gG = new PVLine(o, org+-30, cR).p2;  
  PVector hH = new PVLine(o, org+-8.95, bR).p2;
  PVector iI = new PVLine(o, org+-60, aR).p2;

  beginShape();
  vertex(a.x, a.y);
  vertex(b.x, b.y);
  vertex(c.x, c.y);
  vertex(d.x, d.y);
  vertex(e.x, e.y);
  vertex(f.x, f.y);
  vertex(g.x, g.y);
  vertex(h.x, h.y);
  vertex(i.x, i.y);

  vertex(aA.x, aA.y);
  vertex(bB.x, bB.y);
  vertex(cC.x, cC.y);
  vertex(dD.x, dD.y);
  vertex(eE.x, eE.y);
  vertex(fF.x, fF.y);
  vertex(gG.x, gG.y);
  vertex(hH.x, hH.y);
  vertex(iI.x, iI.y);

  vertex(a1.x, a1.y);
  vertex(b2.x, b2.y);
  vertex(c3.x, c3.y);
  vertex(d4.x, d4.y);
  vertex(e5.x, e5.y);
  vertex(f6.x, f6.y);
  vertex(g7.x, g7.y);
  vertex(h8.x, h8.y);
  vertex(i9.x, i9.y);
  endShape(CLOSE);
  return o;
}


