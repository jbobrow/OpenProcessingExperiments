
/*
This is: Particles flying around a vector field. Here I'm using a lot more
particles with very thin trails and a different noise scale, so it looks
much more like a fluid. Instead of looking like a tank of abstract fish,
it forms a much more cohesive flow.
It has even a sort of flame or smoke look to it, at least in my opinion,
if you add a constant upward force to it.

As long as the mouse button is held, a constant force is generated which
is proportional to your distance from the center along each axis.

I've found that I like the appearance much better with a lot of particles,
(larger than the number of horizontal pixels, even), much thinner lineweights,
and fairly long trails. The vector field is defined over continuous 2-space,
and no two particles will take the exact same path.
noiseSize=0.01, timeDelta=0.01 with a lot of particles makes for some
interesting, almost swarming effects.
The thin lineweights (<  1) only have that delicate, wispy appearance if
smooth() is used, which slows it a bit.

Out-of-bounds particles resurrect on the bottom of the screen; this is sort
of clunky, but it will be changed soon.

The vector field is derived from Perlin noise and it creates a force which
acts on the particles. Since mass and time delta are assumed constant,
change in velocity here just equals force.
*/

// Possible changes:
// - Make a class for vector fields in general. Make Perlin noise and a sort
//   of gravity well be a subset of this.
//   - And some sort of undulating wavelike thingy.
//   - Perhaps a force that always pushes it toward the mouse.
// - Collisions. Is this feasible?
// - Let user generate particles.
// - Other forces, possibly depending on velocity.

Trails tr1;
PGraphics tintLayer;
float mouseStrength;
float t=0;

void setup() {
  // ---- Parameters to tune ----
  int numParticles = 400;
  float speed = 3;       // How strong the Perlin vector field is
  int decayRate = 20;    // Trails: 0=last forever, 255=die instantly.
  float noiseSize = 0.01; // Higher value -> faster spatial change
  float timeDelta = 0.01; // Higher value -> faster temporal change
  mouseStrength = 1.0;   // How strongly the mouse pushes/pulls
  int borders = 100;     // How far off-screen a particle can go
  strokeWeight(0.5);
  // ---- Boilerplate ----
  size(400,400);
  //frameRate(60);
  smooth();
  tr1 = new Trails(numParticles, speed);
  tr1.setNoiseSize(noiseSize, noiseSize);
  tr1.setTimeDelta(timeDelta);
  tr1.setBorders(borders);
  tr1.generateBottom();
  background(0);
  stroke(255);
  colorMode(HSB, 255);
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
    if (mouseButton == LEFT) {
      float mx = ((float)mouseX / width - 0.5);
      float my = ((float)mouseY / height - 0.5);
      mouseForce = new PVector(mouseStrength*mx, mouseStrength*my);
    }
  }
  tr1.updatePositions(mouseForce);
  // Dim the old display by a certain amount (tintLayer has an
  // alpha channel that influences this)
  image(tintLayer, 0, 0);
  // Draw new lines on top of this.
  tr1.drawLines();
  tr1.resurrectOutliers();
  t += 0.05;
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
  
  Trails(Trails toCopy) {
    // Note that we don't copy the particles; it's expected that
    // you'll generate your own.
    particles = new Particle[toCopy.particles.length];
    noiseOffset = toCopy.noiseOffset;
    cx = toCopy.cx;
    cy = toCopy.cy;
    borders = toCopy.borders;
    magnitude = toCopy.magnitude;
    timeDelta = toCopy.timeDelta;
    t = toCopy.t;
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
    for(int i = 0; i < particles.length; ++i) {
      PVector old = particles[i].oldPosition;
      PVector now = particles[i].position;
      stroke(particles[i].h, 127, 255);
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
  int h;
  
  Particle(PVector pos, PVector vel) {
    // making a copy, hopefully.
    oldPosition = pos.get();
    velocity = vel;
    position = pos;
    h = floor(255*noise(t));
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

