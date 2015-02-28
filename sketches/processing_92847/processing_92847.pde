
//Elli_120412_final_Drawing_with_Bubbles
/**
 * Multiple Particle Systems
 * by Daniel Shiffman.  Mods by Elli Park
 * 
 * Drag mouse to add more bubbles.
 * 
 * Ideally designed for a touch screen.
 * 
 */

color c1, c2;

//for background gradation
int Y_AXIS = 1;
int X_AXIS = 2;

int MAXNUMOFSYS = 20000;

int syscount = 0;
int mousecount = 0;

ParticleSystem[] particlesystems = new ParticleSystem[MAXNUMOFSYS]; //for bubbles that are animating themselves
ParticleMouse[] particlesmouse = new ParticleMouse[MAXNUMOFSYS]; //mouse input

void setup() {
  size(400, 400);
  smooth();
  randomSeed(100);
  colorMode(RGB, 255, 255, 255, 100);
  c1 = color(15, 103, 126);
  c2 = color(234, 251, 255);
  frameRate(100);
}

void draw() {
  animation();
  // Cycle through all particle systems, run them
  for (int i = 0; i< syscount; i++) {
    particlesystems[i].run();
    println("i="+i);
  }

  for (int j = 0; j< mousecount; j++) {
    particlesmouse[j].run();
  }


}

void animation() { 

  gradation(0, 0, 400, 400, c1, c2, Y_AXIS); 
  gradation(0, 0, 400, 400, c2, c1, X_AXIS);

  if (syscount < MAXNUMOFSYS) { //pm

    //bubbles that are animating themselves
    particlesystems[syscount] = new ParticleSystem(new PVector(50, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(100, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(150, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(200, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(250, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(300, random(height)));
    syscount++;

    particlesystems[syscount] = new ParticleSystem(new PVector(350, random(height)));
    syscount++;
  }
}


//When the mouse is dragged, add a new particle system (draw with bubbles)
void mouseDragged() {

  if (mousecount < MAXNUMOFSYS) { //pm
    particlesmouse[mousecount] = new ParticleMouse(new PVector(mouseX, mouseY));
    mousecount++;
  }
}

void gradation(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}

// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float rad;
  float timer;
  float r;
  float g;
  float b;

  Particle(PVector pv, float _r, float _g, float _b) {
    loc = pv.get();
    acc = new PVector(0, 0.05, 0);
    vel = new PVector( random(-2, 2), random(-5, 0), 0 );
    rad = random(5.0, 10.0);      //size of bubbles
    timer = 100.0;
    r= _r;
    g= _g;
    b= _b;
    
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.sub(acc);
    loc.sub(vel);
    timer -= 1.0;
    rad = rad + 0.1;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    // stroke(255, timer);
    fill(r, g, b, timer);
    noStroke();
    ellipse(loc.x, loc.y, rad, rad);
  }
}


// An Array is used to manage the list of Particles for dragged bubbles

class ParticleMouse {

  int PARTICLENUMS = 2;
  Particle[] particles = new Particle[PARTICLENUMS];    // a container for all the particles
  PVector origin;  // an origin point for where particles are birthed
  float r;
  float g;
  float b;

  ParticleMouse(PVector v) {
    origin = v.get();     // Store the origin point
    for (int i = 0; i < PARTICLENUMS; i++) {  // Load up the array with "Particles"
       particles[i] = new Particle((origin), random(5, 70), random(10, 50), random(70, 200));
    }
  }

void run() {
  // telling all the particles in this system to update & draw
  for (int i = 0; i < PARTICLENUMS; i++) {          // Load up the array
    particles[i].run();
  }
 }
}

//end class

// An Array is used to manage the list of Particles 

class ParticleSystem {

  int PARTICLENUMS = 4;
  Particle[] particles = new Particle[PARTICLENUMS];    // a container for all the particles
  PVector origin;  // an origin point for where particles are birthed
  float r;
  float g;
  float b;

  ParticleSystem(PVector v) {
    origin = v.get();     // Store the origin point
    for (int i = 0; i < PARTICLENUMS; i++) {  // Load up the array with "Particles"
       particles[i] = new Particle((origin), random(255), random(255), random(255));
    }
  }

void run() {
  // telling all the particles in this system to update & draw
  for (int i = 0; i < PARTICLENUMS; i++) {          // Load up the array
    particles[i].run();
  }
 }
}

//end class



