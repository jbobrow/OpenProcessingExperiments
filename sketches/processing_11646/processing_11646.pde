
// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  color bgcolor;

  // One constructor
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 100.0;
    initColor();
  }
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    //acc = new PVector(0,0.05,0);
    //vel = new PVector(random(-1,1),random(-2,0),0);
    acc = new PVector();
    vel = new PVector();
    loc = l.get();
    r = 10.0;
    timer = 100.0;
    initColor();
  }
  void  initColor() {
    bgcolor = color(random(100,200),random(100,200),random(100,200));
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

  // Method to display
  void render() {
    fill(bgcolor, timer/100);
    stroke(100, timer/100);
    rect(loc.x, loc.y, gridcell, gridcell);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

