
//Bouncing ball sketch with multiple bouncing balls, a wind force pushing gently to the right,
//a gravity force that is scaled by mass and friction. Mass is interpreted as proportional to size in
//this example. Methodology adopted from Daniel Shiffman's Nature of Code by following along the
//"Vectors" and "Forces" chapters and modifying and combining code from different parts of them. 

// Declare Mover array
Mover[] movers = new Mover[20];

void setup() {
  size(600, 600);
  for (int i = 0; i < movers.length; i++) {
    // initializing many Mover objects
    color C = color(random(100, 200), random(100, 200), random(100, 200), random(50, 200));
    movers[i] = new Mover(random(1, 5), random(0, 600), random(0, 600), C);
  }
}



void draw() {
  background(0);

  for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.002, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    //apply the friction force vector to the object.
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;

  Mover(float m, float x, float y, color C) {
    //setting these variables with arguments
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = C;
  }

  // Newton’s second law
  void applyForce(PVector force) {
    //receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //clearing the acceleration each time
    acceleration.mult(0);
  }

  void display() {
    fill(c);
    noStroke();
    //scaling the size according to mass.
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  // object bounces when it hits the edges of a window.
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}



