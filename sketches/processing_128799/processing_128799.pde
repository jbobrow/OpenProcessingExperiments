
Draggables p;       // the draggable points
float radius = 20;                // the radius of a point
color red, white, black;
color[] colors;         //alternating colors
int intColor;
float flatness = 1.001;
Slider slider;

void setup() {
  size(700, 500);
  red = color(186, 45, 50);
  white = color(254, 254, 246);
  black = color(2, 4, 8);
  colors = new color[2];
  colors[0] = red;
  colors[1] = white;
  initDraggables();
  PFont pf = createFont("Helvetica-Bold", 20);
  textFont(pf);
  slider = new Slider(width*0.6, height-30, width*0.3, 30, 1, 4, 3);
}

void draw() {
  background(black);
  drawBottomRectangle();
  slider.update();
  float value = slider.getValue();
  slider.redraw();
  flatness = 1+1/pow(10, value);
  p.update();
  intColor = 0;
  strokeWeight(5);
  //drawRecursiveCurve((PVector) p.getPoint(0), (PVector) p.getPoint(1), (PVector) p.getPoint(2), (PVector) p.getPoint(3));
  drawRecursiveCurve(new PVector(p.getX(0), p.getY(0)), new PVector(p.getX(1), p.getY(1)), 
                     new PVector(p.getX(2), p.getY(2)), new PVector(p.getX(3), p.getY(3)));
  p.redraw();
}

void mouseReleased() {
  p.release();
  slider.release();
}

void drawBottomRectangle() {
  stroke(100);
  strokeWeight(4);
  line(0, height-38, width, height-38);
  noStroke();
  fill(180);
  rect(0, height-36, width, 36);
  fill(black);
  textAlign(LEFT, CENTER);
  text("flatness factor = "+flatness, 0.1*width, height-19);
}

void initDraggables() {
  Point[] points = new Point[4];
  float dx = width/10;
  float dy = (height-38)/10;
  points[0] = new Point( 3*dx, 8*dy, white, red, radius, "P");
  points[1] = new Point( 9*dx, 8*dy, white, red, radius, "P");
  points[2] = new Point( dx, 6*dy, white, red, radius, "P");
  points[3] = new Point( 9*dx, dy, white, red, radius, "P");
  p = new Draggables(points, radius);
}

void drawRecursiveCurve(PVector p0, PVector p1, PVector p2, PVector p3) {
  stroke(colors[intColor]);
  float d1 = dist(p0.x, p0.y, p1.x, p1.y);
  float d2 = dist(p1.x, p1.y, p2.x, p2.y);
  float d3 = dist(p2.x, p2.y, p3.x, p3.y);
  float d4 = dist(p0.x, p0.y, p3.x, p3.y);
  if ((d1+d2+d3) < flatness*d4) {
    line(p0.x, p0.y, p3.x, p3.y);
    intColor = 1-intColor;
  } else {
    PVector q0 = mid(p0, p1);
    PVector q1 = mid(p1, p2);
    PVector q2 = mid(p2, p3);
    PVector r0 = mid(q0, q1);
    PVector r1 = mid(q1, q2);
    drawRecursiveCurve(p0, q0, r0, mid(r0, r1));
    drawRecursiveCurve(mid(r0, r1), r1, q2, p3);
  }
}

PVector mid(PVector p0, PVector p1) {
  return new PVector((p0.x+p1.x)/2, (p0.y+p1.y)/2);
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
  
  Draggables(Point[] p, float radius){
    draggables = new Point[p.length];
    stack = new int[p.length];
    for (int i=0; i<p.length; i++) {
      draggables[i] = new Point(p[i].x, p[i].y, p[i].textColor, p[i].fColor, p[i].r, p[i].t);
      stack[i] = i;
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
  
  int size() {
    return draggables.length;
  }
  
  void update() {
    float mx = mouseX;
    float my = mouseY;
    if (mousePressed) {
      for (int k=(stack.length-1); k>-1; k--) {
        int i = stack[k];
        if (draggedPoint == -1) {
          if (dist(draggables[i].x, draggables[i].y, mx, my)<=radius) {
            draggedPoint = i;
            moveToLast(k);  
          }
        } else if (mx >0 && my>0 && mx<width && my<(height-38-radius)) {
            draggables[draggedPoint].x = mx;
            draggables[draggedPoint].y = my;
        }
      }
    } 
  }
  
  void redraw() {
    for (int i=0; i<draggables.length; i++) {
      draggables[stack[i]].redraw(stack[i]);
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

class Point extends PVector {
  float r;
  color textColor, fColor;
  String t;
  
  Point(float x, float y, color textColor, color fColor, float r, String t) {
    super(x, y);
    this.r = r;
    this.textColor = textColor;
    this.fColor = fColor;
    this.t = t;
  }
  
  void setCoordinates(float x, float y) {
    super.x = x;
    super.y = y;
  }
  
  void redraw(int number) {
    noStroke();
    ellipseMode(RADIUS);
    textSize(20);
    textAlign(CENTER, CENTER);
    fill(fColor);
    ellipse(super.x, super.y, r, r);
    fill(textColor);
    if (!t.equals("")) {
      text(""+t+number, round(super.x), round(super.y));
    }
  }
  
}
/************************************************************/
/* Class to handle a horizontal slider                  *****/
/************************************************************/
class Slider {
  float x, y, w, h;
  float min, max;
  float value;
  int dragged = -1;
  float radius = 10;
  
  Slider(float x, float y, float w, float h, float min, float max, float value) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.min = min;
    this.max = max;
    this.value = value;
  }
  
  void update() {
    float mx = mouseX;
    float my = mouseY;
    float val = map(value, min, max, x, x+w);
    if (mx<x || my<y || mx>(x+w) || my>(y+h)) {
      dragged = -1;
      return;
    }
    if (mousePressed) {
      if (dragged == -1) {
        if (dist(val, y+h/2-3, mx, my)<=radius) {
          dragged = 1;
        }
      } else if (mx >x && my>y && mx<(x+w) && my<(y+h)) {
          value = round(map(mx, x, x+w, min, max));
      }
    } 
  }
  
  void redraw() {
    float mx = mouseX;
    float my = mouseY;
    stroke(100);
    strokeWeight(6);
    line(x, y+h/2-3, x+w, y+h/2-3);
    strokeWeight(2);
    fill(240);
    float val = map(value, min, max, x, x+w);
    ellipse(val, y+h/2-3, radius, 10);
    //hover effect
    if (dist(val, y+h/2-3, mx, my)<=radius) {
      fill(100, 100);
      ellipse(val, y+h/2-3, radius, radius);
    }
  }
  
  void release() {
    dragged = -1;
  }
  
  float getValue() {
    return value;
  }
}


