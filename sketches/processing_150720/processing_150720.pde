
ParticleSystem ps;
int nPart = 10;
float dt=0.25;
PImage img;
/* @pjs preload="texture.png"; */
void setup() {
  size(800,500);
  img = loadImage("texture.png");
  ps = new ParticleSystem(nPart,new PVector(width/2,height),img);
}

void draw() {
  background(0);
   fill(255,50,50);
  text("frame rate: " + frameRate, 15, 15);
  
  ps.run();
  ps.addParticle();


}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage img;
  float tamImg = 1;

  Particle(PVector l, PImage img_) 
  {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(0,20), random(0,20));
    location = l.get();
    lifespan = 250.0;
    img = img_;
  }
  //F = m * a
  //En humo, las particulas no tienen masa
  void applyForce(PVector force)
  {
    acceleration.add(force);
  } 
  void run() 
  {
    update();
    display();
  }
  void update() 
  {
    lifespan -= 1.0;
    tamImg += 0.02;
    
    //EULER (SEMI)
    velocity.sub(PVector.mult(acceleration, dt));
    location.sub(PVector.mult(velocity, dt));
    
    acceleration.set(0,0);
  }
  void display() 
  {
    imageMode(CENTER);
    tint(255,lifespan);
    img.resize(0,50);
    image(img,location.x,location.y);  
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
// Clase ParticleSystem que tiene un ArrayList con la lista 
// de particulas con una imagen

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  PImage img;
  int numPart;
  
  ParticleSystem(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v.get();                                   // Store the origin point
    img = img_;
    numPart = num;
    addParticle(); 
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
  
  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (Particle p: particles) {
      p.applyForce(dir);
    }
  
  }  

  void addParticle() {
    particles.add(new Particle(origin, img)); 
  }

}

