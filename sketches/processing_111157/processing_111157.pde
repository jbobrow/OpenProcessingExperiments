
/*
Smoke Drops
Adopted from Particle System code by Daniel Shiffman and work with Gladys Chan 
*/

//float deg = degrees(rad);

ArrayList<ParticleSystem> systems;
//ParticleSystem bangsystem;

void setup() {
  size(800, 800);
  systems = new ArrayList<ParticleSystem>(); //ArrayList controls groups of particles;
  frameRate(15);
  background(255);
  
}

void draw() {

  for (ParticleSystem bangsystem: systems) {
    bangsystem.run();
    bangsystem.addParticle();
  }
}

//mousePress controls where particles start to leak from
void mousePressed() {

  systems.add(new ParticleSystem(new PVector(width/2, height/2)));
  systems.add(new ParticleSystem(new PVector(width/2, height/2)));
  systems.add(new ParticleSystem(new PVector(width/2, height/2)));
  systems.add(new ParticleSystem(new PVector(width/2, height/2))); 


}



//CLASS DESCRIBES A GROUP OF PARTICLES

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector emitter;

  ParticleSystem(PVector location) {
    emitter = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(emitter));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {

      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i/2);
      }
    }
  }
}

//CLASS DESCRIBES ONE PARTICLE
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 500;
  int m = millis();

  Particle(PVector location_) {
    acceleration = new PVector(0, 0); //how changes shape of trajectory?
    velocity = new PVector(random(-0.2,0.2), random(-7, 0));
    location = location_.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  };

  //updates location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 5.0;
  }

  //displays particle
  void display() {
    int m = millis();
    //stroke(0,lifespan);
    noStroke();
    fill(lifespan, lifespan);
    rotate(0.003);
    ellipse(location.x, location.y, lifespan, lifespan);
    /*  for (int i = 0; i > lifespan; i++) {
     ellipse(mouseX,mouseY,lifespan++, lifespan++);
     }*/
  }

  //Newton's second law & force accumulation
  /*void applyForce (PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }*/

  // checks if particle should disappear
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}



