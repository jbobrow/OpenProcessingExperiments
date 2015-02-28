
Mover m;
PVector wind;
PVector gravity;
PVector friction;
Mover[] movers = new Mover[10];
float coefficient = .5;

void setup() {
  size(800, 800);
  wind = new PVector(2.5, 0);
  gravity = new PVector(0, 4);
  // Fill the movers array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0, width), 0, random(5, 15));
  }
}

void draw() {
    background(0);

    // Draw the array of movers
  for (int i = 0; i < movers.length; i++) {
    float moverMass = movers[i].mass;

    // Make a copy of velocity and assign it to friction.
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(coefficient);

    m = movers[i];
    m.update();
    m.checkEdges();
    m.applyForce(gravity);
    m.applyForce(friction);
    m.display();
  }


    // On click, make a gust of wind.
  if (mousePressed) {
    for (int i = 0; i < movers.length; i++) {
      m = movers[i];
      m.applyForce(wind);
    }
  }

}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;


  Mover(float _x, float _y, float _mass) {
    mass = _mass;
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void display() {
    ellipse(location.x, location.y, 40, 40);
    fill(250);
  }

  void update() {
    float topspeed = 50;
    velocity.add(acceleration);
    location.add(velocity);
    // Reset acceleration, ready to recieve new forces.
    acceleration.mult(0);
  }

  // Adds a PVector to acceleration to apply a force
  // Important to add and not replace so we don't mess up other forces
  // eg. make sure forces are accumulate.
  void applyForce(PVector force) {
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
