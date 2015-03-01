

ParticleSystem ps;
int numPart = 1000;
PVector gravedad = new PVector(0,9.8);
float dt = 0.3;
int contador=0;

void setup() 
{
  size(800,500);
  ps = new ParticleSystem(new PVector(width/2,70));
}

void draw() 
{
  background(50);
  if (contador < numPart) {
    ps.addParticle();
     
    contador++;
  }
    fill(255,50,50);
    text("frame rate: " + frameRate, 15, 15);
    text("Particulas restantes: " + (numPart-contador), 15, 30);
    
  ps.run();
}
void keyPressed()
{
  if (key==' ')
  {
    contador=0;
    
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masa = 5;
  float lifespan;

  Particle(PVector loc) 
  {
    acceleration = new PVector(0,0);
    //Inicializamos la velocidad con un valor aleatorio
    velocity = new PVector(random(-10,10),random(-15,15));
    
    location = loc.get();
    lifespan = 200;
  }
  
  // F = m * a
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force.get(), masa);
    acceleration.add(f);
  } 

  void run() 
  {
    update();
    display();
  }

  // Method to update location
  void update() 
  {
    applyForce(gravedad);
    lifespan -= 1.0;
    
    //EULER (SEMI)
    velocity.sub(PVector.mult(acceleration, dt));
    location.sub(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
  }

  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,15,15);
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
  PVector position;

  ParticleSystem(PVector pos) 
  {
    position = pos.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() 
  {
    particles.add(new Particle(position));
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


