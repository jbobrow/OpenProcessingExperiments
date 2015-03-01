
/**********************************************/
/* Animated, and zoomable Pappus chain/train  */
/**********************************************/

float unitR;
PVector origin;
float h;  //height of letters
GenCircle unit;
color white, red;
float nr;
boolean runAnimation = true;

void setup() {
  size(600, 600);
  smooth();
  ellipseMode(RADIUS);
  stroke(255);
  strokeWeight(3);
  noFill();
  frameRate(30);
  h = 60;
  unitR = 150; 
  origin = new PVector(width/2, height/2); 
  unit = new GenCircle(origin, unitR);
  white = color(200);
  red = color(202, 0, 0);
  nr = 0;
}

void draw() {
  if (mousePressed) {
    runAnimation = !runAnimation;
  }
  if (keyPressed) {
    if (key == 'i' || key == 'I') {
      if (unitR < 5000) {
        unitR *= 1.01;
        unit = new GenCircle(origin, unitR);
        h *= 1.01;
      }
    }
    if (key == 'o' || key == 'O') {
      if (unitR > 0.1) {
        unitR *= 0.99;
        unit = new GenCircle(origin, unitR);
        h *= 0.99;
      }
    }
  }
  background(255);
  noStroke();
  fill(30);
  unit.redraw();
  noFill();
  float mid = -600*tan(nr-1.5) + width/2; // tangent to make it fast when it's far away
  PVector start = new PVector(mid - 5.05*h, height/2 + unitR+h);
  drawLetter(letterP(start, h));
  start.x = start.x + h/2;
  drawLetter(letterA1(start, h));
  drawLetter(letterA2(start, h));
  start.x = start.x + h +h/5;
  drawLetter(letterP(start, h));
  start.x = start.x + h/2 +h/6;
  drawLetter(letterP(start, h));
  start.x = start.x + h/2 +h/6;
  drawLetter(letterU(start, h));
  start.x = start.x + 2*h/3 +h/6;
  drawLetter(letterS(start, h));
  start.x = start.x + 1.5*h;
  drawLetter(letterT1(start, h));
  drawLetter(letterT2(start, h));
  start.x = start.x + h +h/5;
  drawLetter(letterR(start, h));
  start.x = start.x + h/3 +h/6;
  drawLetter(letterA1(start, h));
  drawLetter(letterA2(start, h));
  start.x = start.x + h + h/5;
  drawLetter(letterI(start, h));
  start.x = start.x + h/ 4;
  drawLetter(letterN(start, h));
 
  mid = 300*tan(nr-1.57) + width/2; 
  stroke(60);
  fill(128, 0, 0);
  for (int i = 1; i < 16; i+=2) {
    if (i == 1) {
      drawTrainShape(makeEngine(new PVector(mid+7*h + h/2 - i*h, height/2 - unitR-h/6-h/2), h));
    } else {
      drawTrainShape(makeWagon(new PVector(mid+7*h + h/2 - i*h, height/2 - unitR-h/6-h/2), h));
    }
  }
  stroke(60);
  fill(90);
  for (int i = 0; i < 16; i++) {
    PVector p1, p2, p3;
    GenCircle wheel;
    if (i == 1) { // wheel on enginge is larger
      p1 = new PVector(mid+7*h + h/2 - i*h - h*0.4+h*0.2, height/2 - unitR - h*0.4);
      p2 = new PVector(mid+7*h + h/2 - i*h + h*0.4+h*0.2, height/2 - unitR - h*0.4);
      p3 = new PVector(mid+7*h + h/2 - i*h+h*0.2, height/2 - unitR);
    } else {
      p1 = new PVector(mid+7*h + h/2 - i*h - h/6, height/2 - unitR - h/6);
      p2 = new PVector(mid+7*h + h/2 - i*h + h/6, height/2 - unitR - h/6);
      p3 = new PVector(mid+7*h + h/2 - i*h, height/2 - unitR);
    }
    wheel = new GenCircle(p1, p2, p3);
    wheel.redraw();
    GenCircle inverted = new GenCircle (unit.reflect(p1), unit.reflect(p2), unit.reflect(p3));
    inverted.redraw();
  }
  if (runAnimation) {
    nr = (nr + 0.015)%PI;
  }
}



/***********************************************/
/*  The train                                  */
/***********************************************/

void drawTrainShape(ArrayList<PVector> shape) {
  beginShape();
  for (int i = 0; i < shape.size ()-1; i++) {
    PVector point = shape.get(i);
    curveVertex(point.x, point.y);
  }
  endShape(CLOSE);
  beginShape();
  for (int i = 0; i < shape.size ()-1; i++) {
    PVector point = shape.get(i);
    PVector inverted = unit.reflect(point);
    curveVertex(inverted.x, inverted.y);
  }
  endShape(CLOSE);
}

