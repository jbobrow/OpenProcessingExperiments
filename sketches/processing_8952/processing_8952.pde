
// Using de Casteljau's algorithm to create a Bezier and derivatives
// (c) Alasdair Turner 2010
// Free software
// Licensed under the Creative Commons GNU GPL license

// control points (add as many as you like)
PVector [] P = { 
  new PVector( 10, 380 ),
  new PVector( 130, 60 ),
  new PVector( 230, 300 ),
  new PVector( 390, 10 )
};
PVector [] empty = {};

float u = 0.0;
float colstep;

PGraphics curveplot;

void setup()
{
  size(400,400);
  colorMode(HSB);
  colstep = 255.0 / (P.length + 1);
  // curveplot is used to remember the path of the Bezier to the current u value:
  curveplot = createGraphics(400,400,P2D);
  curveplot.beginDraw();
  curveplot.colorMode(HSB);
  curveplot.background(0);
  curveplot.smooth();
  curveplot.endDraw();
}

void draw()
{
  smooth();
  // curveplot simply contains the bezier curve as calculated to the current u value:
  image(curveplot,0,0);
  // step through u:
  u += 0.002;
  if (u >= 1.0) {
    curveplot.beginDraw();
    curveplot.background(0);
    curveplot.endDraw();
    u = 0.0;
  }
  // set up initial Q vector containing the control points only
  PVector [] Q = new PVector [P.length];
  for (int i = 0; i < P.length; i++) {
    Q[i] = P[i];
  }
  // now recurse though control points (col is color) 
  // with one fewer control points for each step
  float col = 0;
  while (Q.length > 0) {
    // prettification
    strokeWeight(12);
    stroke(col,255,255);
    // this simply draws the current Q vector    
    for (int i = 0; i < Q.length; i++) {
      point(Q[i].x,Q[i].y);
    }
    // prettification
    strokeWeight(4);
    // this draws the tangent vectors
    for (int j = 0; j < Q.length - 1; j++) {
      line(Q[j].x,Q[j].y,Q[j+1].x,Q[j+1].y);
    }
    // this adds a point to the memorised bezier up to the current u value:
    if (Q.length == 1) {
      curveplot.beginDraw();
      curveplot.strokeWeight(4);
      curveplot.stroke(col,255,255);
      curveplot.point(Q[0].x,Q[0].y);
      curveplot.endDraw();
    }
    // this recurses through de Casteljau's algorithm to calculate the points at degree d + 1:
    Q = Bezier(u,Q);
    // color for next set of points:
    col += colstep;
  }
}

// de Casteljau's algorithm
PVector [] Bezier(float u, PVector [] P)
{
  int d = P.length - 1;
  if (d == 0) {
    return empty;
  }
  // otherwise recursive calculation:
  PVector [] Q = new PVector [d];
  for (int n = 0; n < d; n++) {
    Q[n] = new PVector( 
      (1-u) * P[n].x + u * P[n+1].x,
      (1-u) * P[n].y + u * P[n+1].y
    );
  }
  return Q;
}




