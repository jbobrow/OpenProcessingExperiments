
// New Year's Eve Countdown Clock
// 16.03.2013
// Jürg Dietrich
//
// Implementation of Wristwatch
// adapted from
// Libby Riefler <er845@bard.edu>
// http://www.openprocessing.org/sketch/7877


ArrayList<Particle> particles;

void setup() {
  size(840,660);
  particles = new ArrayList<Particle>();
  smooth();
}

void draw() {
  background(0);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  
  while (particles.size() <100)
  particles.add(new Particle(new PVector(width/2, 100)));
  
  

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map((hour()+minute()/60.0), 0.0, 12.0, 0, TWO_PI) - HALF_PI;
  
  int r = 204; 
  int g = 154; 
  int b = 31;
  int t24 = 24;
  int t24m = -24;
  int t14 = 14; 
  int t14m = -14;
  int lx = 10;
  int ly = 10;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-3,4),random(-3,4));
    location = l.get();
    lifespan = 255.0;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
    //showText();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1;
    r += 6; g += 4; b += 2;
    lx += random(1000);
  }

  // particles as clocks
  void display() {
    
    fill(100+r%255, 100+g%255, 100+b%255, lifespan-100);
    
    noStroke();
    ellipse(location.x, location.y, 60, 60);
    stroke(255, lifespan); 


  
    strokeWeight(1);
    line(location.x, location.y, cos(s) * 27 + location.x, sin(s) * 27 + location.y);
    strokeWeight(2);
    line(location.x, location.y, cos(m) * 24 + location.x, sin(m) * 24 + location.y);
    strokeWeight(3);
    line(location.x, location.y, cos(h) * 17 + location.x, sin(h) * 17 + location.y);
    
    
    
    stroke(r,g,b);
    strokeWeight(1);
    
    line(location.x+26, location.y, location.x+29, location.y);
    line(location.x-26, location.y, location.x-29, location.y);
    line(location.x, location.y+26, location.x, location.y+29);
    line(location.x, location.y-26, location.x, location.y-29);
    
    ellipse(location.x+24, location.y-14, 0,1);
    ellipse(location.x+14, location.y-24, 0,1);
    
    ellipse(location.x-24, location.y-14, 0,1);
    ellipse(location.x-14, location.y-24, 0,1);
    
    ellipse(location.x+24, location.y+14, 0,1);
    ellipse(location.x+14, location.y+24, 0,1);
    
    ellipse(location.x-24, location.y+14, 0,1);
    ellipse(location.x-14, location.y+24, 0,1);
    
    if (lifespan < 150) {
      t24 += 2; t24m -= 2; t14 += 2; t14m -= 2;
      ellipse(location.x+t24, location.y, 0,1);
      ellipse(location.x+t24m, location.y, 0,1);
      ellipse(location.x, location.y+t24, 0,1);
      ellipse(location.x, location.y+t24m, 0,1);
      
      ellipse(location.x+t24, location.y+t14m, 0,1);
      ellipse(location.x+t14, location.y+t24m, 0,1);
      
      ellipse(location.x+t24m, location.y+t14m, 0,1);
      ellipse(location.x+t14m, location.y+t24m, 0,1);
      
      ellipse(location.x+t24, location.y+t14, 0,1);
      ellipse(location.x+t14, location.y+t24, 0,1);
      
      ellipse(location.x+t24m, location.y+t14, 0,1);
      ellipse(location.x+t14m, location.y+t24, 0,1);
    }
    
    float strength=0.3; // Staerke der Abstossung
    int radius = 50;
    applyPush(new PVector(mouseX, mouseY), strength, radius);

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
    if (lifespan < 100.0) {
      return true;
    } else {
      return false;
    }
  }
}



