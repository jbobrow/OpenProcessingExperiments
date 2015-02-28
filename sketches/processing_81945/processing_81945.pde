
Point[] p = new Point[400];
float distance = 35;
float diameter = 300;

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i<p.length;i++) {
    p[i] = new Point(diameter);
  }
}

void draw() {
  background(255);
  for (int i = 0; i<p.length; i++) {
    for (int j = 0; j<p.length; j++) {
      if (i!=j) {
        float d = sqrt(pow(p[i].x()-p[j].x(), 2) + pow(p[i].y()-p[j].y(), 2));
        if (d<distance) {
          stroke(40/35, 40/35, 110, 1200/d);
          strokeWeight(0.1);
        line(p[i].x(), p[i].y(), p[j].x(), p[j].y()); 
        }
      }
    }
  }
  
  for (int i = 0; i<p.length;i++) {
      p[i].update();
      p[i].display();
  }
}


class Point {
  PVector origin;
  PVector distance;
  PVector pos;
  PVector vel;
  float vx;
  float vy;
  float diameter;
  float radius;
  float angle;
  float scalar;
  
  Point(float diameter_) {
    
    vx = random(-1.5, 1.5);
    vy = random(-1.5, 1.5);
    scalar = 2.2;
    diameter = diameter_;
    radius = map(noise(random(0, 1000)), 0, 1, -diameter/2, diameter/2);
    angle = map(noise(random(1001, 2000)), 0, 1, 0, 2*PI);
    pos = new PVector (width/2+radius*cos(angle), height/2+radius*sin(angle));
    vel = new PVector (scalar*vx, scalar*vy);
    origin = new PVector (width/2, height/2);
  }
  
  void update() {
    pos.add(vel);
  }
  
  void display() {
    distance = PVector.sub(origin, pos);
    if (distance.mag()>=diameter/2) {
      vel.x *= -1;
      vel.y *= -1;
    }
  }
  
  float x() {
    return pos.x;
  }
  
  float y() {
    return pos.y;
  }
}
