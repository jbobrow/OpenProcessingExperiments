
//Specifies what particle to add in the main class.
//Declaring variables needed to place, move, accelerate, and give runtime to particles.

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  Particle(PVector a, PVector v, PVector l, float r_) { //Acquires said physical properties.
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 300;
  }

  Particle(PVector l) { //Specifies the velocity, size, and live time for particles.
    acc = new PVector(0,0.01,0);
    vel = new PVector(random(-5,6),random(-5,6),0); //Shape of the particle.
    loc = l.get();
    r = 100; //Radius of one particle. The lower the value, the more stretched out they look.
    timer = 300; //Defines how long one particle lives before desintegrating.
  }
  void run() {
    update();
    render();
  }
  void update() { //Cleans up the sketch after timer expires. Prevents cluttering and memory overuse.
    vel.add(acc);
    loc.add(vel);
    timer -= 2.0;
  }
  void render() { //Visualizes the particle based on it's color and spawn location.
    stroke(0,timer);
    fill(RGB, 210, 210, 30);
    ellipse(loc.x,loc.y, r, 40);
  }
  boolean dead() { //Counts wether timer = 300 is at 0. Once it's true, the particle desintegrates.
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


