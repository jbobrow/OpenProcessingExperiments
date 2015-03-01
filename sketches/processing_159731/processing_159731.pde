
Draggables p;       // draggable points
float radius = 10;  // radius of point
GenCircle[] five;
PVector incentre;
color red, yellow, blue;
int depth;
boolean showPerpendicular, showApollonian, showDots;

void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  strokeWeight(2);

  PVector[] points = new PVector[3];
  points[0] = new PVector( round(0.5*width), round(0.45*height));
  points[1] = new PVector( round(0.4*width), round(0.8*height));
  points[2] = new PVector( round(0.6*width), round(0.8*height));
  p = new Draggables(points, radius);
  five = new GenCircle[5];
  depth = 6;
  showPerpendicular = true;
  showApollonian = true; 
  showDots = true;
}

void draw() {
  blue = color(0, 102, 153, 220 - 10*depth);
  red = color(250, 30, 20, 200 - 15*depth); 
  yellow = color(255, 153, 0, 220 - 10*depth);
  background(0);
  p.update();
  makeThreeCircles();
  makeFiveCircles();
  if (five[3] != null && five[4] != null) {
    if (showApollonian) {
      stroke(blue);
      for (int i = 0; i < 4; i++) {  //skip if line
        if (!five[i].isLine) {
          five[i].redraw();
        }
      }
    }
    GenCircle[] four = { 
      five[0], five[1], five[2], five[4]
    };
    if (five[3].r>1) { //five[3] is the innermost circle, its 
      if (showApollonian) {
        five[4].redraw();
      }
      makeTree(four, depth);
      four[3] = five[3];
      makeTree(four, depth);
    }
  }
  if (showDots) {
    stroke(204, 0, 0);
    fill(152, 0, 0);
    p.redraw();
    noFill();
  }
}

void keyReleased() {
  if (keyCode >= 48 && keyCode <= 57) { // '0', '1', ..., '9'
    depth = keyCode - 48;
  }
  if (key == 'a' || key == 'A') {
    showApollonian = !showApollonian;
  }
  if (key == 'd' || key == 'D') {
    showDots = !showDots;
  }
  if (key == 'p' || key == 'P') {
    showPerpendicular = !showPerpendicular;
  }
  if (key == 's' || key == 'S') {
    saveFrame("a-###.png");
  }
}

void makeTree(GenCircle[] c, int depth) {
  for (int i = 0; i < 3; i++) {
    PVector i1 = intersectCircles(c[i], c[3]);
    PVector i2 = intersectCircles(c[i], c[(i+1)%3]);
    PVector i3 = intersectCircles(c[(i+1)%3], c[3]);
    if (i1 != null && i2 != null && i3 != null) {
      GenCircle perpC = new GenCircle(i1, i2, i3);
      if (showPerpendicular) {
        stroke(yellow);
        perpC.redraw();
      }
      GenCircle newC = reflectCircle(perpC, c[(i+2)%3]);
      if (newC.r > 2 && depth >0 ) {
        if (showApollonian) {
          stroke(blue);
          if (!newC.isLine) {
            newC.redraw();
          }
        }
        GenCircle[] newFour = {
          c[i], c[(i+1)%3], c[3], newC
        };
        makeTree(newFour, depth-1);
      }
    }
  }
}

