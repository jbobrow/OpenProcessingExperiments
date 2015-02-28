
Path [] a = new Path[4];

void setup() {
  size (300, 300);
  smooth();
  background(255);
  for (int i=0; i<a.length; i++) {
    a[i] = new Path(int(random(100, 200)), int(random(100, 200)));
  }
}

void draw() {
  for (int i =0; i<a.length; i++) {
    a[i].display();
    a[i].fillcolor();
    a[i].changeThickness();
  }
  if (mousePressed) {
    background(255);
  }
}

class Path {
  int oldx, oldy;

  Path(int ioldx, int ioldy) {
    oldx = ioldx;
    oldy = ioldy;
  }

  void display() {
    int dx = int(random(-5, 5));
    int dy = int(random(-5, 5));
    line (oldx, oldy, oldx+dx, oldy+dy);
    oldx=oldx+dx;
    oldy=oldy+dy;
    oldx = constrain(oldx, 0, width);
    oldy = constrain(oldy, 0, height);
  }  

  void fillcolor() {
    stroke(int(random(255)), int(random(255)), int(random(255)));
  }  

  void changeThickness() {
    strokeWeight(int(random(2)));
  }
}

