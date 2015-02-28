
GenCircle unit;
float unitRadius;
PVector origin;
PVector point1, point2;
float angle;
int maxDepth;
color col1, col2;

void setup() {
  size(600, 600);
  smooth();
  ellipseMode(RADIUS);
  stroke(255);
  strokeWeight(2);
  unitRadius = min(width/2, height/2)-20; 
  origin = new PVector(min(width/2, height/2), min(width/2, height/2)); 
  unit = new GenCircle(origin, unitRadius);
  angle = 0;
  maxDepth = 7;
  col1 = color(154, 0, 0);
  col2 = color(30);
}

void draw() {
  if (angle <0.07) {
    fill(col1);
    rect(0, 0, width, height/2);
    drawCircles(PI, 3*PI/2, false, maxDepth-1);
    drawCircles(3*PI/2, TWO_PI, false, maxDepth-1);
  } else if (angle < PI ) {
    fill(col2);
    rect(0, height/2, width, height);
    drawCircles(0, angle, true, maxDepth);
    drawCircles(angle, PI, true, maxDepth);
  } else if (angle<PI + 0.07) {
    fill(col1);
    rect(0, height/2, width, height);
    drawCircles(0, PI/2, false, maxDepth-1);
    drawCircles(PI/2, PI, false, maxDepth-1);
  }
  else {
    fill(col2);
    rect(0, 0, width, height/2);
    drawCircles(PI, angle, true, maxDepth);
    drawCircles(angle, TWO_PI, true, maxDepth);
  }
  angle = (angle + 0.03)%TWO_PI;
  fill(255);  //cover outside with white
  beginShape();
  curveVertex(origin.x+unitRadius, 0);
  curveVertex(origin.x+unitRadius, origin.y);
  for (int i = 0; i<100; i++) {
    curveVertex(origin.x+unitRadius*cos(i*PI/100), origin.y+unitRadius*sin(i*PI/100));
  }
  curveVertex(origin.x-unitRadius, 0);
  curveVertex(0, 0);
  curveVertex(0, height);
  curveVertex(width, height);
  curveVertex(width, 0);
  curveVertex(origin.x+unitRadius, 0);
  endShape();
  beginShape();
  curveVertex(origin.x-unitRadius, height);
  curveVertex(origin.x-unitRadius, origin.y);
  for (int i = 0; i<100; i++) {
    curveVertex(origin.x+unitRadius*cos(PI+i*PI/100), origin.y+unitRadius*sin(PI+i*PI/100));
  }
  curveVertex(origin.x+unitRadius, height);
  curveVertex(width, height);
  curveVertex(width, 0);
  curveVertex(0, 0);
  curveVertex(0, height);
  curveVertex(origin.x-unitRadius, height);
  endShape();
}

void drawCircles(float a1, float a2, boolean red, int depth) {
  if (depth > 0 ) {
    PVector p1 = new PVector(origin.x + unitRadius*cos(a1), origin.y + unitRadius*sin(a1));
    PVector p2 = new PVector(origin.x + unitRadius*cos(a2), origin.y + unitRadius*sin(a2));
    GenCircle tangent1 = unit.tangent(p1);
    GenCircle tangent2 = unit.tangent(p2);
    PVector[] mid = tangent1.intersect(tangent2);
    if (mid != null) {
      float radius = dist(mid[0].x, mid[0].y, p1.x, p1.y);
      if ( red ) {
        fill(col1);
      } 
      else {
        fill(col2);
      }
      ellipse(mid[0].x, mid[0].y, radius, radius);
    }
    drawCircles(a1, a1+(a2-a1)/2, !red, depth-1);
    drawCircles(a1+(a2-a1)/2, a2, !red, depth-1);
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
    if (Math.abs(p1.x*(p2.y-p3.y)+p2.x*(p3.y-p1.y)+p3.x*(p1.y-p2.y)) <=0.0001) { //collinear points
      this.isLine = true;
      if (p1.x == p2.x && p1.y == p2.y) {
        this.p1 = p1;
        this.p2 = p3;
        this.m = null;
        this.r = -1;
      } else {
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
      if (mb==0) {
        my = -1/ma*(mx-(p1.x+p2.x)/2)+(p1.y+p2.y)/2;
      } 
      else {
        my = -1/mb*(mx-(p2.x+p3.x)/2)+(p2.y+p3.y)/2;
      }
      this.r = (float) Math.sqrt((mx-p1.x)*(mx-p1.x)+(my-p1.y)*(my-p1.y));
      this.m = new PVector(mx, my);
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
        println("no intersection between lines through ("+this.p1.x+", "+this.p1.y+"), ("
          +this.p2.x+", "+c.p2.y+") and ("+c.p1.x+", "+c.p1.y+"), ("
          +c.p2.x+", "+c.p2.y+")");
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
      if (determinant < 0) {
        println("no intersection between line through ("+lin.p1.x+", "+lin.p1.y+"), ("
          +lin.p2.x+", "+lin.p2.y+") and circle ("+circ.m.x+", "+circ.m.y+"), "+circ.m);
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
        println("no intersection between circles ("+this.m.x+", "+this.m.y+"), "
          +this.r+" and ("+c.m.y+", "+c.m.y+"), "+c.r);
        return null;
      } 
      double a = (this.r*this.r-c.r*c.r+d*d)/2/d;
      double h = Math.sqrt(this.r*this.r-a*a);
      double px = this.m.x+a*(c.m.x-this.m.x)/d;
      double py = this.m.y+a*(c.m.y-this.m.y)/d;
      double p3x = px+h*(c.m.y-this.m.y)/d;
      double p3y = py-h*(c.m.x-this.m.x)/d;
      double p4x = px-h*(c.m.y-this.m.y)/d;
      double p4y = py+h*(c.m.x-this.m.x)/d;
      arr[0] = new PVector((float) p3x, (float) p3y);
      arr[1] = new PVector((float) p4x, (float) p4y);
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
      float ny = (this.p2.y-this.p2.y)/d;
      a = -p.x + 2*this.p1.x + 2*nx*(this.p2.x-this.p1.x)*nx;
      b = -p.y + 2*this.p1.y + 2*ny*(this.p2.y-this.p1.y)*ny;
    } 
    else {
      if ( dist(p.x, p.y, this.m.x, this.m.y) < 0.00001) {
        println("Reflection to infinity.");
        return null;
      }
      a = this.m.x+this.r*this.r*(p.x-this.m.x)/((p.x-this.m.x)*(p.x-this.m.x)+(p.y-this.m.y)*(p.y-this.m.y));
      b = this.m.y+this.r*this.r*(p.y-this.m.y)/((p.x-this.m.x)*(p.x-this.m.x)+(p.y-this.m.y)*(p.y-this.m.y));
    }
    return new PVector(a, b);
  }

  void redraw() {
    if (isLine) {
      line(p1.x, p1.y, p2.x, p2.y);
    } 
    else {
      ellipse(m.x, m.y, r, r);
    }
  }
} 