void makeThreeCircles() {
  GenCircle[] bisector = new GenCircle[2];  // angle bisector
  for (int i = 0; i < 2; i++) {
    float a1 = atan2(p.getY(i+1) - p.getY(i), p.getX(i+1) - p.getX(i));
    float a2 = atan2(p.getY((i+2)%3) - p.getY(i), p.getX((i+2)%3) - p.getX(i));
    bisector[i] = new GenCircle(p.getPoint(i), p.getPoint(i), 
    new PVector(p.getX(i)+cos((a1 + a2)/2), p.getY(i) + sin((a1 + a2)/2)));
  }
  incentre = bisector[0].intersect(bisector[1])[0];
  GenCircle[] perp = new GenCircle[2];
  for (int i = 0; i < 2; i++) {
    perp[i] = new GenCircle(incentre, incentre, new PVector(incentre.x+(p.getY(i+1)-p.getY(i)), incentre.y-(p.getX(i+1)-p.getX(i))));
  }
  GenCircle segment = new GenCircle(p.getPoint(0), p.getPoint(0), p.getPoint(1));
  PVector p1 = perp[0].intersect(segment)[0];
  segment = new GenCircle(p.getPoint(1), p.getPoint(1), p.getPoint(2));
  PVector p2 = perp[1].intersect(segment)[0];
  five[0] = new GenCircle(p.getPoint(0), dist(p.getPoint(0).x, p.getPoint(0).y, p1.x, p1.y));
  five[1] = new GenCircle(p.getPoint(1), dist(p.getPoint(1).x, p.getPoint(1).y, p1.x, p1.y));
  five[2] = new GenCircle(p.getPoint(2), dist(p.getPoint(2).x, p.getPoint(2).y, p2.x, p2.y));
}

void makeFiveCircles() {
  PVector[] intersect = new PVector[3];
  GenCircle[] segment = new GenCircle[3];
  for (int i = 0; i < 3; i++) {
    float a = atan2(p.getY((i+1)%3) - p.getY(i), p.getX((i+1)%3) - p.getX(i));
    intersect[i] = intersectCircles(five[(i+1)%3], five[i]);
    segment[i] = new GenCircle(five[i].m, five[i].m, five[(i+1)%3].m);
  }
  PVector[][] bluePoint = new PVector[3][2];
  for (int i = 0; i < 3; i++) {
    GenCircle perp = new GenCircle(p.getPoint(i), p.getPoint(i), 
    new PVector(p.getPoint(i).x+(p.getY((i+1)%3)-p.getY((i+2)%3)), p.getPoint(i).y-(p.getX((i+1)%3)-p.getX((i+2)%3))));
    bluePoint[i] = perp.intersect(five[i]);
  }
  PVector[][] redPoint = new PVector[3][2];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j <2; j++) {
      GenCircle line = new GenCircle(bluePoint[i][j], bluePoint[i][j], intersect[(i+1)%3]);
      PVector[] temp = line.intersect(five[i]);
      if (temp != null) {
        redPoint[i][j] = dist(temp[0].x, temp[0].y, bluePoint[i][j].x, bluePoint[i][j].y) < 0.001 ? temp[1] : temp[0];
      } 
      else {
        five[3] = null;
        five[4] = null;
        return;
      }
    }
  }
  for (int i = 0; i < 3; i++) {
    if (dist(redPoint[i][0].x, redPoint[i][0].y, incentre.x, incentre.y) > dist(redPoint[i][1].x, redPoint[i][1].y, incentre.x, incentre.y)) {
      PVector temp = redPoint[i][0];
      redPoint[i][0] = redPoint[i][1];
      redPoint[i][1] = temp;
    }
  }
  five[3] = new GenCircle(redPoint[0][0], redPoint[1][0], redPoint[2][0]);
  five[4] = new GenCircle(redPoint[0][1], redPoint[1][1], redPoint[2][1]);
}

