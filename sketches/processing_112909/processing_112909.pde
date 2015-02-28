
/*
Horizontal Particle Strip
 Adapted from Particle System code by Daniel Shiffman and work with Gladys Chan 
 */



ArrayList<ParticleSystem> systems;


void setup() {
  size(800, 600);
  systems = new ArrayList<ParticleSystem>(); //ArrayList controls groups of particles;
  frameRate(15);
  background(0);
}

void draw() {
  // I don't know what you filters do exactly, but you sure look cool!
  filter(18);
  filter(10);
  for (ParticleSystem bangsystem: systems) {
    bangsystem.run();
    bangsystem.addParticle();
  }

  systems.add(new ParticleSystem(new PVector(width/2, height/2)));
}

void mousePressed() {
 background(0);
 for (ParticleSystem bangsystem: systems) {
 bangsystem.run();
 bangsystem.addParticle();
 }
 
 systems.add(new ParticleSystem(new PVector(width/2,height/2)));
 }


//CLASS DESCRIBES A GROUP OF PARTICLES

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector emitter;

  ParticleSystem(PVector location) {
    emitter = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(emitter));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i/10);
      p.run();
      if (p.isDead()) {
        particles.remove(i*2);
      }
    }
  }
}

//CLASS DESCRIBES ONE PARTICLE
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;



  Particle(PVector location_) {
    //acceleration = new PVector(10, 1); //how changes shape of trajectory?
    velocity = new PVector(random(-100, width), random(-10, 10));
    location = location_.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  };

  //updates location
  void update() {
    //  velocity.add(acceleration);
    location.add(velocity);

    lifespan -= 10.0;
  }

  //displays particle
  void display() {

    strokeWeight(0.3);
    stroke(0, lifespan, lifespan/2, lifespan);
    fill(lifespan, 0, lifespan, lifespan);
    ellipse(location.x, location.y, lifespan/15, lifespan/15);
  }



  // checks if particle should disappear
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}



