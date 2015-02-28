
ParticleSystem ps;
int partx = 0;
int party = 20;
int direction = 2;
int rectx;
int recty;
int rectwidth = 50;
int rectheight = 10;

void setup() {
  size(700, 400);

  rectx = width/2;
  recty = height/2;

  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(1, new PVector(width/2, height/2, 0));
  smooth();
}

void draw() {
  background(0);
  ps.run();
  ps.addParticle(partx, party);
  partx = partx + direction;

  //  if (partx > 699) {
  //    partx = partx - 2;
  //  }
  stroke(255);
  fill(150);
  rectMode(CENTER);
  rect(rectx, recty, rectwidth, rectheight);

  rectx = (rectx+1)%width;

  if (partx > width) {
    direction = -2;
  }
  if (partx < 0) {
    direction = 2;
  }
}
//bar



// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born

    ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x, y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
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

// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0, 0.05, 0);
    vel = new PVector(random(-1, 1), random(-2, 0), 0);
    loc = l.get();
    r = 10.0;
    timer = 100.0;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 0.1;

    if (loc.x > rectx - rectwidth/2 && loc.x < rectx + rectwidth/2 && loc.y > recty - rectheight/2 && loc.y < recty + rectheight/2) {
      vel.y = -vel.y;
    }
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255, timer);
    fill(100, timer);
    ellipse(loc.x, loc.y, r, r);
    //   displayVector(vel, loc.x, loc.y, 10);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

