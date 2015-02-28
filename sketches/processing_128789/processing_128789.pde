
Draggables p;                 // the draggable points
float radius = 20;            // the radius of a point
color red, yellow, white, blue, black, green;
OptionsButton button;
int buttonH = 30;  //the dimensions of the button
float t;               //parameter t, used for drawing the parametric curves     
Point[][] points;
Point[][] smallPoints;
int splits = 0;

void setup() {
  size(700, 500);
  PFont pf = createFont("Helvetica-Bold", 20);
  textFont(pf);
  red = color(186, 45, 50);
  green = color(70, 170, 48);
  yellow = color(247, 220, 89);
  white = color(254, 254, 246);
  blue = color(7, 39, 136);
  black = color(2, 4, 8);
  points = new Point[5][];
  smallPoints = new Point[2][];
  initDraggables();
  generatePoints();
  String[] options = {"split!", "combine!"};
  button = new OptionsButton(width-200, height-buttonH, 200, buttonH, white, color(100), options, splits);
}

void draw() {
  background(black);
  drawBottomRectangle();
  button.redraw();
  t = (t+0.005) % 1; 
  p.update();
  updatePoints();
  drawLines();
  if (splits == 0) {
    drawCurve(points[0][0], points[0][1], points[0][2], points[0][3]);
  } else {
    drawCurve(points[0][0], points[1][0], points[2][0], points[3][0]);
    drawCurve(points[3][0], points[2][1], points[1][2], points[0][3]);
  }
  drawPoints();
  for (int i=0; i<4; i++) {
    points[0][i].setCoordinates(p.getX(i), p.getY(i));
    points[0][i].redraw(i);
  }
  splits = button.getOption();
}

void mouseReleased() {
  p.release();
}

void mouseClicked() {
  button.click();
}

void drawBottomRectangle() {
  stroke(100);
  strokeWeight(4);
  line(0, height-buttonH-8, width, height-buttonH-8);
  noStroke();
  fill(180);
  rect(0, height-buttonH-6, width, buttonH+6);
  fill(black);
  text("t = "+nf(t,1,3), 60, height-buttonH/2-3);
}

void initDraggables() {
  points[0] = new Point[4];
  float dx = width/10;
  float dy = (height-buttonH-8)/10;
  points[0][0] = new Point( 3*dx, 9*dy, white, red, radius, "P");
  points[0][1] = new Point( dx, dy, white, red, radius, "P");
  points[0][2] = new Point( 9*dx, dy, white, red, radius, "P");
  points[0][3] = new Point( 7*dx, 9*dy, white, red, radius, "P");
  p = new Draggables(points[0], radius);
}

void generatePoints() {
  color[] colors1 = {red, blue, green, yellow, white};
  color[][] colors2 = {{red, blue, green, white, white, yellow}, {green, blue, red, white, white, yellow}};
  String[] chars = {"P", "Q", "R", "S"};
  for (int i=1; i<4; i++) {
    points[i] = new Point[4-i];
    for (int j=0; j<points[i].length; j++) {
      points[i][j] = new Point(-100, -100, white, colors1[i], radius, chars[i]);
    }
  }
  for (int i=0; i<2; i++) {
    smallPoints[i] = new Point[6];
    for (int j = 0; j<smallPoints[i].length; j++) {
      smallPoints[i][j] = new Point(-100, -100, white, colors2[i][j], 10, "");
    }
  }
}

void updatePoints() {
  for (int i = 1; i<4; i++) {
    for (int k= 0; k<points[i].length; k++) {
      if (splits == 0) {
        points[i][k].x = (1-t)*points[i-1][k].x+t*points[i-1][k+1].x;
        points[i][k].y = (1-t)*points[i-1][k].y+t*points[i-1][k+1].y;
        points[i][k].redraw(k);
      } else {
        points[i][k].x = 0.5*points[i-1][k].x+0.5*points[i-1][k+1].x;
        points[i][k].y = 0.5*points[i-1][k].y+0.5*points[i-1][k+1].y;
        points[i][k].redraw(k);
      }
    }
  }
  updateSmallPoints(points[0][0], points[1][0], points[2][0], points[3][0], 0);
  updateSmallPoints(points[3][0], points[2][1], points[1][2], points[0][3], 1);
}

