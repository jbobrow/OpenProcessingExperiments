
Attractor [] attractors = new Attractor[3];
Mover [] movers = new Mover[1000];
boolean display;  // to display attractors

void setup() {
  size(500, 500);
  smooth();
  background(255);
  display = false;
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(width), random(height), random(20, 45));
  }
}


void draw() {
  fill(240, 100);
  rect(0, 0, width, height);

  for (int i = 0; i < movers.length; i++) {
    for ( int j = 0; j < attractors.length; j++) {
      PVector force = attractors[j].attract(movers[i]);
      movers[i].applyForce(force);
    }

    //apply the attraction force from the attractor on the mover
    movers[i].update();
    movers[i].display();
  }
  if (display == true) {
    for (int i = 0; i < attractors.length; i++) {
    attractors[i].mouseInside();
      attractors[i].display();
    }
  }
}

void keyPressed() {
  if (key == 's') {
    display = !display;
  }
}




class Attractor {
  float mass;
  PVector location;
  float G;


  Attractor(float x, float y, float mass_) {
    location = new PVector (x, y);
    mass = mass_;
    G = 0.4;
  }

  PVector attract(Mover m) {


    PVector force = PVector.sub(location, m.location); //whats the force direction?
    float distance = force.mag();
    distance = constrain(distance, 5, 25); //constraint distance
    force.normalize();
    float strength = (G*mass*m.mass) / (distance * distance);
    force.mult(strength); // whats the force magnitude?
    return force; // return force so it can be ap`plied!
  }

  void mouseInside() {
    if (mousePressed) {
      if (dist(location.x, location.y, mouseX, mouseY) < mass) {
        location.x = mouseX;
        location.y = mouseY;
      }
    }
  }


  void display() {
    noStroke();
    fill(12, 232, 104, 80);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}

/**
 * Forces (Gravity and Fluid Resistence) with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of multiple force acting on bodies (Mover class)
 * Bodies experience gravity continuously
 * Bodies experience fluid resistance when in "water"
 */


class Mover {

  // location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  // Mass is tied to size
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
  
  // Draw Mover
  void display() {
    noStroke();
    fill(255,43,41,180);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
  
  // Bounce off bottom of window
  void checkEdges() {
    if (location.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      location.y = height;
    }
  }
}




