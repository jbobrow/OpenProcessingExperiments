
Mover [] movers = new Mover[50];

void setup() {
  size(800, 200);
  smooth();
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i]=new Mover(random(0.1, 5), 0, 0);
  }
}

void draw() {
  fill(190, 50);
  rect(0, 0, width, height);

  PVector wind = new PVector(0.03, 0);
  PVector gravity = new PVector(0, 0.1);

  for (int i = 0; i < movers.length; i++) {
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

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);

    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 150, 150);
    strokeWeight(1.3);
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } 
    else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