void updateSmallPoints(Point p0, Point p1, Point p2, Point p3, int i) {
  smallPoints[i][0].x = (1-t)*p0.x + t*p1.x;
  smallPoints[i][0].y = (1-t)*p0.y + t*p1.y;
  smallPoints[i][1].x = (1-t)*p1.x + t*p2.x;
  smallPoints[i][1].y = (1-t)*p1.y + t*p2.y;
  smallPoints[i][2].x = (1-t)*p2.x + t*p3.x;
  smallPoints[i][2].y = (1-t)*p2.y + t*p3.y;
  smallPoints[i][3].x = (1-t)*smallPoints[i][0].x + t*smallPoints[i][1].x;
  smallPoints[i][3].y = (1-t)*smallPoints[i][0].y + t*smallPoints[i][1].y;
  smallPoints[i][4].x = (1-t)*smallPoints[i][1].x + t*smallPoints[i][2].x;
  smallPoints[i][4].y = (1-t)*smallPoints[i][1].y + t*smallPoints[i][2].y;
  smallPoints[i][5].x = (1-t)*smallPoints[i][3].x + t*smallPoints[i][4].x;
  smallPoints[i][5].y = (1-t)*smallPoints[i][3].y + t*smallPoints[i][4].y;
}

void drawPoints() {
  if (splits == 1) {
    for (int i = 0; i<2; i++) {
      for (int k= 0; k<smallPoints[i].length; k++) {
        smallPoints[i][k].redraw(k);
      }
    }
  }
  for (int i = 1; i<4; i++) {
    for (int k= 0; k<points[i].length; k++) {
      points[i][k].redraw(k);
    }
  }
}
  
void drawLines() {
  color[] colors = {red, blue, green, yellow, white};
  strokeWeight(3);   
  for (int i = 0; i<4; i++) {
    stroke(colors[i]);
    for (int k= 0; k<(points[i].length-1); k++) {
      line(points[i][k].x, points[i][k].y, points[i][k+1].x, points[i][k+1].y);
    }
  }
  if (splits == 1) {
    strokeWeight(2);
    stroke(white);
    line(smallPoints[0][0].x, smallPoints[0][0].y, smallPoints[0][1].x, smallPoints[0][1].y);
    line(smallPoints[1][0].x, smallPoints[1][0].y, smallPoints[1][1].x, smallPoints[1][1].y);
    line(smallPoints[0][1].x, smallPoints[0][1].y, smallPoints[0][2].x, smallPoints[0][2].y);
    line(smallPoints[1][1].x, smallPoints[1][1].y, smallPoints[1][2].x, smallPoints[1][2].y);
    stroke(yellow);
    line(smallPoints[0][3].x, smallPoints[0][3].y, smallPoints[0][4].x, smallPoints[0][4].y);
    line(smallPoints[1][3].x, smallPoints[1][3].y, smallPoints[1][4].x, smallPoints[1][4].y);
  }
}

//the parametric curves
void drawCurve(Point p0, Point p1, Point p2, Point p3 ) {
  color[] colors = {red, blue, green, yellow, white};
  strokeWeight(5);
  stroke(yellow);
  float s = 0;
  PVector prev = new PVector(p0.x, p0.y);
  PVector p = new PVector(p0.x, p0.y);
  while (s<t) {
    s += 0.02;
    p.x = (1-s)*(1-s)*(1-s)*p0.x+3*(1-s)*(1-s)*s*p1.x+3*(1-s)*s*s*p2.x + s*s*s*p3.x;
    p.y = (1-s)*(1-s)*(1-s)*p0.y+3*(1-s)*(1-s)*s*p1.y+3*(1-s)*s*s*p2.y + s*s*s*p3.y;
    line(prev.x, prev.y, p.x, p.y);
    prev.x = p.x;
    prev.y = p.y;
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
    this.x = x-sWeight;
    this.y = y-sWeight;
    this.w = w;
    this.h = h;
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
/* Class to handle a button that cycles throw an array of options when clicked. */
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
  
  //assumes there is an area at bottom of height buttonH, where buttonH is a global variable
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
        } else if (mx >0 && my>0 && mx<width && my<(height-buttonH-radius-8)) {
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

class Point {
  
  float x, y, r;
  color textColor, fColor;
  String t;
  
  Point(float x, float y, color textColor, color fColor, float r, String t) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.textColor = textColor;
    this.fColor = fColor;
    this.t = t;
  }
  
  void setCoordinates(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void redraw(int number) {
    noStroke();
    ellipseMode(RADIUS);
    textSize(20);
    textAlign(CENTER, CENTER);
    fill(fColor);
    ellipse(x, y, r, r);
    fill(textColor);
    if (!t.equals("")) {
      text(""+t+number, round(x), round(y));
    }
  }
  
}


