
ParticleSystem ps;

void setup() {
  size(640, 360);
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  smooth();
}

void draw() {
  background(255);
  ps.run();
  if (random(0,4) < 1.0) {
    ps.addParticle(mouseX,mouseY);
  }
}

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
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


class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float rmax;
  float timer;
  float alphaval;
  float alphamin;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0.04,0.03,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 20.0;
    rmax = 20.0 + random(0,30);
    timer = 100.0 + random(0,30);
    alphaval = 60.0;
    alphamin = 50.0;
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
    alphaval -= 1.0;
    alphaval = max(alphamin, alphaval);
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(0,0,255,alphaval);
    fill(0,0,255,alphaval - 10.0);
    float r2 = min(r + 100.0 - timer, rmax);
    ellipse(loc.x,loc.y,r2,r2);
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
                
                
