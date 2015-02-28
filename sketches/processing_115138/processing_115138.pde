
Mover m;
PVector wind;
PVector gravity;

void setup() {
  size(800, 800);
  m = new Mover();
  wind = new PVector(4, 0);
  gravity = new PVector(0, 2.5);


}

void draw() {
    background(0);
    m.update();
    m.display();
  m.checkEdges();
  m.applyForce(gravity);
    
    // On click, make a gust of wind.
    if (mousePressed) {
        m.applyForce(wind);
    }


}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(250, 250);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    // Arbitrary value for mass
    mass = 10;
  }

  void display() {
    ellipse(location.x, location.y, 40, 40);
    fill(250);
  }

  void update() {
    float topspeed = 50;
    velocity.add(acceleration);
    // velocity.limit(topspeed);
    location.add(velocity);
    // Reset acceleration, ready to recieve new forces.
    acceleration.mult(0);
  }

  // Adds a PVector to acceleration to apply a force
  // Important to add and not replace so we don't mess up other forces
  // eg. make sure forces are accumulate.
  void applyForce(PVector force) {
    //  PVector f = force.get();
    // f.div(mass);
    //  acceleration.add(f);

    // Static method of the above
    // Make a copy of the incoming force so we don't destroy it for other objects
    // Divide force by mass and add it to acceleration.
    PVector f = PVector.div(force, mass);
    acceleration.add(f);

  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    }

     if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }



  }
}
