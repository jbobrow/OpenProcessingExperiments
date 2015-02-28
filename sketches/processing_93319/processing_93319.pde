
ParticleSystem ps;


void setup() {
  size(900,720);
  smooth();
  ps = new ParticleSystem(new PVector(width/4 , 80));
  ps2 = new ParticleSystem(new PVector(width/4*3 , 80));
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
  
  ps2.addParticle();
  ps2.run();
}

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particleColor;
  int durchmesser;

  Particle(PVector l) {
    
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    particleColor=color(random(0,255),random(0,255),random(0,255));
    durchmesser=random(5,15);
    
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    acceleration = new PVector(0,random(0.1,1)*0.03);
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1;
  }

  // Method to display
  void display() {
    stroke(particleColor,lifespan);
    fill(particleColor,lifespan);
    ellipse(location.x,location.y,durchmesser,durchmesser);
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

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

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

  void run() {
    
    
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}


