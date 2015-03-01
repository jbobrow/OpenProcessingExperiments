
ArrayList<Snow> snows = new ArrayList<Snow>();

void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(255);
  
  snows.add(new Snow());
  snows.add(new Snow());

  for (int i = 0; i < snows.size (); i++) {
    Snow s = snows.get(i);
    
    /* Formular for landscape */
    float boundary = 200-abs(sin(radians(s.loc.x)))*cos(radians(s.loc.x/2))*100;
    s.display(boundary);
  }
}
class Snow {
  PVector loc, acc, vel, gravity;
  float r, mass;
  float alpha = 200;

  Snow() {
    r = random(2, 20);

    loc = new PVector(random(-200, width+200), -r);
    vel = new PVector();
    acc = new PVector();

    mass = 50/r;
  }

  void applyForce(PVector force) {
    acc.add(PVector.div(force, mass));
  }

  void display(float boundary) {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    if (loc.y > height-boundary) {
      vel.y *= 0.9;
      vel.x = 0;
      fill(255, 150, 150, alpha);
      alpha--;
      if (alpha > 0) {
        ellipse(loc.x, loc.y, r, r);
      } else {
        snows.remove(this);
      }
    } else {
      gravity = new PVector(map(mouseX, 0, width, -0.03, 0.03), map(mouseY, 0, height, 0.01, 0.1));
      fill(255, 150, 150);
      ellipse(loc.x, loc.y, r, r);
      applyForce(gravity);
    }
  }
}



