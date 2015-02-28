
//Hacked the ParticleGenerator from the processing website.

ParticleSystem ps;
//int windowWidth, windowHeight;
int windowWidth = 900;
int windowHeight = 700;

void setup() {
  size(windowWidth, windowHeight);
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  smooth();
}

void draw() {
  //float bcolor = ;
  //if (bcolor >
  //background(random(0,5)+100);
  //background(cos(random(0,255)));
  background(mouseX, mouseY*mouseX/255, mouseY);
  ps.run();
  //ps.addParticle(mouseX,mouseY);
  ps.addParticle(mouseX, mouseY);
  ps.addParticle(mouseY*random(0,12), mouseY*random(0,10));
}


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
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
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
    acc = new PVector(random(-0.5, 0.5), random(-0.5,0.5), 0);
    //acc = new PVector(0, 0.095, 0);
    vel = new PVector(0.15*random(-1,1), 0.15*random(-2,0),0);
    loc = l.get();
    //r = 50.0;
    timer = random(0,1)*50;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 0.020;
  }

  // Method to display
  void render() {
    //ellipseMode(CENTER);
    stroke(255,timer);
    //fill(100,timer);// * random(-2,2));
    fill(0.125*mouseX, 0.8*mouseY, .4*mouseX, timer);
    //ellipse(loc.x,loc.y,r,r);
    //size(120, 120);
    textSize(35);
    textAlign(CENTER);
    //text(random(0,1), loc.x, loc.y);
    displayVector(vel,loc.x,loc.y,10);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
   void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;//*random(0,1);
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    //line(0,0,len,0);
    rectMode(CENTER);
    rect(0,0,0.5*x,0.5*y);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  } 

}

