
ArrayList<Particle> particles;

void setup() {
  size(1024, 768);
  particles = new ArrayList<Particle>();
  smooth();
  frameRate(120);
}

void draw() {
  background(0);
  particles.add(new Particle(new PVector(width/2, height/2)));
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-10, 10), random(-10, 10));
    location = l.get();
    lifespan = height;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    stroke(255, 200);
    fill(255, 200);
    ellipse(location.x, location.y, 2,2);
  }

  boolean isDead() {
    if (lifespan*2<80.0) {

      return true;
    }
    else {
      return false;
    }
  }
}



