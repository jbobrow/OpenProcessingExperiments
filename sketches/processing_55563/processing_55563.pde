
PFont f;
float r, g, b;
float r2, g2, b2;

long lastTime = 0;
int posx;
int posy;
int counter;

ArrayList psystems;

void setup() {
  size(640, 360);
  colorMode(RGB, 255, 255, 255, 100);
  psystems = new ArrayList();
  smooth();
    f = loadFont("AdobeHeitiStd-Regular-48.vlw");

textFont(f, 48);
size (800,600);
posx = 0;
posy = 0;

 lastTime = millis();
}

void draw() {
    background(r2,g2,b2);

        fill(r*2,g*2,b*2);
    text("Happy Birthday!", posx , posy);

  // Cycle through all particle systems, run them and delete old ones
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem psys = (ParticleSystem) psystems.get(i);
    psys.run();
    if (psys.dead()) {
      psystems.remove(i);
    }
  }
  
  
 while (millis ()-lastTime>=400) {
    r = random(0,255);
  g = random(0,255);
  b = random(0,255);
      r2 = random(0,255);
  g2 = random(0,255);
  b2 = random(0,255);
    lastTime = millis();
  
 }
  posx = ++posx % width;
    posy = ++posy % height;
}

// When the mouse is pressed, add a new particle system
void mousePressed() {
  psystems.add(new ParticleSystem(int(random(5,25)),new PVector(mouseX,mouseY)));
}



// A subclass of Particle

class CrazyParticle extends Particle {

  // Just adding one new variable to a CrazyParticle
  // It inherits all other fields from "Particle", and we don't have to retype them!
  float theta;

  // The CrazyParticle constructor can call the parent class (super class) constructor
  CrazyParticle(PVector l) {
    // "super" means do everything from the constructor in Particle
    super(l);
    // One more line of code to deal with the new variable, theta
    theta = 0.0;

  }

  // Notice we don't have the method run() here; it is inherited from Particle

  // This update() method overrides the parent class update() method
  void update() {
    super.update();
    // Increment rotation based on horizontal velocity
    float theta_vel = (vel.x * vel.mag()) / 10.0f;
    theta += theta_vel;
  }

  // Override timer
  void timer() {
    timer -= 0.5;
  }
  
  // Method to display
  void render() {
    // Render the ellipse just like in a regular particle
    super.render();

    // Then add a rotating line
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    stroke(r,g,b,timer);
    line(r,g,b,0);
    popMatrix();
  }
}




// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  // One constructor
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 100.0;
  }
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
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
    timer -= 1.0;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255,timer);
    fill(r,g,b,timer);
    ellipse(loc.x,loc.y,r,r);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      // We have a 50% chance of adding each kind of particle
      if (random(1) < 0.5) {
        particles.add(new CrazyParticle(origin)); 
      } else {
        particles.add(new Particle(origin)); 
      }
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



