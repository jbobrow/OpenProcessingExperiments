
// Written by Claus Rytter Bruun de Neergaard, February 2013
// Written in Processing 2.0b7

int n = 15;  
Circle[] c = new Circle[n];

void setup() {
  size(905, 400, P3D);
  smooth();
  strokeWeight(1.5);

  regen();
}

void draw() {
  background(255);

  for (int i = 0; i < c.length; i++) {
    c[i].run();
  }
}

void regen() {
  for (int i = 0; i < c.length; i++) {
    int tn = int(random(5, 120));
    float ta = TWO_PI/tn;
    c[i] = new Circle(tn, random(5, 50), random(25, float(width/2)), ta, random(-0.02, 0.02), random(-0.02, 0.02));
  }
}

void keyPressed() {

  // regenerate circles
  if (key == 'r' || key == 'R') {
    regen();
  }

  // do screen dump
  if (key == ' ') {
    int y = year();
    int mo = month();
    int d = day();
    int h = hour();
    int mi = minute();
    int s = second();
    save("export/" + nf(y, 4) + nf(mo, 2) + nf(d, 2) + "-" + nf(h, 2) + nf(mi, 2) + nf(s, 2) + ".png");
  }
}

class Circle {

  // variables
  int n;
  float l, rad, a, addX, addY, rotX, rotY, w;
  PVector s, e;
  color c;

  // constructor
  Circle(int _n, float _l, float _rad, float _a, float _addX, float _addY) {
    n = _n;
    l = _l;
    rad = _rad;
    a = TWO_PI/float(n);
    rotX = 0;
    rotY = 0;
    addX = _addX;
    addY = _addY;
    c = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    w = random(0.5, 5.0);
  }

  void run() {
    stroke(c);
    strokeWeight(w);
    pushMatrix();    
    translate(width/2, height/2);    
    rotateX(rotX);
    rotateY(rotY);
    rotX = rotX + addX;
    rotY = rotY + addY;
    for (int i = 0; i < n; i++) {
      s = new PVector(rad * sin(a*i), rad * cos(a*i));
      e = new PVector((rad+l) * sin(a*i), (rad+l) * cos(a*i));
      line(s.x, s.y, e.x, e.y);
    }
    popMatrix();
  }
}



