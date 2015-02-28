
Draggables p;       // anchor and control points
float radius = 20, smallRadius = 10;   
OptionsButton showVelocityButton, showMirrorsButton, lockAShapeButton;
int showVelocity = 1, showMirrors = 0, lockAShape = 0;
int buttonH = 30;  //the global variable buttonH is used in Draggables
color red, yellow, white, blue, black, green, gray;
float time = 0;;
Point movingPoint;
Point[] vel, acc;
Point[] mirrors;

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
  Point[] points = new Point[7];
  points[0] = new Point( 2*dx, 9*dy, white, red, radius, "A0");
  points[1] = new Point( dx, 7*dy, red, white, radius, "C0");
  points[2] = new Point( 2*dx, 4*dy, red, white, radius, "C1");
  points[3] = new Point( 5*dx, 3*dy, white, red, radius, "A1");
  points[4] = new Point( 7*dx, 5*dy, red, white, radius, "C2");
  points[5] = new Point( 9*dx, 8*dy, red, white, radius, "C3");
  points[6] = new Point( 8*dx, dy, white, red, radius, "A2");
  p = new Draggables(points, radius);
  movingPoint = new Point(0, 0, black, white, smallRadius, "s"); 
  vel = new Point[2];
  vel[0] = new Point(0, 0, white, green, smallRadius, "v");
  vel[1] = new Point(0, 0, white, green, smallRadius, "v");
  acc = new Point[2];
  acc[0] = new Point(0, 0, white, blue, smallRadius, "a");
  acc[1] = new Point(0, 0, white, blue, smallRadius, "a");
  makeButtons();
  mirrors = new Point[3];
  mirrors[0] = new Point(0, 0, black, yellow, smallRadius, "C0'");
  mirrors[1] = new Point(0, 0, black, yellow, smallRadius, "C3'");
  mirrors[2] = new Point(0, 0, white, gray, smallRadius, "C1'");
}

void draw() {
  background(black);
  time = (time+0.005) % 2;
  showVelocityButton.redraw();
  showMirrorsButton.redraw();
  lockAShapeButton.redraw();
  p.update();
  movePoint(time);
  updateVelAndAcc(time);
  updateMirrors();
  noFill();
  drawVelocityCurve();
  drawAccelerationCurve();
  drawBezierCurve();
  if (showVelocity == 1) {
    drawVelAndAcc(time);
  }
  if (showMirrors == 1) {
    drawMirrors();
  }
  p.redraw();
}

void mouseReleased() {
  p.release();
}

void mouseClicked() {
  showVelocityButton.click();
  showMirrorsButton.click();
  lockAShapeButton.click();
  showVelocity = showVelocityButton.getOption();
  showMirrors = showMirrorsButton.getOption();
  lockAShape = lockAShapeButton.getOption();
  if (lockAShape == 1) {
    lockToAShape();
  } else {
    unlockAShape();
  }
}

/********************************************************************************/
/* Methods to update and draw points and vectors.                               */
/********************************************************************************/

void movePoint(float s) {
  int i;
  if (s<=1) {
    i = 0;
  } else {
    i = 3; 
    s -= 1;
  }
  movingPoint.x = (1-s)*(1-s)*(1-s)*p.getX(i)+3*(1-s)*(1-s)*s*p.getX(i+1)+3*(1-s)*s*s*p.getX(i+2) + s*s*s*p.getX(i+3);
  movingPoint.y = (1-s)*(1-s)*(1-s)*p.getY(i)+3*(1-s)*(1-s)*s*p.getY(i+1)+3*(1-s)*s*s*p.getY(i+2) + s*s*s*p.getY(i+3);
}

void updateVelAndAcc(float s) {
  int i;
  if (s<=1) {
    i = 0;
  } else {
    i = 3; 
    s -= 1;
  }
  PVector v = new PVector(0, 0);
  v.x = 0.25*( (1-s)*(1-s)*(p.getX(i+1)-p.getX(i)) +2*(1-s)*s*(p.getX(i+2)-p.getX(i+1)) + s*s*(p.getX(i+3)-p.getX(i+2)) );
  v.y = 0.25*( (1-s)*(1-s)*(p.getY(i+1)-p.getY(i)) +2*(1-s)*s*(p.getY(i+2)-p.getY(i+1)) + s*s*(p.getY(i+3)-p.getY(i+2)) );
  vel[0].x = v.x+movingPoint.x;
  vel[0].y = v.y+movingPoint.y;
  vel[1].x = v.x + width/2;
  vel[1].y = v.y + height*0.5;
  v.x = 0.5*((1-s)*(p.getX(i)-2*p.getX(i+1)+p.getX(i+2))+s*(p.getX(i+3)-2*p.getX(i+2)+p.getX(i+1)));
  v.y = 0.5*((1-s)*(p.getY(i)-2*p.getY(i+1)+p.getY(i+2))+s*(p.getY(i+3)-2*p.getY(i+2)+p.getY(i+1)));
  acc[0].x = v.x+movingPoint.x;
  acc[0].y = v.y+movingPoint.y;
  acc[1].x = v.x + width/2;
  acc[1].y = v.y + height*0.5;
}

