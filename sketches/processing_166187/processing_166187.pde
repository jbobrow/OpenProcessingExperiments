
ArrayList dots = new ArrayList();

void setup() {
  size(640, 640);
}

void draw() {
  fill(0, 10);
  rect(-1, -1, width+1, height+1);
  for (int i = 0; i < dots.size (); i++) {
    Dot d = (Dot) dots.get(i);
    d.draw();
  }
  if(dots.size() < 5000) dots.add(new Dot());
}

class Dot {
  PVector loc;
  PVector vel;

  Dot() {
    loc = new PVector(width/2+random(-100, 100), height/2+random(-100, 100));
    vel = new PVector(random(-1, 1), random(-1, 1));
  }

  void draw() {
    if (dist(loc.x, loc.y, width/2, height/2) >= 255) vel.mult(-1);
    loc.add(vel);
    stroke(0, 150, 255, 255-map(dist(loc.x, loc.y, width/2, height/2), 0, 255, 0, 230));
    point(loc.x, loc.y);
  }
}



