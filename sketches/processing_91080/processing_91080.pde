
ParticleSystem ps;
PImage img;
PImage bgimg;
PImage flbgimg;

void setup() {
  size(1000,500);


  bgimg = loadImage("bgbg2.jpg");
  flbgimg = loadImage("flbg.png");
    ps = new ParticleSystem(width/2, 380);
}

void draw() {
  tint(255,255);
    image(bgimg, 0,0);
//background(0);

 image(flbgimg, 350, 340);

 
   // Apply gravity force to all Particles
  PVector gravity = new PVector(random(-3,3), random(-0.1,-0.5));
  ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
  

}

class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  PImage img = loadImage("fl2.png");

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.02);
    velocity = new PVector(random(-1, 1),random(-2, 0));
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
    lifespan -= 3.0;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    //stroke(0,lifespan);
    //strokeWeight(2);
    //fill(127,lifespan);
    image(img,location.x,location.y);
    //tint(255,lifespan);
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