ArrayList makeEngine(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x, s.y + h/2));
  p.add(new PVector(s.x-h/(2*sqrt(2)), s.y + h/(2*sqrt(2))));
  p.add(new PVector(s.x-h/2, s.y));
  p.add(new PVector(s.x-h/2, s.y-h*0.45));
  p.add(new PVector(s.x-h/(2*sqrt(2)), s.y - h/(2*sqrt(2))-h*0.45));
  p.add(new PVector(s.x, s.y-h/2 - h*0.5));
  p.add(new PVector(s.x+h/(2*sqrt(2)), s.y-h/(2*sqrt(2)) - h*0.45));
  p.add(new PVector(s.x+h*0.4, s.y-h*0.4));
  p.add(new PVector(s.x+h*0.75, s.y-h/(2*sqrt(2))));
  //p.add(new PVector(s.x+h*0.75, s.y-h/(2*sqrt(2))));

  p.add(new PVector(s.x+h*0.9, s.y-h/2));
  p.add(new PVector(s.x+h*0.9, s.y-h*0.7));

  p.add(new PVector(s.x+h*1.1, s.y-h*0.7));
  p.add(new PVector(s.x+h*1.1, s.y-h*0.45));

  p.add(new PVector(s.x+h+h/(2*sqrt(2)), s.y - h/(2*sqrt(2))));
  p.add(new PVector(s.x+h*1.5, s.y));
  p.add(new PVector(s.x+h+h/(2*sqrt(2)), s.y + h/(2*sqrt(2))));
  p.add(new PVector(s.x+h, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  return p;
}

ArrayList makeWagon(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x, s.y + h/2));
  p.add(new PVector(s.x-h/(2*sqrt(2)), s.y + h/(2*sqrt(2))));
  p.add(new PVector(s.x-h/2, s.y));
  p.add(new PVector(s.x-h/(2*sqrt(2)), s.y - h/(2*sqrt(2))));
  p.add(new PVector(s.x, s.y-h/2));
  p.add(new PVector(s.x+h/2, s.y-h/2));
  p.add(new PVector(s.x+h, s.y-h/2));
  p.add(new PVector(s.x+h+h/(2*sqrt(2)), s.y - h/(2*sqrt(2))));
  p.add(new PVector(s.x+h*1.5, s.y));
  p.add(new PVector(s.x+h+h/(2*sqrt(2)), s.y + h/(2*sqrt(2))));
  p.add(new PVector(s.x+h, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  p.add(new PVector(s.x+h/2, s.y+h/2));
  return p;
}


/***********************************************/
/*  Letters                                    */
/***********************************************/

void drawLetter(ArrayList<PVector> letter) {
  stroke(white);
  beginShape();
  for (int i = 0; i < letter.size ()-1; i++) {
    PVector point = letter.get(i);
    curveVertex(point.x, point.y);
  }
  endShape();
  stroke(255);
  beginShape();
  for (int i = 0; i < letter.size ()-1; i++) {
    PVector point = letter.get(i);
    PVector inverted = unit.reflect(point);
    curveVertex(inverted.x, inverted.y);
  }
  endShape();
}

ArrayList letterP(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(s);
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x, s.y - i*h/10));
  }
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x + sin(i*PI/10)*h/3, s.y - 2*h/3 - cos(i*PI/10)*h/3));
  }
  p.add(new PVector(s.x, s.y - h/3));
  p.add(new PVector(s.x, s.y - h/3));
  return p;
}

ArrayList letterA1(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(s);
  p.add(s);
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x + i*h/20, s.y - i*h/10));
  }
  p.add(new PVector(s.x + h/2, s.y - h));
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x + h/2 + i*h/20, s.y - h + i*h/10));
  }
  return p;
}

ArrayList letterA2(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x + h/6, s.y -h/3));
  for (int i = 0; i<9; i++) {
    p.add(new PVector(s.x + h/6 + i*h/10, s.y - h/3));
  }
  return p;
}

ArrayList letterU(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x, s.y - h));
  for (int i = 0; i<9; i++) {
    p.add(new PVector(s.x, s.y - h + i*h/15));
  }
  for (int i = 1; i<10; i++) {
    p.add(new PVector(s.x + h/3 + cos(PI-i*PI/10)*h/3, s.y - h/3 + sin(PI-i*PI/10)*h/3));
  }
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x + 2*h/3, s.y - h/3 - i*h/15));
  }
  return p;
}  

ArrayList letterS(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x, s.y));
  for (int i = 0; i<9; i++) {
    p.add(new PVector(s.x + i*h/30, s.y));
  }
  for (int i = 1; i<10; i++) {
    p.add(new PVector(s.x + h/3 + cos(-PI/2+i*PI/10)*h/4, s.y - h/4 - sin(-PI/2+i*PI/10)*h/4));
  }
  for (int i = 1; i<10; i++) {
    p.add(new PVector(s.x + h/3 + cos(-PI/2-i*PI/10)*h/4, s.y - 3*h/4 - sin(-PI/2-i*PI/10)*h/4));
  }
  for (int i = 0; i<7; i++) {
    p.add(new PVector(s.x + h/2+ i*h/30, s.y - h));
  }
  return p;
}  

ArrayList letterT1(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x, s.y - h));
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x + i*h/10, s.y - h));
  }
  return p;
}

ArrayList letterT2(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(new PVector(s.x + h/2, s.y - h));
  for (int i = 1; i<13; i++) {
    p.add(new PVector(s.x + h/2, s.y - h + i*h/10));
  }
  return p;
}

ArrayList letterR(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(s);
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x, s.y - i*h/10));
  }
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x + cos(PI/2-i*PI/10)*h/3, s.y - 2*h/3 - sin(PI/2-i*PI/10)*h/3));
  }
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x + i*h/30, s.y - h/3 + i*h/30));
  }
  return p;
}  

ArrayList letterI(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(s);
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x, s.y - i*h/10));
  }
  return p;
}

ArrayList letterN(PVector s, float h) {
  ArrayList<PVector> p = new ArrayList<PVector>();
  p.add(s);
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x, s.y - i*h/10));
  }
  for (int i = 0; i<10; i++) {
    p.add(new PVector(s.x + i*h/10, s.y - h + i*h/10));
  }
  for (int i = 0; i<13; i++) {
    p.add(new PVector(s.x + h, s.y - i*h/10));
  }
  return p;
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


