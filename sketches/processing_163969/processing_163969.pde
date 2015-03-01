
ArrayList sparks = new ArrayList();
PVector gravity = new PVector(0, 0.3);

void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < sparks.size (); i++) {
    Spark s = (Spark) sparks.get(i);
    s.draw(); 
    s.applyForce(gravity);
    s.boundaries();
    if (s.num <= 0) {
      sparks.remove(s);
    }
  }
  for (int i = 0; i < (int)map(mouseX, 0, width, 0, 50); i++) {
    sparks.add(new Spark());
  }
}

class Spark {
  PVector loc;
  PVector vel;
  PVector acc;
  float d;
  /* Life span */
  float num = random(100, 1000);
  Spark() {
    loc = new PVector(width+12, height-200);
    vel = new PVector(random(-10, -3), random(-15, -3));
    acc = new PVector(0, 0);
    d = (1000-num)/100;
  }

  void draw() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    ellipse(loc.x, loc.y, d, d);
    fill(255, random(0, 150), 0, map(num, 100, 1000, 255, 0));
    num-=15;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, 1);
    acc.add(f);
  }

  void boundaries() {
    /* Imaginary table */
    if (loc.y > height-200 && loc.x > width/2)vel.y*=-1;
  }
}



