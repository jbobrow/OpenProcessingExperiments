
float bigger = 3;
ParticleSystem ps;
 
void setup() {
  size(640,460);
  ps = new ParticleSystem( new PVector(width/2,height/2));
}
 
void draw() {
  background(0);
  ps.run();
  ps.addParticle();
  
}
 
class ParticleSystem {
  ArrayList particles;
  // This particular ParticleSystem implementation
  // includes an origin point where each Particle begins.
  PVector origin; //[bold]

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList();
  }
 
  void addParticle() {
    // The origin is passed to each Particle when it is added.
    particles.add(new Particle(origin)); //[bold]
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

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-3,3),random(-3,3));
    location = l.get();
    lifespan = 255.0;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    if(mousePressed) {
      if(mouseButton == LEFT) {
        float strength = 0.002;
        for(int i = 0; i < 100; i++){
           strength=0.001*i; // Staerke der Anziehung
        }
        applyAttraction(new PVector(mouseX, mouseY), strength);
      } 
      else 
      {    
        float strength=100.1; // Windstaerke
        for(int i = 0; i < 10; i++){
           strength=0.1*i/10; // Staerke der Anziehung
        } 
        applyWind(new PVector(mouseX, mouseY), strength);
      }
    }
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 5.0;
  }

  void display() {
    stroke(0,lifespan);
    fill(200,lifespan);
    ellipse(location.x,location.y,8+bigger,8+bigger);
    bigger += 0.515;
    if(bigger > 30){
      bigger = 3;
    }
  }

  
  void applyAttraction(PVector targetPos, float strength) { 
    PVector difference = PVector.sub(targetPos, location); // Vektor von Particle zu Maus
    PVector force = PVector.mult(difference, strength+0.1);    // Kraft ist proportional zu Distanzvektor

    acceleration=force; 
  }
  
  void applyWind(PVector targetPos, float strength) {
    PVector difference = PVector.sub( location , targetPos); // Vektor von Particle zu Maus
    float distance = PVector.dist(location , targetPos);     // Entfernung zwischen Particle und Maus
    
    PVector force = PVector.mult(difference, strength/distance); // Kraft in Richtung des Differenzvektors
     
    acceleration=force; 
  }


  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0001) {
      return true;
    } else {
      return false;
    }
  }
}
