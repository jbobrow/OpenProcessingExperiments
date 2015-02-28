
ArrayList<Particle> particles;

int x = 1000;
float y = 0.01;

void setup() {
  size(800,800);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(0);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle(new PVector(width/5,0)));
  particles.add(new Particle(new PVector(width/4,0)));
  particles.add(new Particle(new PVector(width/3,0)));
  particles.add(new Particle(new PVector(width/2,0)));
  particles.add(new Particle(new PVector(width/1,0)));

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
  
  fill(255);
  rect(0, x, 800, y);
  x--;
  y++;
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-10,10),random(-2,0));
    location = l.get();
    lifespan = 500.0;
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
    stroke(0,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,4);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