// assuming the circles are tangent
PVector intersectCircles(GenCircle c1, GenCircle c2) {
  if (c1 != null && c2 != null) {
    if (c1.isLine || c2.isLine) {
      GenCircle line = c1.isLine ? c1 : c2;
      GenCircle circ = c1.isLine ? c2 : c1;
      GenCircle temp = new GenCircle( circ.m, circ.r*2);
      PVector[] tint = temp.intersect(line);
      if (tint != null) {
        return new PVector((tint[0].x+tint[1].x)/2, (tint[0].y+tint[1].y)/2);
      }
    } 
    else {
      float a = atan2(c2.m.y - c1.m.y, c2.m.x - c1.m.x);
      float d = dist(c2.m.x, c2.m.y, c1.m.x, c1.m.y);
      if (d > 0) {
        if (d < c2.r) { //c1 inside c2
          if (c1.r < c2.r) {
            return new PVector(c2.m.x + c2.r*(c1.m.x-c2.m.x)/d, c2.m.y + c2.r*(c1.m.y-c2.m.y)/d);
          } 
          else {
            return new PVector(c2.m.x - c2.r*(c1.m.x-c2.m.x)/d, c2.m.y - c2.r*(c1.m.y-c2.m.y)/d);
          }
        } 
        else if (d < c1.r) { //c2 inside c1
          if (c2.r < c1.r) {
            return new PVector(c1.m.x + c1.r*(c2.m.x-c1.m.x)/d, c1.m.y + c1.r*(c2.m.y-c1.m.y)/d);
          } 
          else {
            return new PVector(c1.m.x - c1.r*(c2.m.x-c1.m.x)/d, c1.m.y - c1.r*(c2.m.y-c1.m.y)/d);
          }
        }
        else {
          return new PVector(c1.m.x + c1.r*(c2.m.x-c1.m.x)/d, c1.m.y + c1.r*(c2.m.y-c1.m.y)/d);
        }
      }
    }
  }
  return null;
}

// reflect c in r
GenCircle reflectCircle(GenCircle r, GenCircle c) {
  if (c.isLine) {
    PVector r1 = r.reflect(c.p1);
    PVector r2 = r.reflect(c.p2);
    return new GenCircle(r1, r1, r2);
  } 
  else {
    PVector p1 = new PVector(c.m.x + c.r, c.m.y);
    PVector p2 = new PVector(c.m.x, c.m.y + c.r);
    PVector p3 = new PVector(c.m.x, c.m.y - c.r);
    return new GenCircle(r.reflect(p1), r.reflect(p2), r.reflect(p3));
  }
}


void mouseReleased() {
  p.release();
}

/**************************************************************************/
/* Class to draw a set of draggable points. When dragging a point, no     */
/* other point should be dragged. When  point 1 is dragged onto point 2,  */ 
/* point 2 should be partly hidden. Next time the mouse hits the area of  */
/* collision, point 1 should be dragged.                                   */
/**************************************************************************/

class Draggables {
  
  PVector[] point;
  //A stack of indeces. The index of a dragged point is moved to the last position in stack.
  //Draw points in stack-order, update move in reverse stack-order
  int[] stack; 
  int draggedPoint = -1;
  float radius;
  boolean[] locked;
  
  Draggables(PVector[] p, float radius){
    point = p;
    stack = new int[p.length];
    locked = new boolean[p.length];
    for (int i=0; i<p.length; i++) {
      stack[i] = i;
      locked[i] = false;
    }
    this.radius = radius;
  }
  
  float getX(int i) {
    return point[i].x;
  }
  
  float getY(int i) {
    return point[i].y;
  }
  
  PVector getPoint(int i) {
    return point[i];
  }
  
  void setX(float x, int i) {
    point[i].x =x;
  }
  
  void setY(float y, int i) {
    point[i].y =y;
  }
  
  void lock(int i) {
    locked[i] = true;
  }
  
  void unLock(int i) {
    locked[i] = false;
  }
  
  int size() {
    return point.length;
  }
  
  void update() {
    float mx = mouseX;
    float my = mouseY;
    if (mousePressed) {
      for (int k=(stack.length-1); k>-1; k--) {
        int i = stack[k];
        if (!locked[i]) {
          if (draggedPoint == -1) {
            if (dist(point[i].x, point[i].y, mx, my)<=radius) {
              draggedPoint = i;
              moveToLast(k);  
            }
          } else if (mx >0 && my>0 && mx<width && my<(height)) {
              point[draggedPoint].x = mx;
              point[draggedPoint].y = my;
          }
        }
      }
    } 
  }
  
