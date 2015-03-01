
ArrayList<Boids> poop = new ArrayList();
void setup() {
  size(800, 500);
  for (int i=0; i<1000; i++) {
    Boids B = new Boids();
    poop.add(B);
  }
}
void keyPressed() {
  show = !show;
}
boolean show = false;
void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  for (int i=0; i<poop.size (); i++) {
    Boids B = (Boids) poop.get(i);
    B.display();
    B.update();
  }
}

class Boids {
  PVector loc;
  PVector vel;
  PVector acl;
  float ang, t;
  int w= 2, h=10;
  color c;
  Boids() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-2, 2), random(-2, 2));
    acl = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    t=random(1, 5);
    c = (color)random(#000000);
  }

  void display() {
    PVector dir = vel;
    dir.normalize();

    pushMatrix();
    if (show)fill(#FF002F);
    else fill(-1);
    noStroke();
    translate(loc.x, loc.y);
    rotate(ang);
    //    if (show)
    triangle(0, -w, -w/2, w, w/2, w);
    //t else ellipse(0, 0, 2, 2);
    popMatrix();
  }

  void update() {
    acl = new PVector(random(-0.005, 0.005), random(-0.005, 0.005));
    vel.add(acl);
    if (loc.x < 0 || loc.x > width || loc.y > height || loc.y<0) vel.mult(-1);
    ang+=vel.y/vel.x;

    loc.x+=t*sin(ang);
    loc.y+=-t*cos(ang);
    if (loc.x <0 || loc.x>width)loc.x+=-width;
    if (loc.y <0 || loc.y>width)loc.y+=-height;
  }
}

