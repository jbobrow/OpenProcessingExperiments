
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 7;
  }

  void update() {
    
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
    acceleration.normalize();
    acceleration.mult(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(0);
    fill(0, 200, 100);
    triangle(location.x-20, location.y, location.x-36, location.y+10, location.x-36, location.y-10);
    fill(255, 102, 0);
    ellipse(location.x,location.y,48,30);
    fill(0);
    ellipse(location.x+18,location.y-5,5,3);
    fill(0, 200, 100);
    strokeWeight(1);
    line(location.x+20,location.y+6, location.x+10,location.y+3);
  }

}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of the basics of motion with vector.
// A "Mover" object stores location, velocity, and acceleration as vectors
// The motion is controlled by affecting the acceleration (in this case towards the mouse)

Mover[] movers = new Mover[20];

void setup() {
  size(800,400);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  
  background(0,0,100);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display(); 
  }
}



