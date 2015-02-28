
// adapted from The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Simple Particle System

// Particles are generated each cycle through draw(),
// float up and fade out over time
// A ParticleSystem object manages a variable size (ArrayList) 
// list of particles.

ArrayList<ParticleSystem> systems;

void setup() {
  size(640,460);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle(); 
  }
  
  fill(0);
  text("click mouse to add particle systems",5,height-5);
}

void mousePressed() {
  systems.add(new ParticleSystem(1,new PVector(mouseX,mouseY)));
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Confetti extends Particle {

  // We could add variables for only Confetti here if we so

  Confetti(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  void display() {
    rectMode(CENTER);
    fill(255,102,255,lifespan);
    stroke(255,0,153,lifespan);
    strokeWeight(2);
    pushMatrix();
    translate(location.x,location.y);
    float theta = map(location.x,0,width,0,TWO_PI*2);
    rotate(theta);
    rect(0,0,12,12);
    popMatrix();
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,-0.05);
    velocity = new PVector(random(-1,1),random(0,2));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.sub(acceleration);
    location.sub(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(51,51,255,lifespan);
    strokeWeight(2);
    fill(102,153,255,lifespan);
    ellipse(location.x,location.y,12,12);
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

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Confetti(origin));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    float r = random(1);
    if (r>0.6) {
    particles.add(new Confetti(origin));
    }
    if (r<0.3) {
    particles.add(new SquareParticle(origin));
    }
    else {
      particles.add(new Particle(origin));
    }
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }
}
class SquareParticle extends Particle {
  
  SquareParticle(PVector l) {
    super(l);
  }
  
  void display() {
    //fill(int(random(255)), int(random(255)), int(random(255)));
    fill(255,255,153);
    stroke(255,255,0);
    rectMode(CENTER);
    // new code
    pushMatrix();
    translate(location.x,location.y);
    float theta = map(location.x,0,width,0,TWO_PI*3);
    rotate(theta);
    rect(0,0,13,13);
    popMatrix();
    //rect(location.x, location.y, 13, 13);
  }
}


