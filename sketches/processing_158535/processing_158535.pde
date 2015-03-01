
ParticleSystem ps;

void setup() {
  size(400,400);
  ps = new ParticleSystem(new PVector(width/2,40));
  //background(255);
}

void draw() {
  background(0);
  
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0,0.09);
  
  ps.applyForce(gravity);
  ps.addParticle();
  ps.run();
}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass = 3; // Let's do something better here!

  Particle(PVector l) {
    acceleration = new PVector(0,0.2);
    velocity = new PVector(random(-4,2),random(-3,3));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255,10,10,lifespan);
    //rect(location.x,location.y,30,30);
    triangle(location.x,location.y, 200,200,200,300);
    fill(200,5,70,lifespan);
    triangle(location.x,location.y, 250,200,250,300);
    fill(190,20,10,lifespan);
    triangle(location.x,location.y, 150,200,150,300);
    
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


