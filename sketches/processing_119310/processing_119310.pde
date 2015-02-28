
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
int pNumber = 200; //number of particles
PImage logo;

ParticleSystem ps;

void setup() {
  size(1920, 1080);
  background(250, 5);
  ps = new ParticleSystem(new PVector(width/2, height/2));
  for(int i=0;i<pNumber;i++){
      ps.addParticle(random(width),random(height));
  }
  frameRate(60);
  logo = loadImage("EDP_logo4.png");
}

void draw() {
  fill(250, 15);
  noStroke();
  rect(0, 0, width, height);
  ps.update();
  ps.display();
  image(logo, 0,0);
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector[] directions;
  float shade;
  PVector rev;
  int buffer = -20;
  float pSize;

  Particle(float x, float y) {
    directions = new PVector[4];
    directions[0] = new PVector(-1, 0);
    directions[1] = new PVector(1, 0);
    directions[2] = new PVector(0, -1);
    directions[3] = new PVector(0, 1); 
    acceleration = new PVector(0, 0);
    acceleration.set(directions[int(random(4))]);
    velocity = new PVector(random(-10, 10), random(-10, 10));
    location = new PVector(x, y);
    shade = random(360);
    pSize = random(1, 20);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    if(frameCount%600 == 0) {
      velocity.set(random(-10, 10), random(-10, 10));
      acceleration.set(directions[int(random(0,4))]);
    }
    if(location.x < buffer) location.x = buffer;
    if(location.x > width-buffer) location.x = width-buffer;
    if(location.y < buffer) location.y = buffer;
    if(location.y > height-buffer) location.y = height-buffer;
    //velocity.mult(0.9);
  }
 
 /*boolean dropout() {
   if (location.z < -700 || location.z > 500) return true;
   if (location.y < 0 || location.y > height) return true;
   else return false;
 }
 */
 void floorHit() {
   if (location.x <= buffer) velocity.x *= -0.8;
   if (location.x >= width - buffer) velocity.x *= -0.8;
   if (location.y <= buffer) velocity.y *= -0.8;
   if (location.y >= height - buffer) velocity.y *= -0.8;
 }

  // Method to display
  void display() {
    colorMode(HSB, 360, 100, 100);
    stroke(shade,90,75,255);
    strokeWeight(pSize);
    point(location.x, location.y);
  }

}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(x, y));
  }


  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }


  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.floorHit();
    }
  }
}




