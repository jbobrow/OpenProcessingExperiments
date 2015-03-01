

ParticleSystem ps;
PVector gravedad = new PVector(0,9.8);

float dt = 0.2;
int i = 0;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,height));
}

void draw() {
  background(0);
  
  ps.addParticle();
  ps.run();
}


//Clase particula

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  
  float mass = 25;
  float lifespan;
  float ang;
  int n;
  //int i =0;

  Particle(PVector l) {
    acc = new PVector(0,0.25);
    
    n = i % 7;//numero de chorros de la fuente
    ang = (60+10*n) * PI/180;//angul de lanzamiento de la particula
    vel = new PVector(cos(ang), sin(ang));
    vel.mult(8);
    
    i++;//contador del numero de chorros
    
    loc = l.get();
    lifespan = 255.0;
  }


  void run() {
    update();
    display();
  }
  
  // F = M * A
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), mass);
    acc.add(f);
  } 

  // Method to update location
  void update() {
    lifespan -= 1.0;
    applyForce(gravedad);
    
    vel.sub(PVector.mult(acc, dt));
    loc.sub(PVector.mult(vel, dt));
    
    acc.set(0,0);
  }

  // Method to display
  void display() {
    noStroke();
    fill(255,lifespan);
    
    ellipse(loc.x,loc.y,5,5);
  }
  
  // Método que compueba si el tiempo de vida de la partícula ha terminado
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

//Clase Sistema de particulas (Array de particulas)

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


