
ArrayList <PVector> path;
boolean drawing = false;
int weight = 30;
PGraphics buffer;
color red, yellow, blue, black;

void setup() {
  size(700, 400, P2D);
  red = color(186, 45, 50);
  yellow = color(247, 220, 89);
  blue = color(7, 39, 136);
  black = color(2, 4, 8);
  buffer = createGraphics(width, height, P2D);
  resetBuffer();
  image(buffer, 0, 0);
}

void draw() {
  if (mousePressed) {
    if (!drawing) {
      path = new ArrayList<PVector>();
      path.add(new PVector(mouseX, mouseY));
      drawing = true;
    } else {
      strokeWeight(weight);
      stroke(yellow);
      line(pmouseX, pmouseY, mouseX, mouseY);
      if (dist(path.get(path.size()-1).x, path.get(path.size()-1).y, mouseX, mouseY)>1) {
        path.add(new PVector(mouseX, mouseY));
      }
    }
  }
}

void keyPressed() {
  if (key == 'c') {
    resetBuffer();
  }
}

void mouseReleased() {
  drawing = false;
  FatCurve fc = new FatCurve(path, weight);
  fc.drawCurve(red, 3, yellow, buffer);
  BezierSpline bs = new BezierSpline(path, false);
  bs.drawStroke(blue, 3, buffer);
  image(buffer, 0, 0);
}

void resetBuffer() {
  buffer.beginDraw();
  buffer.background(black);
  PFont pf = createFont("Helvetica", 20);
  buffer.textFont(pf);
  buffer.textSize(20);
  buffer.textAlign(CENTER, CENTER);
  buffer.fill(255);
  buffer.text("Draw! Press c to clear.", width/2, 20);
  buffer.endDraw();
  image(buffer, 0, 0);
}
/*********************************************************************************/
/* Class to draw an open or closed Bézier-curve defined by the points in "path". */ 
/*********************************************************************************/

class BezierSpline {
  PVector[] ctr;  //control points
  PVector[] anch; //anchor points
  boolean closed;
  boolean emptyPath;
  
  BezierSpline(ArrayList<PVector> path, boolean closed) {
    this.closed = closed;
    if (path.size()>0) {
      emptyPath = false;
      makeControlPoints(path);
      makeAnchorPoints(path);
    } else {
      emptyPath = true;
    }
  }
  
  //Draw on screen
  void drawSpline() {
    if (emptyPath) { return; }
    beginShape();
    vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, anch[i].x, anch[i].y);
      j += 2;
    }
    endShape();
  }
  
  //Draw on buffer pg without fill (preferably for open curves)
  void drawStroke(color sColor, int sWeight, PGraphics pg) {
    if (emptyPath) { return; }
    pg.beginDraw();
    pg.beginShape();
    pg.noFill();
    pg.stroke(sColor);
    pg.strokeWeight(sWeight);
    pg.vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      pg.bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, 
                      anch[i].x, anch[i].y);
      j += 2;
    }
    pg.endShape();
    pg.endDraw();
  }
  
  //Draw on buffer pg with fill (preferably for closed curves)
  void drawStrokeAndFill(color sColor, int sWeight, color fColor, PGraphics pg) {
    if (emptyPath) { return; }
    pg.beginDraw();
    pg.beginShape();
    pg.stroke(sColor);
    pg.fill(fColor);
    pg.strokeWeight(sWeight);
    pg.vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      pg.bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, 
                      anch[i].x, anch[i].y);
      j += 2;
    }
    pg.endShape();
    pg.endDraw();
  }

  /*******************************************/
  /* Methods for making the Bézier curve.    */
  /*******************************************/
  
  void makeControlPoints(ArrayList<PVector> p) {
    if (emptyPath) { return; }
    if (closed) {
      ctr = new PVector[p.size()*2];
    } else {
      ctr = new PVector[(p.size()-1)*2];
    }
    int j = 0;
    for (int i=0; i<(p.size()-1); i++) {
      float dx = p.get(i+1).x-p.get(i).x;
      float dy = p.get(i+1).y-p.get(i).y;
      ctr[j] = new PVector(p.get(i).x+dx/3, p.get(i).y+dy/3);
      ctr[j+1] = new PVector(p.get(i).x+2*dx/3, p.get(i).y+2*dy/3);
      j += 2;
    }
    if (closed) {
      PVector last = p.get(p.size()-1);
      float dx = p.get(0).x-last.x;
      float dy = p.get(0).y-last.y;
      ctr[j] = new PVector(last.x+dx/3, last.y+dy/3);
      ctr[j+1] = new PVector(last.x+2*dx/3, last.y+2*dy/3);
    } 
  }
  
  void makeAnchorPoints(ArrayList<PVector> p) {
    if (emptyPath) { return; }
    if (closed) {
      anch = new PVector[p.size()+1];
      anch[0] = new PVector((ctr[0].x+ctr[ctr.length-1].x)/2, 
                            (ctr[0].y+ctr[ctr.length-1].y)/2);
      anch[anch.length-1] = new PVector(anch[0].x, anch[0].y);
    } else {
      anch = new PVector[p.size()];
      anch[0] = new PVector(p.get(0).x, p.get(0).y);
      anch[anch.length-1] = new PVector(p.get(p.size()-1).x, p.get(p.size()-1).y);
    }
    int j = 1;
    for (int i = 1; i<(anch.length-1); i++) {
      anch[i] = new PVector((ctr[j].x+ctr[j+1].x)/2, (ctr[j].y+ctr[j+1].y)/2);
      j += 2;
    }
  }
  
}
/***********************************************************************/
/* Class to create a curve with width from the curve in "path".        */
/***********************************************************************/

