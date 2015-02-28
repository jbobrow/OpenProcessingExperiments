
class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1),random(-1, 0));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -=3;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    //stroke(0,lifespan);
   // strokeWeight(2);
    tint(255,lifespan);
    //fill(127,lifespan);
    image(snow,location.x,location.y);
    smooth();
    image(box,0,400);
    //ellipse(location.x,location.y,12,12);
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


import java.util.*;

class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;
 

  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void run() {
    
   for (int i = particles.size()-1; i > 0; i--) {

      Particle p = particles.get(i);
      p.run();
      
      if (p.isDead()) {
        particles.remove(p); 
      }
    }
  }
 
}





ParticleSystem ps;
PImage snow;
PImage box;


void setup() {
  frameRate(50);
  size(450, 600);
  snow=loadImage("snow.png");
  box=loadImage("box.png");
 
ps = new ParticleSystem(15, height-150);

}

void draw() {



  background(0);





  // Apply gravity force to all Particles
  PVector gravity = new PVector(random(-3, 3)*noise(.001), random(.1, -1.002)*noise(.01));
  ps.applyForce(gravity);

  ps.addParticle();
  ps.run();
}



