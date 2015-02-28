
// Declare Mover object
Mover mover;
float ellipseradius;

void setup() {
  size(640, 400);
  smooth();
  background(255);
  // Make Mover object
  mover = new Mover(random(1, 10000));
  ellipseradius = random(2.5, 75);
}


void draw() {
  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display();
}


void mouseReleased() { // Click to draw a new one
  background(255);
  ellipseradius = random(2.5, 75);
  mover.mass = random(1, 10000);
  mover.randomiseVelocity();
}



class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float tempmass) {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-5, 5), random(-5, 5));
    acceleration = new PVector(0, 0);
    mass = tempmass;
  }

  void update() {
    PVector origin = new PVector(width/2, height/2);  
    PVector dir = PVector.sub(origin, location);
    float displacementlength = dir.mag();
    dir.normalize();
    PVector force = PVector.mult(dir, displacementlength * 0.9);    //multiply by spring constant
    acceleration = PVector.div(force, mass); // F = ma

    // Velocity change by acceleration and is limited by topspeed.
    velocity.add(acceleration);
    //velocity.mult(0.995); //damping
    location.add(velocity);
  }

  void display() {
    smooth();
    stroke(#000000, 50);
    strokeWeight(2);
    noFill();
    ellipse(location.x, location.y, ellipseradius*2, ellipseradius*2);
  }

  void randomiseVelocity() {
    velocity = new PVector(random(-5, 5), random(-5, 5));
  }

  void checkEdges() {

    if (location.x > width + ellipseradius) {
      location.x = 0  - ellipseradius;
    } 
    else if (location.x < 0 - ellipseradius) {
      location.x = width  + ellipseradius;
    }

    if (location.y > height  + ellipseradius) {
      location.y = 0  - ellipseradius;
    } 
    else if (location.y < 0 - ellipseradius) {
      location.y = height  + ellipseradius;
    }
  }
}
                