void drawVelAndAcc(float s) {
  if (showVelocity == 1) {
    stroke(green);
    strokeWeight(3);
    line(movingPoint.x, movingPoint.y, vel[0].x, vel[0].y);
    line(width/2, height*0.5, vel[1].x, vel[1].y);
    stroke(blue);
    line(movingPoint.x, movingPoint.y, acc[0].x, acc[0].y);
    line(width/2, height*0.5, acc[1].x, acc[1].y);
  }
  movingPoint.redraw();
  for (int i = 0; i<2; i++) {
      vel[i].redraw();
      acc[i].redraw();
    }
}

void updateMirrors() {
  mirrors[0].x = 2*p.getX(2)-p.getX(1);
  mirrors[0].y = 2*p.getY(2)-p.getY(1);
  mirrors[1].x = 2*p.getX(4)-p.getX(5);
  mirrors[1].y = 2*p.getY(4)-p.getY(5);
  mirrors[2].x = 2*p.getX(3)-p.getX(2);
  mirrors[2].y = 2*p.getY(3)-p.getY(2);
  if (lockAShape == 1) {
     p.setX(mirrors[2].x, 4);
     p.setY(mirrors[2].y, 4);
     p.setX(2*mirrors[2].x-mirrors[0].x, 5);
     p.setY(2*mirrors[2].y-mirrors[0].y, 5);
     stroke(gray);
     strokeWeight(3);
     line(p.getX(1), p.getY(1), mirrors[1].x, mirrors[1].y);
     line(p.getX(5), p.getY(5), mirrors[1].x, mirrors[1].y);
     line(p.getX(2), p.getY(2), p.getX(4), p.getY(4));
  }
}

void drawMirrors() {
  stroke(yellow);
  strokeWeight(3);
  line(p.getX(1), p.getY(1), mirrors[0].x, mirrors[0].y);
  line(p.getX(5), p.getY(5), mirrors[1].x, mirrors[1].y);
  stroke(gray);
  line(p.getX(2), p.getY(2), mirrors[2].x, mirrors[2].y);
  mirrors[0].redraw();
  mirrors[1].redraw();
  mirrors[2].redraw();
}

/********************************************************************************/
/* Methods to draw curves                       .                               */
/********************************************************************************/

void drawBezierCurve() {
  stroke(red);
  strokeWeight(5);
  beginShape();
  vertex( p.getX(0), p.getY(0) );
  for (int i=1; i<7; i += 3) {
    bezierVertex(p.getX(i), p.getY(i), p.getX(i+1), p.getY(i+1), p.getX(i+2), p.getY(i+2));
  }
  endShape();
}

void drawVelocityCurve() {
  strokeWeight(2);
  stroke(green);
  PVector v = new PVector(0, 0);
  for (int i = 0; i<4; i +=3 ) {
    PVector prev = new PVector(0.25*(p.getX(1+i)-p.getX(i)) + width/2, 0.25*(p.getY(1+i)-p.getY(i)) + height/2);
    float s = 0;
    while (s<1) {
      s += 0.05;
      v.x = 0.25*( (1-s)*(1-s)*(p.getX(i+1)-p.getX(i)) +2*(1-s)*s*(p.getX(i+2)-p.getX(i+1)) + s*s*(p.getX(i+3)-p.getX(i+2)) ) + width/2;
      v.y = 0.25*( (1-s)*(1-s)*(p.getY(i+1)-p.getY(i)) +2*(1-s)*s*(p.getY(i+2)-p.getY(i+1)) + s*s*(p.getY(i+3)-p.getY(i+2)) ) + height/2;
      line(prev.x, prev.y, v.x, v.y);
      prev.x = v.x;
      prev.y = v.y;
    }
  } 
}

void drawAccelerationCurve() {
  strokeWeight(2);
  stroke(blue);
  PVector v = new PVector(0, 0);
  for (int i = 0; i<4; i +=3 ) {
    PVector prev = new PVector(0.5*(p.getX(i)-2*p.getX(i+1)+p.getX(i+2)) + width/2, 0.5*(p.getY(i)-2*p.getY(i+1)+p.getY(i+2)) + height/2);
    float s = 0;
    while (s<1) {
      s += 0.05;
      v.x = 0.5*((1-s)*(p.getX(i)-2*p.getX(i+1)+p.getX(i+2))+s*(p.getX(i+3)-2*p.getX(i+2)+p.getX(i+1))) + width/2;
      v.y = 0.5*((1-s)*(p.getY(i)-2*p.getY(i+1)+p.getY(i+2))+s*(p.getY(i+3)-2*p.getY(i+2)+p.getY(i+1))) + height/2;
      line(prev.x, prev.y, v.x, v.y);
      prev.x = v.x;
      prev.y = v.y;
    }
  } 
}

/********************************************************************************/
/* Methods that handles buttons.                                                */
/********************************************************************************/

void lockToAShape() {
  p.lock(4);
  p.lock(5);
}

void unlockAShape() {
  p.unLock(4);
  p.unLock(5);
}

void makeButtons() {
  String[] options = {"show velocity vectors", "hide velocity vectors"};
  showVelocityButton = new OptionsButton(2, height-buttonH, width/3, buttonH, white, color(100), options, 1);
  options[0] = "show mirror points";
  options[1] = "hide mirror pointss";
  showMirrorsButton = new OptionsButton(2+width/3, height-buttonH, width/3, buttonH, white, color(100), options, 0);
  options[0] = "lock to A-shape";
  options[1] = "unlock A-shape";
  lockAShapeButton = new OptionsButton(2+2*width/3, height-buttonH, width/3, buttonH, white, color(100), options, 0);
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


