
//Code combined and slightly modified from, the "forces" and "autonomous agents" chapters from Daniel Shiffman's book "The Nature of Code"

import java.util.Iterator;

//PVector target = new PVector(mouseX,mouseY);
ArrayList<Particle> particles;
 
void setup() {
  size(640,360);
  particles = new ArrayList<Particle>();
}
 
void draw() {
  background(255);
 
  particles.add(new Particle(new PVector(width/2,50)));
 
  Iterator<Particle> it = particles.iterator();
//Using an Iterator object instead of counting with int i
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
       it.remove();
    }
  }
}
 

//Particle class from Daniel Shiffman's "forces" chapter in his book "The Nature of Code"

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float maxforce;
  float maxspeed;

  Particle(PVector l) {
    //For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
    maxspeed = 4;
    maxforce = 0.1;
  }

  //Newton’s second law; we could divide by mass if we wanted.
  void applyForce(PVector force) {
    acceleration.add(force);
  }

 //Our seek steering force algorithm
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
 
  void display() {
    stroke(0, lifespan);
    fill(0, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }

  //Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



