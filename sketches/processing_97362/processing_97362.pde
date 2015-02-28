
/**
 * Simple Particle System
 * by Daniel Shiffman.  
 * 
 * Particles are generated each cycle through draw(),
 * fall with gravity and fade out over time
 * A ParticleSystem object manages a variable size (ArrayList) 
 * list of particles. 
 */

ParticleSystem ps;

PImage img1;
PFont font;
float offset = 0;
float easing = 0.005;
float x, y;
String s = "sailing on";
String s1 = "confetti rocket";

void setup() {
  size(640, 360);
  smooth();
  ps = new ParticleSystem(new PVector(width/2, 50));
  img1 = loadImage("_06.jpg");
  font = loadFont("AdobeSongStd-Light-24.vlw");
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();

  fill(0, random(120, 150));
  textFont(font, 20);
  x += random(-1, 1);
  y += random(-1, 1);
  text(s, width/4+x, height/2+y, 150, 80);
  text(s1, width*.6+x, height/2+y, 150, 80);

  pushMatrix();
  float dx =(255-img1.width/2) -offset;
  offset += dx*easing;
  tint(255, 150);
  image(img1, 0, offset);
  popMatrix();
}


// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(5,-20));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 5.0;
  }

  // Method to display
  void display() {
    float R = random(255);
    float G = random(255);
    float B = random(255);
    
    noStroke();
    fill(R,G,B,lifespan);
    ellipse(location.x,location.y,lifespan/15,18);
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

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}


