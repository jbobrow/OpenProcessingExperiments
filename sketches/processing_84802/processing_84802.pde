
PVector position = new PVector(350, 350);
float d = random(0, 360);
PVector velocity = new PVector (sin(d)*5, cos(d) *5);

void setup() {
  size(700,700);
  smooth(0);
  background(200);
}

void draw() {
  noStroke();
  fill(255, 10);
  rect(0,0,width,height);
  textSize(100);
  fill(400, 0, 400);
  text("ben", 250, 350);
  
  //add acceleration
  velocity.x += 0.01 * velocity.x / abs(velocity.x);
  velocity.y += 0.01 * velocity.y / abs(velocity.y);
  
  // Add the current speed to the location.
  position.x += velocity.x;
  position.y += velocity.y;

  // Check for bouncing
  if ((position.x > width) || (position.x < 0)) {
    velocity.x *= -1;
  }
  if ((position.y > height) || (position.y < 0)) {
    velocity.y *= -1;
  }

  // Display at x,y location
  stroke(0);
  fill(400, 0, 400);
  textSize(50);
  text("ben", position.x, position.y);
}