class FatCurve {
  float radius;
  ArrayList<PVector> curve;
  
  FatCurve(ArrayList<PVector> path, float curveWidth) {
    curve = new ArrayList<PVector>();
    if (path.size() == 0) {
      return;
    }
    radius = curveWidth/2;
    if (path.size() == 1) {
      //make a blob
      radius = radius*1.5;
      curve.add(new PVector(path.get(0).x + radius, path.get(0).y));
      curve.add(new PVector(path.get(0).x, path.get(0).y + radius));
      curve.add(new PVector(path.get(0).x - radius, path.get(0).y));
      curve.add(new PVector(path.get(0).x, path.get(0).y - radius));
    } else {
      makeSemiCircle(path, path.get(0), path.get(1));
      makeFirstHalf(path);
      makeSemiCircle(path, path.get(path.size()-1), path.get(path.size()-2));
      makeSecondHalf(path);
    }
  }
  
  //Draw on screen
  void drawCurve() {
    BezierSpline b = new BezierSpline(curve, true);
    b.drawSpline();
  }
  
  //Draw on graphics buffer pg
  void drawCurve(color strokeC, int sWeight, color fillC, PGraphics pg) {
    BezierSpline b = new BezierSpline(curve, true);
    b.drawStrokeAndFill(strokeC, sWeight, fillC, pg);
  }
  
  ArrayList<PVector> getCurve() {
    return curve;
  }
  
  /****************************************/
  /* Methods for making the fat curve     */
  /****************************************/
  
  void makeSemiCircle(ArrayList<PVector> p, PVector first, PVector second) {
    float d = first.dist(second);
    float dx = (second.x-first.x)/d;
    float dy = (second.y-first.y)/d;
    curve.add(new PVector(first.x +dy*radius, first.y-dx*radius));
    curve.add(new PVector(first.x +(-0.87*dx+0.5*dy)*radius, first.y+(-0.5*dx-0.87*dy)*radius));
    curve.add(new PVector(first.x +(-0.87*dx-0.5*dy)*radius, first.y+(0.5*dx-0.87*dy)*radius));
    curve.add(new PVector(first.x -dy*radius, first.y+dx*radius));
  }
  
   void makeFirstHalf(ArrayList<PVector> p) {
    for (int i = 0; i<(p.size()-1); i++) {
      PVector p0, p1;
      p0 = p.get(i);
      p1 = p.get(i+1);
      float d = p0.dist(p1);
      float dx = (p1.x-p0.x)/d;
      float dy = (p1.y-p0.y)/d;
      PVector mid = new PVector((p0.x+p1.x)/2, (p0.y+p1.y)/2);
      curve.add(new PVector(mid.x-dy*radius, mid.y+dx*radius));
     }
  }
  
  void makeSecondHalf(ArrayList<PVector> p) {
    for (int i = (p.size()-1); i>0; i--) {
      PVector p0, p1;
      p0 = p.get(i);
      p1 = p.get(i-1);
      float d = p0.dist(p1);
      float dx = (p1.x-p0.x)/d;
      float dy = (p1.y-p0.y)/d;
      PVector mid = new PVector((p0.x+p1.x)/2, (p0.y+p1.y)/2);
      curve.add(new PVector(mid.x-dy*radius, mid.y+dx*radius));
     }
  }
  
}


