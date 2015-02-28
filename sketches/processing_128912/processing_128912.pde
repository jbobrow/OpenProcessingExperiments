
Draggables p;       // anchor and control points
float radius = 20, smallRadius = 10;   
OptionsButton showClosedButton;
int closed = 0;
int buttonH = 30;  //the global variable buttonH is used in Draggables
color red, yellow, white, blue, black, green, gray;
float time = 0;;
PVector[] ctr, anc;  //control and anchor points

void setup() {
  size(700, 500);
  red = color(186, 45, 50);
  white = color(254, 254, 246);
  black = color(2, 4, 8);
  green = color(70, 170, 48);
  yellow = color(247, 220, 89);
  blue = color(7, 39, 136);
  gray = color(120);
  PFont pf = createFont("Helvetica-Bold", 20);
  textFont(pf);
  float dx = width/10;
  float dy = (height-buttonH-8)/10;
  Point[] points = new Point[5];
  points[0] = new Point( 3*dx, 9*dy, white, red, radius, "");
  points[1] = new Point( dx, 4*dy, white, red, radius, "");
  points[2] = new Point( 4*dx, dy, white, red, radius, "");
  points[3] = new Point( 9*dx, 5*dy, white, red, radius, "");
  points[4] = new Point( 8*dx, 8*dy, white, red, radius, "");
  p = new Draggables(points, radius);
  String[] options = {"show closed curve", "show open curve"};
  makeControlPoints();
  makeAnchorPoints();
  showClosedButton = new OptionsButton(width-220, height-buttonH, 220, buttonH, white, color(100), options, closed);
}

void draw() {
  background(black);
  time = (time+0.005) % 2;
  showClosedButton.redraw();
  p.update();
  updateControlPoints();
  updateAnchorPoints();
  drawBezierCurve();
  drawAShape();
  p.redraw();
  drawPoints();
}

void mouseReleased() {
  p.release();
}

void mouseClicked() {
  showClosedButton.click();
  int newOption = showClosedButton.getOption();
  if (newOption != closed) {
    closed = newOption;
    makeControlPoints();
    makeAnchorPoints();
  }
}

void makeControlPoints() {
  if (closed == 1) {
    ctr = new PVector[p.size()*2];
  } else {
    ctr = new PVector[(p.size()-1)*2];
  }
}

void makeAnchorPoints() {
  if (closed == 1) {
    anc = new PVector[p.size()+1];
  } else {
    anc = new PVector[p.size()];
  }
}

void updateControlPoints() {
  int j = 0;
  for (int i=0; i<(p.size()-1); i++) {
    float dx = p.getX(i+1)-p.getX(i);
    float dy = p.getY(i+1)-p.getY(i);
    ctr[j] = new PVector(p.getX(i)+dx/3, p.getY(i)+dy/3);
    ctr[j+1] = new PVector(p.getX(i)+2*dx/3, p.getY(i)+2*dy/3);
    j += 2;
  }
  if (closed == 1) {
    PVector last = new PVector(p.getX(p.size()-1), p.getY(p.size()-1)) ;
    float dx = p.getX(0)-last.x;
    float dy = p.getY(0)-last.y;
    ctr[j] = new PVector(last.x+dx/3, last.y+dy/3);
    ctr[j+1] = new PVector(last.x+2*dx/3, last.y+2*dy/3);
  } 
}

void updateAnchorPoints() {
  if (closed == 1) {
    anc[0] = new PVector((ctr[0].x+ctr[ctr.length-1].x)/2, (ctr[0].y+ctr[ctr.length-1].y)/2);
    anc[anc.length-1] = new PVector(anc[0].x, anc[0].y);
  } else {
    anc[0] = new PVector(p.getX(0), p.getY(0));
    anc[anc.length-1] = new PVector(p.getX(p.size()-1), p.getY(p.size()-1));
  }
  int j = 1;
  for (int i = 1; i<(anc.length-1); i++) {
    anc[i] = new PVector((ctr[j].x+ctr[j+1].x)/2, (ctr[j].y+ctr[j+1].y)/2);
    j += 2;
  }
}

void drawBezierCurve() {
  stroke(yellow);
  strokeWeight(5);
  noFill();
  beginShape();        
  vertex(anc[0].x, anc[0].y);
  int j = 0;
  for (int i = 1; i<anc.length; i++) {
    bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, anc[i].x, anc[i].y);
    j += 2;
  }
  endShape();
}

void drawAShape() {
  stroke(yellow);
  strokeWeight(2);   
  for (int i = 1; i<ctr.length-2; i +=2) {
    line(ctr[i].x, ctr[i].y, ctr[i+1].x, ctr[i+1].y);
  }
  if (closed == 1) {
    line(ctr[0].x, ctr[0].y, ctr[ctr.length-1].x, ctr[ctr.length-1].y);
  }
  strokeWeight(5);
  stroke(red);    //draw segments between points
  for (int i=0; i<(p.size()-1); i++) {
    line(p.getX(i), p.getY(i), p.getX(i+1), p.getY(i+1));
  }
  if (closed == 1) {
    stroke(red, 100);
    line(p.getX(0), p.getY(0), p.getX(p.size()-1), p.getY(p.size()-1));
  }
  
}

