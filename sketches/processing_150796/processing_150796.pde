
// A simple Particle class

class Particule {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masa=2;
  float lifespan;

  Particule(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-5,5),random(-5,5)); //velocidad aleatoria de las particulas
    location = l.get();
    lifespan = 160.0;
  }
  
 // F = m * a
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), masa);
    acceleration.add(f);
  } 
  
  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    
    velocity.sub(PVector.mult(acceleration,dt*0.5));
    location.sub(PVector.mult(velocity, dt));
    lifespan -= 0.5;
    
    acceleration.set(0,0);
  }

  // Method to display
  void display() {
    noStroke();
    fill(random(0,255),random(0,255),random(0,255),lifespan);
    ellipse(location.x,location.y,8,8);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}


// An ArrayList is used to manage the list of Particles

class ParticleSystem {

  ArrayList<Particule> particulas;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(PVector origen) {
    origin=origen.get();
    particulas = new ArrayList<Particule>();
    
    }
    
  void addParticle() {
    particulas.add(new Particule(origin));
  }

  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particulas.size()-1; i >= 0; i--) {
      Particule p = particulas.get(i);
      p.run();
      if (p.isDead()) {
        particulas.remove(i);
      }
    }
  }



  
}


/*************************

Alumno: Ignacio Dolz MonzÃ³
Ejercicio: crear 1000 particulas en un punto con velocidad aleatoria aleatoria y un tiempo de vida
Asignatura: simulaciÃ³n. 
Centro: Universidad de valencia IngenierÃ­a multimedia

************************/

//main 
ParticleSystem sistem;
int numPart=1000;
float dt = 0.2;
int i = 0;
PVector gravity = new PVector(0,9.8);

void setup() {
  size(460,460);
  sistem = new ParticleSystem(new PVector(width/2,height/2));
}

void draw() {
  background(0);
  
  if (i < numPart) {
    sistem.addParticle();
     
    i++;
  }
  sistem.run();
}



