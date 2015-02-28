
/**
 *Straight lines 12 inches long, not touching, covering the wall evenly.<br>
 *<br>
 *<em>Sol LeWitt</em>
 */



//import processing.pdf.*;

ArrayList Lines;
float linesLength = 55;
int count = 0;

void setup() {
  size(900, 600);
  Lines = new ArrayList();
  smooth();
  // beginRecord(PDF, "Sol Lewitt 2.pdf");
  background(255);
}


Point createPointb(Point a) {
  Point P = new Point(); 
  float ang = random(TWO_PI);
  float limit = ang + TWO_PI;
  while (ang < limit) {
    float x = a.x + cos(ang) * linesLength;
    float y = a.y + sin(ang) * linesLength;
    if (x > 0 && x < width && y > 0 && y < height) {
      P = new Point(x, y);
      break;
    }
    ang += 0.1;
  }
  return P;
}

boolean checkIntersections(Point a, Point b) {
  boolean intersect = false;
  for (int i = 0; i < Lines.size(); i++) { 
    Line l = (Line)Lines.get(i);
    if (doesIntersect(a, b, l.a, l.b)) {
      intersect = true;
      return intersect;
    }
  }
  return intersect;
}

boolean doesIntersect(Point a, Point b, Point c, Point d) {
  boolean over = false;
  float a1 = b.y - a.y;
  float b1 = a.x - b.x;
  float c1 = a1*a.x + b1*a.y;

  float a2 = d.y - c.y;
  float b2 = c.x - d.x;
  float c2 = a2*c.x + b2*c.y;

  float det = a1*b2 - a2*b1;
  if (det == 0) {
    // Lines are parallel
  }
  else {
    float x = (b2*c1 - b1*c2)/det;
    float y = (a1*c2 - a2*c1)/det;
    if (x > min(a.x, b.x) && x < max(a.x, b.x) &&
      x > min(c.x, d.x) && x < max(c.x, d.x) &&
      y > min(a.y, b.y) && y < max(a.y, b.y) &&
      y > min(c.y, d.y) && y < max(c.y, d.y)) {
      over = true;
    }
  }
  return over;
}

void draw() {
  Point a = new Point(); 

  float ang = random(TWO_PI);
  float limit = ang + TWO_PI;

  for (float t = ang; t < limit; t+=0.1) {
    float x = a.x + cos(ang) * linesLength;
    float y = a.y + sin(ang) * linesLength;
    if (x > 0 && x < width && y > 0 && y < height) {
      Point b = new Point(x, y);
      if (checkIntersections(a, b) == false) {
        Line l = new Line(a, b);
        Lines.add(l);
        count++;
        println("La línea número "+count+" ha sido agregada");
        l.draw();
        break;
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    String txt = ""+count+" líneas";
    PFont t = createFont("Helvetica", 8);
    textFont(t, 8);
    textAlign(CENTER);
    fill(255, 80);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height - 44 + textDescent(), textWidth(txt)+10, textAscent()+textDescent()+5);
    fill(200, 0, 0);
    text(txt, width/2, height - 40);
    // endRecord();
    exit();
  }
}

class Line {
  Point a, b;
  Line() {
    a = new Point();
    b = new Point();
  }

  Line(Point a, Point b) {
    this.a = a;
    this.b = b;
  }

  void draw() {
    stroke(0);
    strokeWeight(1);
    line(a.x, a.y, b.x, b.y);
  }
}


class Point {
  float x, y;
  Point() {
    x = random(width);
    y = random(height);
  } 

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    ellipse(x, y, 3, 3);
  }
}



