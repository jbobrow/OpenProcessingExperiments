
// The Nature of Code
// Daniel Shiffman
// Draft book

// Example 1-2: Bouncing Ball, with PVector!
PVector location;
PVector velocity;

void setup() {
  size(600,400);
  smooth();
  background(56);
  location = new PVector(50,50);
  velocity = new PVector(4,10);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
  location.add(velocity);

  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(location.x,location.y,10,5);
}



