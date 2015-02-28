
// Jürg Dietrich
// 25.03.2013

ParticleSystem psi, psp;
 
void setup() {
  size(640,360);
  psi = new ParticleSystem( new PVector(100, height/2),0);
  psp = new ParticleSystem( new PVector(width-100, height/2),1);
}
 
void draw() {
  background(255);
  psi.run();
  psi.addParticle();
  
  psp.run();
  psp.addParticle();
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
    particles.add(new Particle(origin, type)); //[bold]
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
    velocity = new PVector(random(-1,1),random(-1,1));
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
    lifespan -= 2.0;
    
    if (mouseX < width/3) {
      if (type == 0) {   
        float strength=0.1; // Staerke der Abstossung
        int radius = 100;
        applyPush(new PVector(mouseX, mouseY), strength, radius);
      }
      else if (type == 1) {
        float strength=0.0002; // Staerke der Anziehung
        applyAttraction(new PVector(mouseX, mouseY), strength);
      }
    }
    else if (mouseX > 2*width/3) {
      if (type == 1) {
        float strength=0.1; // Staerke der Abstossung
        int radius = 100;
        applyPush(new PVector(mouseX, mouseY), strength, radius);
      }
      else if (type == 0) {
        float strength=0.0002; // Staerke der Anziehung
        applyAttraction(new PVector(mouseX, mouseY), strength);
      }
    }
  }

  void display() {
    if (type == 0) {
      stroke(0,0,155,lifespan);
      fill(0,0,155,lifespan);
    
      line(location.x-7,location.y+4,location.x+7,location.y+4);
      line(location.x-7,location.y+4,location.x,location.y-7);
      line(location.x,location.y-7,location.x+7,location.y+4);
      
      line(location.x-7,location.y-4,location.x+7,location.y-4);
      line(location.x-7,location.y-4,location.x,location.y+7);
      line(location.x,location.y+7,location.x+7,location.y-4);
 
    }
    else if (type == 1) {
      stroke(155,0,0,lifespan);
      fill(155,0,0,lifespan);
     
      ellipse(location.x,location.y,14,14);
      stroke(255);
      fill(255);
      ellipse(location.x+5,location.y,10,14);
    }
  }

  void applyAttraction(PVector targetPos, float strength) { 
    PVector difference = PVector.sub(targetPos, location); // Vektor von Particle zu Maus
    PVector force = PVector.mult(difference, strength);    // Kraft ist proportional zu Distanzvektor
     
    acceleration=force; 
  }
  
  void applyPush(PVector targetPos, float strength, int radius) {
    float distance = PVector.dist(location , targetPos); // Entfernung zwischen Particle und Maus
    PVector difference = PVector.sub(location , targetPos); // Vektor von Particle zu Maus
    difference.normalize(); // Vektor auf Laenge 1 normieren
  
    PVector force = new PVector(0,0);
    if (distance < radius) { // Kraft wirkt nur innerhalb Minimaldistanz
      force = PVector.mult(difference,  strength);
    } 
    acceleration=force; 
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
