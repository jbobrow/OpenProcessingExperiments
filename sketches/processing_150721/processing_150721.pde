
// A simple Particle class
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float masa=5.0;
  float ang;
 
  int n;
  
  
  Particle(PVector l) {
    acceleration = new PVector(0,0);
    //ejemplo de las trasparencias.
    n= i%7;
    ang= (60+10*n) *PI/180;
    
    velocity = new PVector(cos(ang),sin(ang));
    velocity.mult(20);
    i++;
    
    location = l.get();
    lifespan = 255.0;
  }


void applyForce(PVector f) {
    PVector fuerza = f.get();
    fuerza.div(masa);
    acceleration.add(fuerza);
  }  

  void run() {
    update();
    display();
  }
  
  // Method to update location
  void update() {
    applyForce(gravity);
    velocity.sub(PVector.mult(acceleration,dt*0.5));
    location.sub(PVector.mult(velocity, dt));
    lifespan -= 1.0;
    acceleration.set(0,0);
  }


  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(random(0,255),random(0,255),random(0,255),lifespan);
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
//main
/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Simula una fuente de 1000 particulas en un punto con una veloidad inicial aleatoria con un 
angulo que va cambiando.
Asignatura: simulación. (Parte matematica)
Centro: Universidad de valencia Ingeniería multimedia

************************/

ParticleSystem ps;

PVector gravity = new PVector(0,9.8);
float dt = 0.2;
 int i = 0; //globak porque si no solo salen en una direccion
 
void setup() {
  size(460,500);
  ps = new ParticleSystem(new PVector(width/2,height));
}

void draw() {
  background(0);
  
  ps.addParticle();
  ps.run();
}

// An ArrayList is used to manage the list of Particles

class ParticleSystem {

  ArrayList<Particle> particulas;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(PVector origen) {
    origin=origen.get();
    particulas = new ArrayList<Particle>();
    
    }
    
  void addParticle() {
    particulas.add(new Particle(origin));
  }

  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particulas.size()-1; i >= 0; i--) {
      Particle p = particulas.get(i);
      p.run();
      if (p.isDead()) {
        particulas.remove(i);
      }
    }
  }
}



