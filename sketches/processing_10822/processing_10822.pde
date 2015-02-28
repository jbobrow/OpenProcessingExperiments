
/*
This is: Particles flying around a vector field. They make trails whose
decay rate can be changed. It looks sort of like a stream of really
skinny fish.
As long as the mouse button is held, a constant force is generated which
is proportional to your distance from the center along each axis.

Out-of-bounds particles resurrect on the bottom of the screen; this is sort
of clunky, but it will be changed soon.

The vector field is derived from Perlin noise and it creates a force which
acts on the particles. Since mass and time delta are assumed constant,
change in velocity here just equals force.
*/


Trails tr;
PGraphics tintLayer;
float mouseStrength;

void setup() {
  // ---- Parameters to tune ----
  int numParticles = 100;
  float speed = 2;       // How strong the Perlin vector field is
  int decayRate = 20;    // Trails: 0=last forever, 255=die instantly.
  float noiseSize = 0.1; // Higher value -> faster spatial change
  float timeDelta = 2.0; // Higher value -> faster temporal change
  mouseStrength = 1.0;   // How strongly the mouse pushes/pulls
  int borders = 100;     // How far off-screen a particle can go
  // ---- Boilerplate ----
  size(500,500);
  frameRate(60);
  //smooth();
  tr = new Trails(numParticles, speed);
  tr.setNoiseSize(noiseSize, noiseSize);
  tr.setTimeDelta(timeDelta);
  tr.generateBottom();
  tr.setBorders(borders);
  background(0);
  stroke(255);
  // The tint layer is just black with an alpha channel.
  // At each frame, it is copied to the existing particle trails,
  // which creates the decay as it gradually is forced to black.
  tintLayer = createGraphics(width, height, P2D);
  tintLayer.beginDraw();
  tintLayer.background(0,decayRate);
  tintLayer.endDraw();
}

void draw() {
  PVector mouseForce = null;
  // If mouse is pressed, exert a constant force.
  if(mousePressed) {
    //float mx = mouseStrength*((float)mouseX / width - 0.5);
    //float my = mouseStrength*((float)mouseY / height - 0.5);
    float mx = ((float)mouseX / width - 0.5);
    float my = ((float)mouseY / height - 0.5);
    mouseForce = new PVector(mouseStrength*mx, mouseStrength*my);
  }
  tr.updatePositions(mouseForce);
  // Dim the old display by a certain amount (tintLayer has an
  // alpha channel that influences this)
  image(tintLayer,0,0);
  // Draw new lines on top of this.
  tr.drawLines();
  tr.resurrectOutliers();
}

class Trails {
  Particle[] particles;
  // noiseOffset = whatever the Z coordinate passed to noise(...) is
  // to give us a sort-of distinct 2D space of noise
  float noiseOffset;
  //float delta;
  float cx, cy;
  // How far off the screen it can go before being dead
  int borders;
  // Magnitude of the noise
  float magnitude;
  // Effect of passage of time (0 = static field)
  float timeDelta;
  float t;
  
  Trails(int count, float magn) {
    particles = new Particle[count];
    noiseOffset = 5000;
    borders = 50;
    magnitude = magn;
    timeDelta = 0;
    cx = 1;
    cy = 1;
    t = 0;
  }
  
  void setNoiseSize(float cx, float cy) {
    this.cx = cx;
    this.cy = cy;
  }
  
  void setTimeDelta(float d) {
    timeDelta = d;
  }
  
  void setBorders(int b) {
    borders = b;
  }
  
  // Generate a row of particles, evenly spaced, at the bottom of the view.
  void generateBottom() {
    int count = particles.length;
    for(int i = 0; i < count; ++i) {
      PVector pos = new PVector(width*i/count, height);
      PVector vel = new PVector(0,0);
      particles[i] = new Particle(pos, vel);
    }
  }
  
  void updatePositions() {
    updatePositions(null);
  }
  
  // Pass any extra forces as an argument
  void updatePositions(PVector otherForce) {
    PVector[] forces = new PVector[2];
    forces[1] = otherForce;
    if (otherForce==null) forces[1] = new PVector(0,0);
    for(int i = 0; i < particles.length; ++i) {
      PVector pos = particles[i].position;
      // The force is derived from the Perlin noise, which we
      // generate as a 2D vector by choosing from two regions that
      // are suitably far away.
      // Since noise(...) is in [0,1] it needs some biasing.
      float fx = magnitude*(noise(cx*pos.x, cy*pos.y, t) - 0.47);
      float fy = magnitude*(noise(cx*pos.x, cy*pos.y, t + noiseOffset) - 0.48);
      forces[0] = new PVector(fx, fy);
      particles[i].perturb(forces);
    }
    t += timeDelta;
  }
  
  void drawLines() {
    //surface.beginDraw();
    //surface.background(0);
    stroke(255);
    for(int i = 0; i < particles.length; ++i) {
      PVector old = particles[i].oldPosition;
      PVector now = particles[i].position;
      line(old.x, old.y, now.x, now.y);
    }    
    //surface.endDraw();
  }
  
  void resurrectOutliers() {
    int x0 = -borders;
    int y0 = -borders;
    int x1 = width + borders;
    int y1 = height + borders;
    for(int i = 0; i < particles.length; ++i) {
      PVector pos = particles[i].position;
      if (pos.x < x0 || pos.x > x1 || pos.y < y0 || pos.y > y1) {
        PVector vel = new PVector(0,0);
        PVector newPos = new PVector(random(0,width), height);
        particles[i] = new Particle(newPos, vel);
      }
    }
  }
  
}


class Particle {
  PVector position;
  PVector velocity;
  PVector oldPosition;
  
  Particle(PVector pos, PVector vel) {
    // making a copy, hopefully.
    oldPosition = pos.get();
    velocity = vel;
    position = pos;
  }
  
  void perturb(PVector[] forces) {
    oldPosition = position.get();
    // Update the position with the velocity.
    position.add(velocity);
    // Update the velocity with the forces acting on the
    // particle (which, since we're assuming a constant
    // time delta and constant mass, just means that change
    // in velocity equals vector sum of the forces)
    for(int i = 0; i < forces.length; ++i) {
      velocity.add(forces[i]);
    }
  }
}

