
ParticleSystem ps;
color backgroundCol;
int baseAngle;
color strokeCol, fillCol;

void setup() {
  size(640,360);
  colorMode(HSB, 360, 100, 100);
  smooth();
  setTriadComplementary();
  ps = new ParticleSystem( new PVector(width/2, height/2));
}
 
void draw() {
  background(backgroundCol);
  ps.run();
  ps.addParticle(); 
  if(keyPressed && key == 'c'){
    setTriadComplementary();
  }
}

  //------------------ Rule: triad 
void setTriadComplementary() {
  baseAngle = int(random(360));  // Grundfarbe setzen
  backgroundCol = color(baseAngle, 12, 60+random(100));
  strokeCol = color((baseAngle+120)%360, 12, 60+random(100));
  fillCol = color((baseAngle+240)%360, 12, 60+random(100));
}
  
 
class ParticleSystem {
  ArrayList particles;
  PVector origin; //[bold]

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList();
  }
 
  void addParticle() {
    particles.add(new Particle(origin)); //[bold]
  }
  
  void run() {
   int counter = 0;
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
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-1,1));
    location = l.get();
    lifespan = 255.0;
  }
 
  void run() {
    update();
    display();
  }

  void update() {
    //Kraft einbauen
    
    float strength = 0.003;
    float strength2 = 0.1;
    float coefficient = 1;
    PVector vector = new PVector(mouseX, mouseY);
    
    if(mousePressed && key == 'a'){
      applyAttraction(vector, strength);
    }
    if(mousePressed && key == 'w'){
      applyWind(vector, strength2);
    }
    if(mousePressed && key == 'f'){
      applyFriction(coefficient);
    }
    if(mousePressed && key == 'p'){
      applyPush(vector, strength2, 100);
    }
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void applyAttraction(PVector targetPos, float s){ //s = strength
    PVector d = PVector.sub( targetPos, location); //Differenzvektor
    PVector f = PVector.mult(d, s); //force
    
    acceleration = f; //Beschleunigung als Kraft setzen
  }
  
  void applyFriction(float coefficient) {
    velocity.mult(1-coefficient); // Geschwindigkeit wird abgebremst
  }
  
  void applyWind(PVector targetPos, float strength) {
    PVector difference = PVector.sub( location , targetPos); // Vektor von Particle zu Maus
    float distance = PVector.dist(location , targetPos);     // Entfernung zwischen Particle und Maus
    
    PVector force = PVector.mult(difference, strength/distance); // Kraft in Richtung des Differenzvektors
     
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

  void display() {
//    stroke(0,lifespan);
//    fill(148,lifespan);
  stroke(strokeCol, lifespan);
  fill(fillCol, lifespan);
  ellipse(location.x,location.y,8,8);
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



