
float theta;
ParticleSystem ps;
float twistiness = random(3);
float nseed = random(10), amp = 80, smooth=.09;
PImage img, img2;

void setup() {
  size(600, 450);
  img = loadImage("bg.jpg");
  img2 = loadImage("flower.png");
  //noLoop();
  frameRate(1);
  theta = radians(20);
  //smooth();
  ps = new ParticleSystem(width/2, 0);
}

void draw() {
  image(img, 0, 0);

  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  ps.addParticle();
  ps.run();

  translate(width/4, height);
  rotate(0.05);  

  branch(150, random(100));
}

void mousePressed() {
  redraw();
}

void branch(float len, float leaves) {
  stroke(leaves, 100, leaves*noise(nseed));
  line(0, 0, 1, -len);

  translate(0, -len);
  organicLine( 0, 0, 0, len, len/12, twistiness);

  if (len > 8) {
    pushMatrix();
    rotate(-theta * random(-20));
    branch(len*.655, leaves+35);
    popMatrix();

    pushMatrix();
    rotate(theta);
    branch(len*.75, leaves+20);
    popMatrix();
  }
}

void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(ROUND);
  strokeWeight(strokeW);

  float numSections = random(10, 20);

  float cx = x2-x1; 
  float cy = y2-y1; 

  float nx1 = x1;
  float ny1 = y1;

  for (int i = 0; i <= numSections; i++) {
    float nx2 = x1 + i/numSections * cx * 0.5;
    float ny2 = y1 + i/numSections * cy+ random(-2, 2);

    line(nx1, ny1, nx2, ny2);
    nx1 = nx2+ random(-2, 1);
    ny1 = ny2;
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
    float a = random(15);
    image(img2, random(width), random(height), a, a);
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



