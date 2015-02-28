
//ParticleSystem[] pss = new ParticleSystem[2];
PImage flbgimg;

ParticleSystem ps,ps2;

void setup() {
  
  size(700,700);
  ps = new ParticleSystem(width/2, height/2);
  ps2 = new ParticleSystem2(width*2/3, height/2); 
  
    flbgimg = loadImage("star.png");
    
    
//  pss[0] = new ParticleSystem(width/2, height/2);
//  pss[1] = new ParticleSystem2(width*2/3, height/2); 
}

void draw() {
  background(0);
  
   // Apply gravity force to all Particles
//  PVector gravity = new PVector(0, 0.1);

  PVector gravity = new PVector(0, 0.1);
  PVector ungravity = new PVector(0, -0.1);
  PVector wind = new PVector(sin(frameCount),0);
  
/*  for (int i = 0; i< pss.length; i++){
    pss[i].applyForce(gravity);
   // pss[i].addParticle();
    pss[i].run();
  }
  */
  
  ps.applyForce(gravity);
 // ps.applyForce(wind);
  ps2.applyForce(ungravity);
  //ps2.applyForce(wind);
  
 ps.addParticle(new Particle(ps.origin));
 ps.addParticle(new Confetti(ps.origin));

 ps2.addParticle(new Star(ps2.origin));
 
    ps.run();
    ps2.run();
}
class Confetti extends Particle {

  Confetti(PVector l) {
    super(l);
  }
  
    void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    rotation+=ro; 
    fill(random(50,200), random(50,200) ,random(50,200), lifespan);
    pushMatrix();
 
    translate(location.x, location.y);
    rotate(radians(rotation));
    rect(0, 0, 12, 12);
    // println(velocity.y);
 
    popMatrix();
    
    
   // rect(location.x,location.y,12,12);
 
 
  }
  
  
}





class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  float rotation;
  float ro;

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 2));
    rotation = random(0, 360);
    ro = random(-5, 10);
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
    lifespan -= 1.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {


    pushMatrix();
    translate(-200, 0);

    stroke(0, lifespan);
    strokeWeight(2);
    fill(random(50,100), lifespan);
    ellipse(location.x, location.y, 12, 12);

    if (location.y>height-6) {
      velocity.y=- velocity.y;
      ellipse(location.x, location.y, 12, 12);
    }

    popMatrix();
  }

  // Is the particle still useful?
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
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }

  void addParticle(Particle p) {
    particles.add(p);
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

class ParticleSystem2 extends ParticleSystem {

  ParticleSystem2(float x, float y) {
    super(x, y);
  }

  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
}

class Star extends Particle {

  Star(PVector l) {
    super(l);
  }

  void display() {
    rotation+=ro; 
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(rotation));
    image(flbgimg, 0, 0);
    popMatrix();
  }
}



