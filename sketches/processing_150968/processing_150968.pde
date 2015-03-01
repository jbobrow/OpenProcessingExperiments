
//Humo

ParticleHumo ps;
PVector gravity  =new PVector(0, -0.5);

void setup() {
  size(438,360);
  PImage img = loadImage("texture.png");
  ps = new ParticleHumo(10,new PVector(width/2,height-60),img);
}

void draw() {
  background(0);

  // Calculate a "wind" force based on mouse horizontal position
  float dx = map(mouseX,0,width,-0.2,0.2);
  PVector wind = new PVector(dx,0);
  ps.applyForce(wind);
  ps.run();
  for (int i = 0; i < 2; i++) {
    ps.addParticle();
  }
}

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;

  Particle(PVector l,PImage img_) {
    acc = new PVector(0,0);
    float vx = randomGaussian()*0.5;
    float vy = randomGaussian()*0.5;
    vel = new PVector(vx,vy);
    loc = l.get();
    lifespan = 100.0;
    img = img_;
  }

  void run() {
    update();
    render();
  }
  
  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0); // clear Acceleration
  }

  // Method to display
  void render() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,loc.x,loc.y);
    // Drawing a circle instead
    // fill(255,lifespan);
    // noStroke();
    // ellipse(loc.x,loc.y,img.width,img.height);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleHumo {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  PImage img;
  
  ParticleHumo(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v.get();                                   // Store the origin point
    img = img_;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin, img));         // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      p.applyForce(gravity);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (Particle p: particles) {
      p.applyForce(dir);
    }
  
  }  

  void addParticle() {
    particles.add(new Particle(origin,img));
  }

}




