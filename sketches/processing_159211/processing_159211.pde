
//Thanks to lina berzhaner for the code
ParticleSystem ps;
 
void setup() {
  size(350,900);
  ps = new ParticleSystem(new PVector(width/2,150));
}
 
void draw() {
  background(150,50);
  ps.addParticle();
  ps.run();
}
class Confetti extends Particle {
  Confetti(PVector l) {
    super(l);
  }
   
  void display() {
    rectMode(CENTER);
    fill(10,162,161,50);
    stroke(255,lifespan);
    strokeWeight(15);
    pushMatrix();
    translate(location.x,location.y);
    float theta = map(location.x,0,width,0,TWO_PI*2);
    rotate(theta);
    rect(0,0,300,300);
    popMatrix();
  }
}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
   
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }
   
  void run() {
    update();
    display();
  }
   
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 0.01;
  }
   
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(10,230,230,120);
    //ellipse(location.x,location.y,12,12);
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
    float r = random(1);
    if (r < 0.5) {
      particles.add(new Particle(origin));
    }else{
      particles.add(new Confetti(origin));
    }
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


