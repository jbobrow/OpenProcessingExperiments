
DragonFractal f;

void setup() {
  size(400, 400);
  f = new DragonFractal(40, 1, .6, PI / 3, PI / 12);
  f.setStrokeRange(color( 30, 180,  45, 255), color(  0,   0,   0,  55));
  f.setFillRange(  color( 40,  20,  50, 255), color(100, 120, 250,  55));
  f.setStartLocation(width / 2, height / 2);
  f.setDrawOrder(Fractal.LAST);
  f.setRenderMode(DragonFractal.RECT);
}

void draw() {
  background(0);
  f.setOffsetAngles(map(mouseX, 0,  width, 0, TWO_PI),
                    map(mouseY, 0, height, 0, TWO_PI));
  f.followMouseAngle();
  f.draw();
}

void keyPressed() {
  switch(key) {
  case 't':
    f.setRenderMode(DragonFractal.TRIANGLE);
    break;
  case 'r':
    f.setRenderMode(DragonFractal.RECT);
    break;
  case 'e':
    f.setRenderMode(DragonFractal.ELLIPSE);
    break;
  }
}

class DragonFractal extends Fractal {
  
  int renderMode;
  
  DragonFractal(int startR, int endR, float dx, float d1, float d2) {
    super(startR, endR);
    drawFirst = false;
    children = new Recursor[] { new Recursor(-2*dx,  2*dx, 2*sqrt(2)*dx - 1, d1),
                                new Recursor( 2*dx, -2*dx, 2*sqrt(2)*dx - 1, d2) };
  }
    
  void init() {
    strokeWeight(1);
    rectMode(RADIUS);
    ellipseMode(RADIUS);
  }
  
  void pattern(float r) {
    switch(renderMode) {
    case RECT:
      rect(0, 0, r, r);
      break;
    case ELLIPSE:
      ellipse(0, 0, r, r);
      break;
    case TRIANGLE:
      triangle(-r, r / sqrt3, r, r / sqrt3, 0, -2 * r / sqrt3);
      break;
    }
  }
  
  static final int RECT     = 0,
                   ELLIPSE  = 1,
                   TRIANGLE = 2;
  void setRenderMode(int renderMode) {
    this.renderMode = renderMode;
  }
  
  void setOffsetAngle(int i, float t) {
    children[i].t = t;
  }
  
  void setOffsetAngles(float t0, float t1) {
    children[0].t = t0;
    children[1].t = t1;
  }
  
  void setOffsetAngles(float[] t) {
    children[0].t = t[0];
    children[1].t = t[1];
  }
}


abstract class Fractal {

  // determine recursion behaviour
  Recursor[] children;
  
  // determine location
  int   startX;
  int   startY;
  
  // determine dimension
  int   startR;
  int     endR;
  
  // determines orientation
  float startT;
  
  // determines whether to draw before recursing or vice-versa
  boolean drawFirst;
  static final boolean FIRST = true,
                       LAST  = false;
  
  // determine color traits
  boolean doStroke, doFill;
  color startFill, endFill;
  color startStroke, endStroke;
  
  // useful constants
  float sqrt2 = sqrt(2);
  float sqrt3 = sqrt(3);
  
  // Base Constructor
  Fractal(int startR, int endR) {
    setRadiusLimits(startR, endR);
  }

  // Method to control fractal
  void draw() {
    init();
    pushMatrix();
    translate(startX, startY);
    rotate(startT);
    fractal(0, 0, startR, 0);
    popMatrix();
  }
  
  // Called once before recursion
  abstract void init();
  
  // Pattern definition
  abstract void pattern(float r);
  
  // Run the show
  void fractal(float x, float y, float r, float t) {
    if (drawFirst) {
      display(x, y, r, t);
      recurse(x, y, r, t);
    }
    else {
      recurse(x, y, r, t);
      display(x, y, r, t);
    }
  }
  
  // Let's try this again
  void recurse(float x, float y, float r, float t) {
    for (Recursor child: children) {
      float dr = child.r;
      float newR = r*dr;
      if (newR > endR) {
        float dx = child.x;
        float dy = child.y;
        float dt = child.t;
        float c = cos(t);
        float s = sin(t);
        fractal(x + r*(dx*c - dy*s), y + r*(dx*s + dy*c), newR, t + dt);
      }
    }
  }

  // Draw each piece in its proper location and orientation
  void display(float x, float y, float r, float t) {
    pushMatrix();
    translate(x, y);
    rotate(t);
    applyColors(r);
    pattern(r);
    popMatrix();
  }
  
  // Set fill and stroke based on dimension
  void applyColors(float r) {
    float q = r / startR;
    if(doFill) fill(lerpColor(startFill, endFill, q));
    if(doStroke) stroke(lerpColor(startStroke, endStroke, q));
  }
    
  // Methods to control properties
  void setStartLocation(int startX, int startY) {
    this.startX = startX;
    this.startY = startY;
  }
  void setStartingAngle(float startT) {
    this.startT = startT;
  }
  void followMouseAngle() {
    setStartingAngle(atan2(startY - mouseY, startX - mouseX));
  }
  void setRadiusLimits(int startR, int endR) {
    this.startR = startR;
    this.endR = endR;
  }
  void setDrawOrder(boolean drawFirst) {
    this.drawFirst = drawFirst;
  }
  
  // Methods to control color
  void setFillRange(color startFill, color endFill) {
    this.startFill = startFill;
    this.endFill = endFill;
    doFill = true;
  }
  void setStrokeRange(color startStroke, color endStroke) {
    this.startStroke = startStroke;
    this.endStroke = endStroke;
    doStroke = true;
  }
  void noStroke() {
    doStroke = false;
  }
  void noFill() {
    doFill = false;
  }
}


class Recursor {
  
  float x, y, r, t;
  
  Recursor(float[] params) {
    x = params[0];
    y = params[1];
    r = params[2];
    t = params[3];
  }
  
  Recursor(float x, float y, float r, float t) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.t = t;
  }
  
  String toString() {
    return "[" + x + ", " + y + ", " + r + ", " + t + "]";
  }
}
