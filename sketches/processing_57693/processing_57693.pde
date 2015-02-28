

// PVector ArrayList

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  color col;
  float r;
  float timer;
  
  Particle(PVector l, float mag, color col) {
  loc = l.get();
  vel = new PVector(random(-2, 1), random(-2, 1), 0);
  vel.normalize();
  vel.mult(mag);
  this.col = col;
  acc = new PVector(0, 0.05, 0);
  r = 10.0;
  timer = 0.0;
  }
  
  void run() {
    update();
    render();
  }
  
  void update() {
    vel.y += 0.1;
    // vel.add(acc);
    loc.add(vel);
    timer += 3.0;
  }
  
  void render() {
    noStroke();
    fill(red(col),green(col),blue(col), timer);
    ellipse(loc.x, loc.y, r, r);
    // displayVector(vel, loc.x, loc.y, 10);
  }
  
  // Is the particle still usefull
  boolean dead() {
    if(timer > 60.0) {
      return true;
    } else {
      return false;
    }
  }
}

