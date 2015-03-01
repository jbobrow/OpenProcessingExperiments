

ParticleSystem ps;
PVector gravedad = new PVector(0,9.8);
float dt = 0.3;
int i=0;


void setup() 
{
  size(800,500);
  ps = new ParticleSystem(new PVector(width/2,height-100));
}

void draw() 
{
  background(50);
  fill(255,50,50);
  text("frame rate: " + frameRate, 15, 15);
  
  ps.addParticle();  
  ps.run();
}



class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masa = 5;
  float lifespan;
  float alpha;
  int n;

  Particle(PVector loc) 
  {
    acceleration = new PVector(0,0);
    
    n = i % 7;
    
    alpha = (60+10*n) * PI/180;
    velocity = new PVector(cos(alpha), sin(alpha));
    velocity.mult(25);
    
    i++;
    
    location = loc.get();
    lifespan = 255.0;
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
    lifespan -= 2.0;
    
    //EULER (SEMI)
    velocity.sub(PVector.mult(acceleration, dt));
    location.sub(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
  }

  void display() {
    stroke(random(0,255),random(0,255),random(0,255),lifespan);
    fill(random(0,255),random(0,255),random(0,255),lifespan);
    ellipse(location.x,location.y,10,10);
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


