
/**
ClosestPointOnCurve, Dave Bollinger, circa 2006, revised 9/2010
numerical approximation by linearly subdividing the curves into a given number of segments
*/

int NDIVS = 100; // # of subdivisions, higher is more accurate, but slower, and vice versa
PVector [] cps; // curve control points
int ncps = 0; // how many control points we have so far
PVector pt; // clicked point
boolean havept = false; // do we have a clicked point yet
PFont font; // it's a font

void setup() {
  size(500,500,JAVA2D);
  smooth();
  font = createFont("",12);
  cps = new PVector[4];
  for (int i=0; i<4; i++)
    cps[i] = new PVector();
  ncps = 0;
  pt = new PVector();
  havept = false;
  noLoop();
}

void draw() {
  background(255); 
  drawInstructions();
  drawGeometry();
}

void drawInstructions() {
  fill(96);
  textFont(font);
  int textx = 5, texty = height-70;
  text("closest point on curve (by subdivision approximation)", textx, texty+=15);
  text("click 4 times to define curve control points", textx, texty+=15);
 // text("(control in blue, bezier in green, catmull-rom in red)", textx, texty+=15);
  text("then click/drag to (re-)define point", textx, texty+=15);
  text("right-click to reset", textx, texty+=15);
  textx = width-160;
  texty = height-70;
  text("blue = control points", textx, texty+=15);
  text("green = bezier curve", textx, texty+=15);
  text("red = catmull-rom curve", textx, texty+=15);
  text("black = click/closest points", textx, texty+=15);
}

void drawGeometry() {
  float sw = 3;
  float ed = sw * 3;
  strokeWeight(sw);
  noFill();
  // control points
  stroke(0,0,255);
  for (int i=0,j=1; i<ncps; i++,j++) {
    if (j < ncps)
      line(cps[i].x, cps[i].y, cps[j].x, cps[j].y);
    ellipse(cps[i].x,cps[i].y,ed,ed);
  }
  // curves
  if (ncps==4) {
    stroke(0,255,0);
    bezier(cps[0].x,cps[0].y, cps[1].x,cps[1].y, cps[2].x,cps[2].y, cps[3].x,cps[3].y);
    stroke(255,0,0);
    curve(cps[0].x,cps[0].y, cps[1].x,cps[1].y, cps[2].x,cps[2].y, cps[3].x,cps[3].y);
    if (havept) {
      stroke(0);
      // clicked
      ellipse(pt.x,pt.y,ed,ed);
      // closest on bezier
      PVector bpt = ClosestPointOnBezier(cps,pt,NDIVS);
      line(pt.x,pt.y,bpt.x,bpt.y);
      ellipse(bpt.x,bpt.y,ed,ed);
      // closest on catmull-rom
      PVector cpt = ClosestPointOnCatmullRom(cps,pt,NDIVS);
      line(pt.x,pt.y,cpt.x,cpt.y);
      ellipse(cpt.x,cpt.y,ed,ed);
    }
  }
}

//void keyPressed() { if (key=='`') saveFrame("ClosestPointOnCurve.png"); }

void mousePressed() {
  if (mouseButton==LEFT) {
    if (ncps < 4) {
      cps[ncps].set(mouseX,mouseY,0);
      ncps++;
    } else {
      pt.set(mouseX,mouseY,0);
      havept = true;
    } 
  } else {
    ncps = 0;
    havept = false;
  }
  redraw();
}

void mouseDragged() {
  if (mouseButton==LEFT && ncps==4) {
    pt.set(mouseX,mouseY,0);
    havept = true;
    redraw();
  }  
}

/**
 * Returns the closest point on a bezier curve relative to a search location.
 * This is only an approximation, by subdividing the curve a given number of times.
 * More subdivisions gives a better approximation but takes longer, and vice versa.
 * No concern is given to handling multiple equidistant points on the curve - the
 *   first encountered equidistant point on the subdivided curve is returned.
 *
 * @param cps    array of four PVectors that define the control points of the curve
 * @param pt     the search-from location
 * @param ndivs  how many segments to subdivide the curve into
 * @returns      PVector containing closest subdivided point on curve
 */
PVector ClosestPointOnBezier(PVector [] cps, PVector pt, int ndivs) {
  PVector result = new PVector();
  float bestDistanceSquared = 0;
  float bestT = 0;
  for (int i=0; i<=ndivs; i++) {
    float t = (float)(i) / (float)(ndivs);
    float x = bezierPoint(cps[0].x,cps[1].x,cps[2].x,cps[3].x,t);
    float y = bezierPoint(cps[0].y,cps[1].y,cps[2].y,cps[3].y,t);
    float dx = x - pt.x;
    float dy = y - pt.y;
    float dissq = dx*dx+dy*dy;
    if (i==0 || dissq < bestDistanceSquared) {
      bestDistanceSquared = dissq;
      bestT = t;
      result.set(x,y,0);
    }
  }
  return result;
}

/**
 * Returns the closest point on a catmull-rom curve relative to a search location.
 * This is only an approximation, by subdividing the curve a given number of times.
 * More subdivisions gives a better approximation but takes longer, and vice versa.
 * No concern is given to handling multiple equidistant points on the curve - the
 *   first encountered equidistant point on the subdivided curve is returned.
 *
 * @param cps    array of four PVectors that define the control points of the curve
 * @param pt     the search-from location
 * @param ndivs  how many segments to subdivide the curve into
 * @returns      PVector containing closest subdivided point on curve
 */
PVector ClosestPointOnCatmullRom(PVector [] cps, PVector pt, int ndivs) {
  PVector result = new PVector();
  float bestDistanceSquared = 0;
  float bestT = 0;
  for (int i=0; i<=ndivs; i++) {
    float t = (float)(i) / (float)(ndivs);
    float x = curvePoint(cps[0].x,cps[1].x,cps[2].x,cps[3].x,t);
    float y = curvePoint(cps[0].y,cps[1].y,cps[2].y,cps[3].y,t);
    float dx = x - pt.x;
    float dy = y - pt.y;
    float dissq = dx*dx+dy*dy;
    if (i==0 || dissq < bestDistanceSquared) {
      bestDistanceSquared = dissq;
      bestT = t;
      result.set(x,y,0);
    }
  }
  return result;
}