  void redraw() {
    for (int i=0; i<point.length; i++) {
      ellipse(point[stack[i]].x, point[stack[i]].y , radius, radius);
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
// Generalized circle defined by midpoint & radius, or by three points. 
// May also represent a line.
class GenCircle {
  PVector m;
  float r;
  boolean isLine;
  PVector p1, p2; //defining points if line

  // circle defined by midpoint & radius
  GenCircle(PVector mid, float radius) {
    this.m = mid;
    this.r = radius;
    this.isLine = false;
    this.p1 = null;
    this.p2 = null;
  }

  // circle defined by three points, also used for line defined by 
  // two points since processingjs 
  // cannot handle another constructor with two arguments
  GenCircle(PVector p1, PVector p2, PVector p3) {
    if (Math.abs(p1.x*(p2.y-p3.y)+p2.x*(p3.y-p1.y)+p3.x*(p1.y-p2.y)) <= 0.0001) { //almost collinear points
      this.isLine = true;
      if (p1.x == p2.x && p1.y == p2.y) {
        this.p1 = p1;
        this.p2 = p3;
        this.m = null;
        this.r = -1;
      } 
      else {
        this.p1 = p1;
        this.p2 = p2;
        this.m = null;
        this.r = -1;
      }
    } 
    else {
      this.isLine = false;
      if (p2.x==p1.x) {
        PVector temp = p2;
        p2 = p3;
        p3 = temp;
      } 
      else if (p2.x==p3.x) {
        PVector temp = p2;
        p2 = p1;
        p1 = temp;
      }
      float ma = (p2.y-p1.y)/(p2.x-p1.x);
      float mb = (p3.y-p2.y)/(p3.x-p2.x);
      float mx = (ma*mb*(p1.y-p3.y)+mb*(p1.x+p2.x)-ma*(p2.x+p3.x))/(2*(mb-ma));
      float my;
      if (abs(mb) < abs(ma) ) { // avoid division with almost zero
        my = -1/ma*(mx-(p1.x+p2.x)/2)+(p1.y+p2.y)/2;
      } 
      else {
        my = -1/mb*(mx-(p2.x+p3.x)/2)+(p2.y+p3.y)/2;
      }
      float rad = dist(mx, my, p2.x, p2.y);
      if (rad < 10000) {
        this.r = dist(mx, my, p2.x, p2.y);
        this.m = new PVector(mx, my);
      } 
      else {
        this.isLine = true;
        this.m = null;
        this.r = -1;
      }

      this.p1 = p1;
      this.p2 = p2;
    }
  }

  // returns list of two points or null
  PVector[] intersect(GenCircle c) {
    PVector[] arr = new PVector[2];
    // intersection between lines
    if (this.isLine && c.isLine) {
      float num = (c.p2.y - c.p1.y)*(this.p1.x-c.p1.x) - (c.p2.x-c.p1.x)*(this.p1.y-c.p1.y);
      float den = (c.p2.x - c.p1.x)*(this.p2.y-this.p1.y) - (c.p2.y-c.p1.y)*(this.p2.x-this.p1.x);
      if (den != 0) {
        PVector pv = new PVector(this.p1.x+(this.p2.x-this.p1.x)*num/den, this.p1.y+(this.p2.y-this.p1.y)*num/den);
        arr[0] = pv;
        arr[1] = pv;
      } 
      else {
        return null;
      }
    } 
    // intersection between circle and line
    else if ( (this.isLine && !c.isLine) || (!this.isLine && c.isLine)) {
      GenCircle circ = this.isLine ? c : this;
      GenCircle lin = this.isLine ? this : c;
      //translate to origin
      float x1 = lin.p1.x - circ.m.x;
      float y1 = lin.p1.y - circ.m.y;
      float x2 = lin.p2.x - circ.m.x;
      float y2 = lin.p2.y - circ.m.y;
      float dx = x2 - x1;
      float dy = y2 - y1;
      float dr = dist(x1, y1, x2, y2);
      float determinant = x1*y2 - x2*y1;
      float discriminant = circ.r*circ.r*dr*dr-determinant*determinant;
      float ax, ay, bx, by;
      if (discriminant < 0) {
        return null;
      }
      if (dy > 0) {
        ax = (determinant * dy + dx * (float) Math.sqrt(discriminant))/(dr*dr);
        bx = (determinant * dy - dx * (float) Math.sqrt(discriminant))/(dr*dr);
      } 
      else {
        ax = (determinant * dy - dx * (float) Math.sqrt(discriminant))/(dr*dr);
        bx = (determinant * dy + dx * (float) Math.sqrt(discriminant))/(dr*dr);
      }
      ay = (-determinant*dx + (float) Math.abs(dy)*(float) Math.sqrt(discriminant))/(dr*dr);
      by = (-determinant*dx - (float) Math.abs(dy)*(float) Math.sqrt(discriminant))/(dr*dr);
      arr[0] = new PVector(ax + circ.m.x, ay + circ.m.y);
      arr[1] = new PVector(bx + circ.m.x, by + circ.m.y);
    } 
    // intersection between circles
    else {
      float d = dist(this.m.x, this.m.y, c.m.x, c.m.y);
      if (d==0  || d > (this.r+c.r)) {
        return null;
      } 
      float a = (this.r*this.r-c.r*c.r+d*d)/2/d;
      float h = (float) Math.sqrt(this.r*this.r-a*a);
      float px = this.m.x+a*(c.m.x-this.m.x)/d;
      float py = this.m.y+a*(c.m.y-this.m.y)/d;
      float p3x = px+h*(c.m.y-this.m.y)/d;
      float p3y = py-h*(c.m.x-this.m.x)/d;
      float p4x = px-h*(c.m.y-this.m.y)/d;
      float p4y = py+h*(c.m.x-this.m.x)/d;
      arr[0] = new PVector( p3x, p3y);
      arr[1] = new PVector( p4x, p4y);
    }
    return arr;
  }

  // tangent line through P, where P is on the circle
  GenCircle tangent(PVector p) {
    if (this.isLine) {
      return this;
    } 
    else { //third argument needed due to processingjs
      return new GenCircle(p, new PVector(p.x-(p.y-this.m.y), p.y-(this.m.x-p.x)), p);
    }
  }

  //the inverted point when reflecting P in the circle
  PVector reflect(PVector p) {
    float a, b;
    if (isLine) {
      float d = dist(this.p1.x, this.p1.y, this.p2.x, this.p2.y);
      float nx = (this.p2.x-this.p1.x)/d;
      float ny = (this.p2.y-this.p1.y)/d;
      float c = (p.x-this.p1.x)*nx + (p.y-this.p1.y)*ny;
      a = -p.x + 2*this.p1.x + 2*nx*c;
      b = -p.y + 2*this.p1.y + 2*ny*c;
    } 
    else {
      if ( dist(p.x, p.y, this.m.x, this.m.y) < 0.00001) {
        return null;
      }
      a = this.m.x+this.r*this.r*(p.x-this.m.x)/((p.x-this.m.x)*(p.x-this.m.x)+(p.y-this.m.y)*(p.y-this.m.y));
      b = this.m.y+this.r*this.r*(p.y-this.m.y)/((p.x-this.m.x)*(p.x-this.m.x)+(p.y-this.m.y)*(p.y-this.m.y));
    }
    return new PVector(a, b);
  }

  void redraw() {
    if (isLine) {
      float d = dist(p1.x, p1.y, p2.x, p2.y);
      if (d != 0) {
        float dx = (p2.x-p1.x)/d;
        float dy = (p2.y-p1.y)/d;
        line(p1.x - 2000*dx, p1.y-2000*dy, p1.x + 2000*dx, p1.y + 2000*dy);
      }
    } 
    else {
      ellipse(m.x, m.y, r, r);
    }
  }
}



