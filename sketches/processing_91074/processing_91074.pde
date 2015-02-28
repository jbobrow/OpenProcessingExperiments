
ParticleSystem ps;

void setup() {
  smooth();
  size(600,400);
  background(255);
  ps = new ParticleSystem(mouseX,mouseY);
}

void draw() {
  
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
  noStroke();
  fill(255,5);
  rect(0,0,width,height);
}
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 0.1;

  Particle(PVector l) {
    location = new PVector(random(width), random(height));
    lifespan = 255.0;
    acceleration = new PVector(0, 5);
    velocity = new PVector();
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.x = 20*(noise(mouseX/10 + location.y/100)-0.5);
    velocity.y = 20*(noise(mouseY/10 + location.x/100)-0.5);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    lifespan -= 0.5;

    if (location.x<0)location.x+=width;
    if (location.x>width)location.x-=width;
    if (location.y<0)location.y+=height;
    if (location.y>height)location.y-=height;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    stroke(random(255), random(255), random(255), lifespan);
    line(location.x, location.y, location.x-velocity.x, location.y-velocity.y);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
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



