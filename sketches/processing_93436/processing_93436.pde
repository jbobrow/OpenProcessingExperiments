
// Time is Money
// Jürg Dietrich
// 16.03.2013
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
  background(10);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle(new PVector(mouseX, mouseY)));

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

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
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
    lifespan -= 0.5;
  }

  // particles as clocks
  void display() {
    int c = (int) random(20);
    //fill(184, 134, 11, lifespan);
    //fill(105,105,105,lifespan-100);
    fill(184, 134, 11, lifespan-100);
    
    noStroke();
    ellipse(location.x, location.y, 60, 60);
    stroke(255, lifespan); 
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
    float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  
    strokeWeight(1);
    line(location.x, location.y, cos(s) * 27 + location.x, sin(s) * 27 + location.y);
    strokeWeight(2);
    line(location.x, location.y, cos(m) * 24 + location.x, sin(m) * 24 + location.y);
    strokeWeight(3);
    line(location.x, location.y, cos(h) * 17 + location.x, sin(h) * 17 + location.y);
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

