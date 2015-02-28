
//Trevor Reed - period 4 engineering - 4.9.13
ParticleSystem ps;
int strobe=0;

void setup ()
{
  noStroke ();
size  (1000,900);
ps= new ParticleSystem(new PVector (width/2,50));
}

void draw ()
{
background (0);
 ps.addParticle();
  ps.run();
}
class Particle
{
    PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
   Particle(PVector l)
   {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan=255.0;
   }
   void run ()
{
  update ();
  display ();
}
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }
    void display() {
    fill(0,random(0,255),random(0,255));
    rect(location.x,location.y,4,4);
    fill(random(0,255),0,0);
    rect(location.x+100,location.y,4,4);
    fill(random(0,255),0,0);
    rect(location.x-100,location.y,4,4);
    fill(0,random(0,255),0);
    rect(location.x-200,location.y,4,4);
    fill(0,random(0,255),0);
    rect(location.x+200,location.y,4,4);
    fill(0,0,random(0,255));
    rect(location.x-300,location.y,4,4);
    fill(0,0,random(0,255));
    rect(location.x+300,location.y,4,4);
    fill(random(0,255),0,random(0,255));
     rect(location.x+400,location.y,4,4);
     fill(random(0,255),0,random(0,255));
      rect(location.x-400,location.y,4,4);
      fill(random(0,255),random(0,255),0);
       rect(location.x+500,location.y,4,4);
       fill(random(0,255),random(0,255),0);
        rect(location.x-500,location.y,4,4);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
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
}


