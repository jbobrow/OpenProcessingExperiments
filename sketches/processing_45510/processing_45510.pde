
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.10,0);
    vel = new PVector(random(-1,1),random(-6,0),0);
    loc = l.get();
    r = 20.0;
    timer = 100.0;
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
    noStroke();
    fill(random(100,255),50,random(50,100),(timer+100));
    ellipse(loc.x,loc.y,r,r);
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