void drawPoints() {
  noStroke();
  fill(yellow);
  int r = 7;
  for (int i = 0; i<anc.length; i++) {
    ellipse(anc[i].x, anc[i].y, r, r);
  }
  fill(blue);
  for (int i = 0; i<ctr.length; i++) {
    ellipse(ctr[i].x, ctr[i].y, r, r);
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
  
  Button(float x, float y, float w, float h, color sColor, color fColor) {
    this.x = x;
    this.y = y;
    this.w = w-sWeight;
    this.h = h-sWeight;
    this.sColor = sColor;
    this.fColor = fColor;
    this.radius = radius;
  }
  
  void redraw() {
    float mx = mouseX;
    float my = mouseY;
    fill(fColor);
    stroke(sColor);
    strokeWeight(4);
    rect(x, y, w, h, 10);
    //show a hover effect
    if (mx>x && mx<(x+w) && my>y && my<(y+h)) { 
      stroke(50);
      fill(250,100);
      rect(x, y, w, h, 10);
    }
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
/**************************************************************************/
/* Class to draw a set of draggable points. When dragging a point, no     */
/* other point should be dragged. When  point 1 is dragged onto point 2,  */ 
/* point 2 should be partly hidden. Next time the mouse hits the area of  */
/* collision, point 1 should be dragged.                                   */
/**************************************************************************/

class Draggables {
  
  Point[] draggables;
  //A stack of indeces. The index of a dragged point is moved to the last position in stack.
  //Draw points in stack-order, update move in reverse stack-order
  int[] stack; 
  int draggedPoint = -1;
  float radius;
  boolean[] locked;
  
  Draggables(Point[] p, float radius){
    draggables = new Point[p.length];
    stack = new int[p.length];
    locked = new boolean[p.length];
    for (int i=0; i<p.length; i++) {
      draggables[i] = new Point(p[i].x, p[i].y, p[i].textColor, p[i].fColor, p[i].r, p[i].t);
      stack[i] = i;
      locked[i] = false;
    }
    this.radius = radius;
  }
  
  float getX(int i) {
    return draggables[i].x;
  }
  
  float getY(int i) {
    return draggables[i].y;
  }
  
  Point getPoint(int i) {
    return draggables[i];
  }
  
  void setX(float x, int i) {
    draggables[i].x =x;
  }
  
  void setY(float y, int i) {
    draggables[i].y =y;
  }
  
  void lock(int i) {
    locked[i] = true;
    draggables[i].lock();
  }
  
  void unLock(int i) {
    locked[i] = false;
    draggables[i].unLock();
  }
  
  int size() {
    return draggables.length;
  }
  
  //assumes there is an area at bottom of height buttonH, where buttonH is a global variable
  void update() {
    float mx = mouseX;
    float my = mouseY;
    if (mousePressed) {
      for (int k=(stack.length-1); k>-1; k--) {
        int i = stack[k];
        if (!locked[i]) {
          if (draggedPoint == -1) {
            if (dist(draggables[i].x, draggables[i].y, mx, my)<=radius) {
              draggedPoint = i;
              moveToLast(k);  
            }
          } else if (mx >0 && my>0 && mx<width && my<(height-buttonH-radius)) {
              draggables[draggedPoint].x = mx;
              draggables[draggedPoint].y = my;
          }
        }
      }
    } 
  }
  
  void redraw() {
    for (int i=0; i<draggables.length; i++) {
      draggables[stack[i]].redraw();
    }
  }
  
  void release() {
    draggedPoint = -1;
  }
  
  //place the dragged index at the last position in the stack of indeces
  void moveToLast(int i) {
    int temp = stack[i];
    for (int k=i; k<(stack.length-1); k++) {
      stack[k] = stack[k+1];
    }
    stack[stack.length-1] = temp;
  }
  
}
/************************************************************************/
/* Class to draw a point and show some text in the middle of the point  */
/************************************************************************/

class Point {
  float x, y, r;
  color textColor, fColor;
  String t;
  boolean locked = false;
  
  Point(float x, float y, color textColor, color fColor, float r, String t) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.textColor = textColor;
    this.fColor = fColor;
    this.t = t;
  }
  
  void redraw() {
    noStroke();
    ellipseMode(RADIUS);
    textSize(r);
    textAlign(CENTER, CENTER);
    if (locked) {
      fill(120);
    } else {
      fill(fColor);
    }
    ellipse(x, y, r, r);
    fill(textColor);
    text(t, x, y);
  }
  
  void lock() {
    locked = true;
  }
  
  void unLock() {
    locked = false;
  }
  
}


