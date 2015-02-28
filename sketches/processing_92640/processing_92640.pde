
ParticleSystem ps, ps2, ps3;


void setup() {
  size(800,400);
  ps = new ParticleSystem(width*4/6, height/3);
  ps2 = new UpwardParticleSystem(width*5/6, height/2);
  ps3 = new LeftwardParticleSystem(width*1/5, height/2);
}

void draw() {
  background(0);
  
   // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  ps.addParticle();
  ps.run();
  
  ps2.applyForce(gravity);
  ps2.addParticle();
  ps2.run();
  
  ps3.applyForce(gravity);
  ps3.addParticle();
  ps3.run();
}




class t extends Particle {

  t(PVector l) {
    super(l);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0.9);
    lifespan -= 2.5;
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(location.x , location.y );
    float rads = radians(frameCount);
    rotate(rads);
    translate(-location.x , -location.y );
    fill(250);
    rect(location.x, location.y, random(12), random(12));
    popMatrix();

  }
}



class t2 extends Particle {

  t2(PVector l) {
    super(l);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0.2);
    lifespan -= 1.5;
  }

  void display() {
    fill(random(255), random(255), random(255));
    ellipse(location.x, location.y, 8, 8);

    if (location.x > width - 8 || location.x < 8)
    {
      location.x *= -1;
    }
    if (location.y > height - 8 || location.y < 8)
    {
      location.y *= -1;
    }
  }
}

class t3 extends Particle {

  t3(PVector l) {
    super(l);
  }
  PImage img = loadImage("star.png");

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {

    pushMatrix();
    translate(location.x , location.y );
    float rads = radians(frameCount);
    rotate(rads);
    translate(-location.x , -location.y );
    fill(250, 200);
    image(img, location.x, location.y, 12, 12);
    popMatrix();
  }
}







class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
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

class UpwardParticleSystem extends ParticleSystem {

  UpwardParticleSystem(float x, float y) {
    super(x, y);
  }


  void applyForce(PVector f) {
    PVector ups =new PVector(-f.x, -f.y);
    for (Particle p: particles) {
      p.applyForce(ups);
    }
  }
}

class LeftwardParticleSystem extends ParticleSystem {

  LeftwardParticleSystem(float x, float y) {
    super(x, y);
  }


  void applyForce(PVector f) {
    PVector lps =new PVector(f.x, f.y);
    for (Particle p: particles) {
      p.applyForce(lps);
      translate(600,200);
      rotate(90);
    }
  }
}






class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
    particles.add(new t(origin));
    particles.add(new t2(origin));
    particles.add(new t3(origin));
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





