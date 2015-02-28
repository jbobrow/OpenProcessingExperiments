
// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  PShape s;
  float r;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.02,0); // somewhat parabolic 
    vel = new PVector(random(-1,1),random(0.1,0.5),0);
    loc = l.get();
    s = loadShape("bottle.svg");
    r = 10.0;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
  }

  // Method to display
  void render() {
    shape(s,loc.x,loc.y,18,40);
    
    /*ellipseMode(CENTER);
    fill(255);
    ellipse(loc.x,loc.y,r,r);*/
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (loc.y > 500) {
      return true;
    } else {
      return false;
    }
  }
}


