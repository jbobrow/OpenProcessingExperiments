
// Jürg Dietrich
// 25.03.2013

ParticleSystem psi, psp;
PImage img;
 
void setup() {
  size(640,360);

  psi = new ParticleSystem( new PVector(100, height/2),0);
  psp = new ParticleSystem( new PVector(width-100, height/2),1);
  
  img = loadImage("israel.png"); 
}
 
void draw() {
  background(255);
  

  psi.run();
  psi.addParticle();
  
  psp.run();
  psp.addParticle();
  tint(255, 126);
  image(img, mouseX-65, mouseY-80); 
}

 
class ParticleSystem {
  ArrayList particles;
  // This particular ParticleSystem implementation
  // includes an origin point where each Particle begins.
  PVector origin; //[bold]
  int type;

  ParticleSystem(PVector location, int type) {
    origin = location.get();
    particles = new ArrayList();
    this.type = type;
  }
 
  void addParticle() {
    // The origin is passed to each Particle when it is added.
    while(particles.size() < 100) {
      
       particles.add(new Particle(origin, type)); //[bold]
    }
  }
  
  void run() {
    
      for (int i = 0; i < particles.size(); i++) {
        Particle p = (Particle)particles.get(i);
        p.run();
      
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
 }  // class particleSystem
 
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int type;

  Particle(PVector l, int type) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-6,6),random(-6,6));
    location = l.get();
    lifespan = 255.0;
    this.type = type;
  }
  
  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
   
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
    
    
    float strength=-0.1; // Windstaerke  
    applyWind(new PVector(mouseX, mouseY), strength);
   
    float coefficient=0.03;
    applyFriction(coefficient);


  }

  void display() {
    if (type == 0) {
      stroke(0,0,155,lifespan);
      fill(0,0,155,lifespan);
    
      line(location.x-14,location.y+8,location.x+14,location.y+8);
      line(location.x-14,location.y+8,location.x,location.y-14);
      line(location.x,location.y-14,location.x+14,location.y+8);
      
      line(location.x-14,location.y-8,location.x+14,location.y-8);
      line(location.x-14,location.y-8,location.x,location.y+14);
      line(location.x,location.y+14,location.x+14,location.y-8);
 
    }
    else if (type == 1) {
      stroke(155,0,0,lifespan);
      fill(155,0,0,lifespan);
     
      ellipse(location.x,location.y,28,28);
      stroke(255);
      fill(255);
      ellipse(location.x+5,location.y,20,28);
    }
  }

  
  void applyWind(PVector targetPos, float strength) {
    PVector difference = PVector.sub( location , targetPos); // Vektor von Particle zu Maus
    float distance = PVector.dist(location , targetPos);     // Entfernung zwischen Particle und Maus
    
    PVector force = PVector.mult(difference, strength/distance); // Kraft in Richtung des Differenzvektors
     
    acceleration=force; 
  }
  
  void applyFriction(float coefficient) {
    velocity.mult(1-coefficient); // Geschwindigkeit wird abgebremst
  }




  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



