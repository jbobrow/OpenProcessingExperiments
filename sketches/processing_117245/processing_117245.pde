
PVector location;
PVector velocity;

void setup() {
  size(200,200);
  smooth();
  background(255);
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
  location.add(velocity);

  // We still sometimes need to refer to the individual components of a PVector 
  // and can do so using the dot syntax (location.x, velocity.y, etc.)
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(location.x,location.y,16,16);
}
