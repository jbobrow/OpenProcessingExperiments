


ParticleSystem ps;
int numParticulas = 1000;
PVector gravity = new PVector(0,9.8);
float dt = 0.2;
int i = 0;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,height/2));
}

void draw() {
  background(0);
  
  if (i < numParticulas) {
    ps.addParticle();
     
    i++;
  }
  ps.run();
}


//Clase particula

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass = 20;
  float lifespan;

  Particle(PVector l) {
    acc = new PVector(0,0);
    vel = new PVector(random(-5,5),random(-5,5));//velocidad inicial aleatoria
    
    loc = l.get();
    lifespan = 255.0;
  }
  
  // F = M * A
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), mass);
    acc.add(f);
  } 

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    applyForce(gravity);
    lifespan -= 1.0;
  
    vel.sub(PVector.mult(acc, dt));
    loc.sub(PVector.mult(vel, dt));
    
    acc.set(0,0);
  }

  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(loc.x,loc.y,5,5);
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

//Clase ParticleSystem

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
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


