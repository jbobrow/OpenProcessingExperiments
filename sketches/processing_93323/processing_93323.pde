



void setup() {
  size(900,720);
  smooth();
  ps = new ParticleSystem(new PVector(width/2 , 150), color(228,202,66) , 1);
  ps2 = new ParticleSystem(new PVector(width/2 , height-80), color(192,192,192), -1);
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
  
  ps2.addParticle();
  ps2.run();
}

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particleColor;
  int durchmesser;

  Particle(PVector l,color c,int richtung) {
    
    velocity = new PVector(richtung*random(-1,1),richtung*random(-2,0));
    location = l.get();
    lifespan = 255.0;
    particleColor=c;
    durchmesser=random(5,15);
    r=richtung;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    if(lifespan <= 160){
      way=random(4);
      if (way<1){
      acceleration = new PVector(random(0.1,4)*0.1,random(0.1,4)*0.1);
      }
      else if (way<2){
        acceleration = new PVector(random(0.1,4)*0.1*-1,random(0.1,4)*0.1);
      }
      else if (way<3){
        acceleration = new PVector(random(0.1,4)*0.1,random(0.1,4)*0.1*-1);
      }
      else if (way<4){
        acceleration = new PVector(random(0.1,4)*0.1*-1,random(0.1,4)*0.1*-1);
      }
      velocity.add(acceleration);
      location.add(velocity);
      lifespan -= 1;
     }
    else{
    acceleration = new PVector(0,random(0.1,1)*0.03*r);
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1;
  }}

  // Method to display
  void display() {
    stroke(particleColor,lifespan);
    fill(particleColor,lifespan);
    ellipse(location.x,location.y,durchmesser,durchmesser);
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

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  color partColor;
  int partRichtung;

  ParticleSystem(PVector location, color c, int richtung) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    partColor=c;
    partRichtung=richtung;
  }

  void addParticle() {
    particles.add(new Particle(origin, partColor, partRichtung));
  }

  void run() {
    
    
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}


