
class Particle {
  PVector loc;
  PVector vel;
  float acc;
  float accMult;
  float r;
  float timer;

  // Another constructor (the one we are using here)
  Particle(PVector l) {
    accMult = 0;
    acc = random(-1, 1);
    vel = new PVector(random(-1, 0), random(-1, 0), 0);
    loc = l.get();
    r = random(0.1,2);
    timer = 30.0;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(0, acc*accMult, 0);
    loc.add(vel);
    timer -= 0.5;
    accMult += .23;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255, loc.x/2,255-loc.y/2, timer);
    fill(loc.x/2,loc.y/2,100, timer);
    ellipse(loc.x, loc.y, r, r);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      if (this.loc.x < 0 || loc.x > 640)
        return true;
      if (this.loc.y < 0 || loc.y > 640)
        return true;
      return false;
    }
  }
}


