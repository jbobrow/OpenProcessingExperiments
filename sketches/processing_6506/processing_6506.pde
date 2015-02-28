
class Bouncer {
  PVector loc;
  PVector vel;
  float size = 3;
  Bouncer(PVector loc, float theta, float speed) {
    this.loc = loc;
    this.vel = new PVector(cos(theta) * speed, sin(theta) * speed);
  }

  void draw() {
    pushStyle();
    noStroke();
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
    popStyle();
  }

  void update() {
    loc.add(vel);
    
    if (loc.x < 0 && vel.x < 0 || loc.x > width && vel.x > 0) {
      vel.x *= -1;
    }
    if (loc.y < 0 && vel.y < 0 || loc.y > height && vel.y > 0) {
      vel.y *= -1;
    }
  }
}

