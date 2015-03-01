
Mover[] movers = new Mover[20];

Attractor a;

void setup() {
  size(400,400);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.001,10),random(width),random(height)); 
  }
  a = new Attractor();
}

void draw() {
  //background(0,0,255);

  a.display();

  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].display();
  }

}
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector(0.01,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {

    velocity.add(acceleration);
    location.add(velocity);

    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity,-0.1,0.1);
    angle += aVelocity;

    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255,120);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,mass*10,mass*60);
    popMatrix();
  }

}
class Attractor {
  float mass;         // Mass, tied to size
  PVector location;   // Location
  float g;

  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
    g = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    noStroke();
    //strokeWeight(2);
    fill(0,0,255);
    smooth();
    ellipse(location.x, location.y, 180, 180);
  }
}


