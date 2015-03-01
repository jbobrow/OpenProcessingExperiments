
// Ejercicio: Implementar una fuente de particulas

ParticleSystem ps;
PVector gravity = new PVector(0,9.8);
float dt = 0.2;
int i = 0;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,height-100));
}

void draw() {
  background(0);
  
  ps.addParticle();
  ps.run();
}


// Clase particula: Estructura basica de una particula simple

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 25;
  float lifespan;
  float angle;
  float mag = 10;
  
  int n;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    
    n = i % 7;
    
    angle = (60+10*n) * PI/180;
    velocity = new PVector(cos(angle), sin(angle));
    velocity.mult(mag);
    
    i++;
    
    location = l.get();
    lifespan = 255.0;
  }
  
  // F = m * a
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), mass);
    acceleration.add(f);
  } 

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    applyForce(gravity);
    lifespan -= 1.0;
    
    // Euler (semi) implicito
    velocity.sub(PVector.mult(acceleration, dt));
    location.sub(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
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

// Clase ParticleSystem que tiene un ArrayList con la lista 
// de particulas

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


