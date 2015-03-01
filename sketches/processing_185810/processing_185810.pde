
Body[] bodies;

void setup() {
  bodies = new Body[1000];
  for (int i = 0; i < bodies.length; ++i) {
    bodies[i] = new Body();
  }
  size(500, 500);
  smooth();
  for (int i = 0; i < 100; ++i)
    move();
}

float m = 1000.0;

class Body {
  PVector pos, vel;
  float age;
  boolean dead = false;
  Body () {
    setup();
  }
  void setup () {
    pos = new PVector(random(0, 250), 250);
    vel = new PVector(0, random(0, 5));
    dead = false;
    age = 0;
  }
  void move () {
    if (dead) return;
    PVector c = new PVector(250, 250);
    PVector r = new PVector(pos.x - c.x, pos.y - c.y);
    float d = r.magSq();
    r.normalize();
    PVector a = r.get();
    a.mult(-m / d);
    r.mult(m / (62500 - d));
    if (d < 10000)
      dead = true;
    else if (d > 62500)
      dead = true;
    a.add(r);
    vel.add(a);
    pos.add(vel);
    age += 1;
  }
  void draw () {
    //if (dead) setup();
    if (dead) return;
    fill(age);
    ellipse(pos.x, pos.y, 5, 5);
  }
}

void move () {
  for (Body b : bodies) {
    b.move();
  }
}

void draw () {
  background(0);
  move();
  for (Body b : bodies) {
    b.draw();
  }
  stroke(100);
  noFill();
  ellipse(250, 250, 350, 350);
  ellipse(250, 250, 500, 500);
  ellipse(250, 250, 200, 200);
}

