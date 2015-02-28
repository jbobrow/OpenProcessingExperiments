
// pf Boid_1 20100618

// Declare Objects
Boid Boid1;
Boid Boid2;

void setup() {
  size(500,500);
  background(2);
  Boid1 = new Boid(new PVector(random(width),random(height)), new PVector(0,0), 1.0, color(255,0,0));
  Boid2 = new Boid(new PVector(random(width),random(height)), new PVector(0,0), 0.5, color(0,0,255));
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  Boid1.move();
  Boid1.display();
  Boid2.move();
  Boid2.display();
}

class Boid {
  PVector pos;
  PVector vel;
  float acc;
  color colour;
  float maxspeed;
  PVector accelerate;
  
Boid(PVector position, PVector velocity, float acceleration, color paint) {
  pos = position;
  vel = velocity;
  acc = acceleration;
  maxspeed = 10;
  colour = paint;
}

void move() {
// Determine Mouse location  
  PVector mouse = new PVector(mouseX,mouseY);
// Determine which direction to go (accelerate)  
  PVector direction = PVector.sub(mouse,pos);
// Determine how close to target
  float separation = direction.mag();
  direction.normalize(); // Normalize to get unit vector
  direction.mult(acc); // Calculate actual acceleration
  accelerate = direction;

  vel.add(accelerate); // Calculate velocity
  vel.limit(maxspeed); // Limit speed
  
  if (separation < 20) { // If Boid close to target then stop
    vel.x = 0;
    vel.y = 0;
  }
  
  pos.add(vel); // Calculate position
  
  // Limit movement within window and bounce at window edge
  if ((pos.x < 0) || (pos.x > width)) {
    vel.x = vel.x * -1;
  }
  if ((pos.y < 0) || (pos.y > height)) {
    vel.y = vel.y * -1;
  }  
}

void display() {
  stroke(0);
  fill(colour);
  ellipse(pos.x,pos.y,10,10);
}
}

