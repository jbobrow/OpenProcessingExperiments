

/**
  * Moire - Example of Moiré patterns using colinear circumferences.
  *
  */

int qtCircles = 10;
ArrayList<Circle> clist;

class Circle {
  int cx, cy;       // center coordinates
  int greatRadius;  // radius of the largest circumference
  int deltaRadius;  // distance between two consecutive circumferences
  int qtCircles;
  int vx, vy;       // norm of speed vectors
  
  Circle(int cx, int cy, int vx, int vy, int greatRadius, int deltaRadius) {
    this.cx = cx;
    this.cy = cy;
    this.greatRadius = greatRadius;
    this.deltaRadius = deltaRadius;
    this.qtCircles = greatRadius / deltaRadius;
    this.vx = vx;
    this.vy = vy;
  }
  
  void draw() {
    noFill();
    for (int n = 1; n <= qtCircles ; n++) {
      float radius = n * deltaRadius;
      ellipse(cx, cy, radius, radius);
    }
  }
  
  void updateCoordinates() {
    if (cx < 0 || cx > width) {
      vx = -vx;
    } 
    
    if (cy < 0 || cy > height) {
      vy = -vy;
    }
    
    cx += vx;
    cy += vy;
  }
}

void setup() {
  size(600, 600);
  frameRate(30);
  
  int counter = 0;
  clist = new ArrayList<Circle>();
  while (counter < qtCircles) {
    int cx = ceil(random(width));
    int cy = ceil(random(width));
    
    int vx = ceil(random(-3, 3));
    int vy = ceil(random(-3, 3));

    Circle c = new Circle(cx, cy, vx, vy, 200, 10);
    clist.add(c);
    
    counter++;
  }
}

void draw() {
  //clear();
  background(255);
  
  for (Circle c : clist) {
    c.updateCoordinates();
    c.draw();
  }
}



