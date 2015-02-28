
Particle p;

void setup() {
  size(640,360);
  p = new Particle(new PVector(width/2,50));
}

void draw() {
  background(255);
  // Operating the single Particle
  p.run();
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.035);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    ellipse(location.x,location.y,8,8);
  }

 
}


