
ParticleSystem ps;
float theta;

void setup() {
  size(600, 600);
  theta = radians(75);
  ps = new ParticleSystem(width/2, 0);
}

void draw() {
  background(0);
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  ps.addParticle();
  ps.run();

  translate(width/2, height);
  branch(200);
}

//------------------------------------------------------------

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

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.5;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    fill(255);
    noStroke();
    float a = random(10);
    ellipse(random(width), location.y, a, a);
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

//-----------------------------------------------------------------

import java.util.*;

class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
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


//---------------------------------------------------------------------

void branch(float len) {
  strokeWeight(len/18);
  stroke(random(255)-len, random(255), random(255));
  line(0, 0, 0, -len);
  noStroke();
  
  float i =255;
  fill(255, frameCount%i);
  ellipse(0, 0, 1, len);
  translate(0, -len);
  rotate(cos (10));

  if (len > 10) { 
    pushMatrix();
    rotate(-theta);
    branch(len*.75);
    popMatrix();

    pushMatrix();
    rotate(theta);
    branch(len*.755);
    popMatrix();
  }
}
