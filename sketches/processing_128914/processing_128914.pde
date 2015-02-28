
ArrayList<PVector> p;       // the points on the drawn path
OptionsButton drawClosedButton;
Button clearButton;
int closed = 0;
boolean drawing = false;
color red, yellow, black, white;
int time = 0;      // add a delay to drawing
PVector[] ctr, anc;  //control and anchor points
float pmx, pmy;      //previous mouse coordinates

void setup() {
  size(700, 500);
  background(black);
  red = color(186, 45, 50);
  yellow = color(247, 220, 89, 150);
  black = color(2, 4, 8);
  white = color(254, 254, 246, 150);
  strokeWeight(3);
  PFont pf = createFont("Helvetica-Bold", 20);
  textFont(pf);
  String[] options = {"draw closed curve", "draw open curve"};
  drawClosedButton = new OptionsButton(width-220, height-30, 220, 30, white, color(100), options, closed);
  clearButton = new Button(width-440, height-30, 220, 30, white, color(100), "clear");
}

void draw() {
  float mx = mouseX;
  float my = mouseY;
  drawClosedButton.redraw();
  clearButton.redraw();
  if (mousePressed) {
    if (!drawing) {
      p = new ArrayList<PVector>();
      p.add(new PVector(mx, my));
      pmx = mx;
      pmy = my;
      drawing = true;
      time = 0;
    } else {
      stroke(red);
      if (time == 0) { //delay the drawn stroke to make it edgy
        if (dist(p.get(p.size()-1).x, p.get(p.size()-1).y, mx, my)>1) { // avoid several points at one spot
          line(pmx, pmy, mx, my);
          p.add(new PVector(mx, my));
          pmx = mx;
          pmy = my;
        }
      }
      time = (time+10)%3;
    }
  }
}

void mouseReleased() {
  drawing = false;
  BezierSpline bs = new BezierSpline(p, closed==1);
  stroke(255, 130);
  noFill();
  bs.drawSpline();
  if (clearButton.clicked() ) {
    background(black);
  }
  drawClosedButton.click();
  closed = drawClosedButton.getOption();
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
    if (closed) {  // add two points
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
/*************************************************************/
/* Class to handle a drawable button with a hover effect *****/
/************************************************************/
class Button {
  float x, y, w, h;
  color sColor, fColor;
  float radius;
  float sWeight = 4;
  int mode = 4;
  String t;
  
  Button(float x, float y, float w, float h, color sColor, color fColor) {
    this.x = x;
    this.y = y;
    this.w = w-sWeight;
    this.h = h-sWeight;
    this.sColor = sColor;
    this.fColor = fColor;
    this.radius = radius;
  }
  
  Button(float x, float y, float w, float h, color sColor, color fColor, String t) {
    this.x = x;
    this.y = y;
    this.w = w-sWeight;
    this.h = h-sWeight;
    this.sColor = sColor;
    this.fColor = fColor;
    this.radius = radius;
    this.t = t;
  }
  
  void redraw() {
    float mx = mouseX;
    float my = mouseY;
    fill(fColor);
    stroke(sColor);
    strokeWeight(4);
    rect(x, y, w, h, 10);
    fill(sColor);
    if (t != null) {
      textSize(0.8*h);
      textAlign(CENTER, CENTER);
      text(t, x+w/2, y+h/2);
    }
    //show a hover effect
    if (mx>x && mx<(x+w) && my>y && my<(y+h)) { 
      stroke(50);
      fill(250,100);
      rect(x, y, w, h, 10);
    }
  }
  
  boolean clicked() {
    float mx = mouseX;
    float my = mouseY;
    if (mx>x && mx<(x+w) && my>y && my<(y+h)) {
      return true;
    }
    return false;
  }
}

/********************************************************************************/
/* Class to handle a button that cycles through an array of options when clicked. */
/********************************************************************************/
class OptionsButton extends Button {
  String options[];
  int selected;
  
  //options contains the text shown
  OptionsButton(float x, float y, float w, float h, color sColor, color fColor, 
                String[] options, int selected) {
    super(x, y, w, h, sColor, fColor);
    this.options = new String[options.length];
    for (int i=0; i<options.length; i++) {
      this.options[i] = options[i];
    }
    this.selected = selected;
  }
  
  void redraw() {
    super.redraw();
    fill(sColor);
    textSize(0.8*h);
    textAlign(CENTER, CENTER);
    text(options[selected], x+w/2, y+h/2);
  }
  
  void click() {
    float mx = mouseX;
    float my = mouseY;
    if (mx>super.x && mx<(super.x+super.w) && my>super.y && my<(super.y+super.h)) {
      selected = (selected + 1) % options.length;
    }
  }
  
  int getOption() {
    return selected;
  }
 
}


