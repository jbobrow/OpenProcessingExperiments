
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
ParticleSystem ps;

color myColor = color(250,187,0);

void setup() {
  size(800, 600);
  stroke(255);

  int radius =height / 4;
  secondsRadius = radius * 1.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 2.8;

  cx = width / 2;
  cy = height / 2;

  ps = new ParticleSystem(new PVector(1000, 1000));
}

void draw() {


  background(0);

  // Draw the clock background
  fill(150,114,78);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);
  fill(252,130,0,120);
  ellipse(cx, cy, clockDiameter/3, clockDiameter/3);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // Draw the hands of the clock
  stroke(255);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
 
  strokeWeight(3);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  ps.origin = new PVector(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  ps.addParticle();
  ps.run();

  // Draw the minute ticks
  //strokeWeight(5);
  //beginShape(POINTS);

  //for (int a = 0; a < 360; a+=30) {
  //float angle = radians(a);
  //float x = cx + cos(angle) * secondsRadius;
  //float y = cy + sin(angle) * secondsRadius;
  //vertex(x, y);
}
//endShape();
//}

//-----

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    //lifespan = lifespan - 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(myColor, lifespan);
    ellipse(location.x, location.y, 8, 8);
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

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}



