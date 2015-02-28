
PVector sunLoc, planetLoc, acceleration, velocity, displacement, force;
float sunMass = 200;
float planetMass = 30; 


void setup() {
  size(600, 600);
  planetLoc = new PVector(200, 150);
  sunLoc = new PVector(width/2, height/2);
  velocity = new PVector (0, 0);
  acceleration = new PVector (3.5, -4.5);
  force = new PVector(0, 0);
}

void draw() {
  background(50);
  PVector force = PVector.sub(sunLoc, planetLoc);
  float distance = force.mag();
  distance = constrain(distance, 5, 900);
  force.normalize();
  float strength = (1 * sunMass * planetMass) / (distance * distance);
  force.mult(strength);

  acceleration.add(force);
  velocity.add(acceleration);
  planetLoc.add(velocity);
  velocity.mult(0);

  fill(255, 255, 0);
  ellipse(planetLoc.x, planetLoc.y, planetMass, planetMass);
  ellipse(sunLoc.x, sunLoc.y, sunMass/2, sunMass/2);
}



