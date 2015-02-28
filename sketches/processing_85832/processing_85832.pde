
static final int NEW_DROPS_PER_FRAME = 10;
static final int WAV_DROP_NO = 2;

ParticleSystem ps;
PImage frame;

void setup()
{
  frame = loadImage("newcity.jpg");
  frame.filter(GRAY);
  
  ps = new ParticleSystem();
  
  size(600, 375);
}

void draw()
{
  image(frame, 0, 0);
  ps.run(frame);
  for (int i=0; i<NEW_DROPS_PER_FRAME; i++)
    ps.addParticle(random(0, width), 0);
}
// A simple Particle class

class Particle {
  static final int MAX_BOUNCES = 4;
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float len;
  boolean mustDie;
  float partColor;
  float partAlpha;
  int bounces;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05);
    vel = new PVector(random(-0.5,0.5),random(0,0));
    loc = l.get();
    r = 10.0;
    len = random(3, 7);
    mustDie = false;
    partAlpha = random(140, 240);
    partColor = random(100, 200);
    bounces = 0;
  }

  void run(PImage frame) {
    update(frame);
    render();
  }

  // Method to update location
  void update(PImage frame)
  {
    //Double threshold filter. Could be optimized using a b/w mask precalculated
    float nextX = loc.x + vel.x;
    float nextY = loc.y + vel.y;
    float curr = brightness(frame.get((int) nextX, (int) nextY));
    if (curr < 40.0 && nextY < height - 2)
    {
      bounces++;
      len /= random(1, 1.6);
      partAlpha /= 1.15;
      partColor *= 1.15;
      vel.mult(random(-0.3, -0.9));
      vel.x += random(-1, 1);
      vel.y += random(-1, 1);
    }
    
    //Update physics
    vel.add(acc);
    loc.add(vel);
  }

  // Method to display
  void render()
  {
    PVector dir = vel.get();
    dir.normalize();
    dir.mult(len);
    
    stroke(partColor, partAlpha);
    smooth();
    line(loc.x, loc.y, loc.x-dir.x, loc.y-dir.y);
  }
  
  // Is the particle still useful?
  boolean dead()
  {
    if (mustDie
        || bounces > MAX_BOUNCES
        || loc.y > height
        || loc.x < 0
        || loc.x > width)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles

  ParticleSystem() {
    particles = new ArrayList();
  }

  void run(PImage frame) {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run(frame);
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }
  
  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
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


