
ParticleSystem ps;
Repeller repeller;

void setup() {
  size(400,400);
  ps = new ParticleSystem(new PVector(width/2,190));
  repeller = new Repeller(width/2-20,height/2);
}

void draw() {
  background(0);
  ps.addParticle();
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  ps.applyRepeller(repeller);
  repeller.display();
  ps.run();
}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass = 1;
  
  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-1,0));
    location = l.get();
    lifespan = 225.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f =force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void display() {
    stroke(255,lifespan);
    strokeWeight(1);
    //fill(200,lifespan);
    line(location.x,location.y,200,200);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    }else{
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
  
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  
  
  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p =particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

  
  
class Repeller {
  float G = 100;
  PVector location;
  float r = 10;
  
  Repeller(float x, float y) {
    location = new PVector(x,y);
  }
  
  void display() {
    stroke(random(255));
    strokeWeight(10);
    noFill();
    triangle(150,150,250,150,200,250);
    
  }
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,5,100);
    float force = -1*G/(d*d);
    dir.mult(force);
    return dir;
  }
}


