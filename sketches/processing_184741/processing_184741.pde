
// rotation without rotate() and translate()
int numPts, alpha;
float sz1, sz2, orbitRad, ang1, ang2, ang3, dx, dy ;
Pnt[] pnts1, pnts2;

void setup() {
  size(600, 600);
  sz1 = 200;
  sz2 = 50;
  orbitRad = sz1-sz2;
  numPts = 40;
  alpha = 255;
}

void draw() {
  background(0);
  stroke(51, 0, 0);
  strokeWeight(20);
  fill(204, 104, 0, alpha);
  rect(0, 0, width, height);

  // smaller poly orbits around larger poly's center point
  ang1 += .1;
  dx = cos(radians(ang1))*orbitRad;
  dy = sin(radians(ang1))*orbitRad;

  // rotate each poly on it's own center point
  ang2 -= .5; //        in opposite directions
  ang3 += .5;

  // outer poly
  pnts1 = makePoly(width/2, height/2, numPts, sz1, ang2, 
  color(190), 1, color(153, 51, 0, alpha));

  // inner
  pnts2 = makePoly(width/2+dx, height/2+dy, numPts, sz2, ang3, 
  color(190), 3, color(204, 153, 0, alpha));

  // connect the 2 polys
  stroke(255);
  strokeWeight(.5);
  for (int i = 0; i < numPts; i++) {
    line(pnts1[i].x, pnts1[i].y, pnts2[i].x, pnts2[i].y); // use this
  }
  //line(pnts1[0].x, pnts1[0].y, pnts1[20].x, pnts1[20].y); // or this
  //line(pnts2[0].x, pnts2[0].y, pnts2[20].x, pnts2[20].y);
  
  if(keyPressed) alpha = 0;
  else alpha = 255;
}

// trimmed version of Ira Greenberg's Polygon Creator
Pnt[] makePoly(float x, float y, int verts, float rad, float ang, 
color strokeCol, float strokeWt, color fillCol) {
  Pnt[] p = new Pnt[verts];
  float px, py;
  float angle = ang;
  stroke(strokeCol);
  strokeWeight(strokeWt);
  strokeJoin(ROUND);
  fill(fillCol);

  beginShape();
  for (int i = 0; i< verts; i++) {
    px = x+cos(radians(angle))*rad;
    py = y+sin(radians(angle))*rad;
    vertex(px, py);
    p[i] = new Pnt(px, py);
    angle += 360/verts;
  }
  endShape(CLOSE);
  return p;
}

class Pnt {
  // or use: import java.awt.Point;
  float x, y;
  Pnt(float xin, float yin) {
    x = xin;
    y = yin;
  }
}



