
//move a shape by velocity and acceleration
//y = y+speed
//speed is the magnitude of velocity
//acceleration value > 0 = velocity will increase at each frame
//velocity = velocity + acceleration
//y = y + velocity


// Gradually increases the velocity!!!
float y = 50.0;
float radius = 15.0;
float velocity = 02.0;
float acceleration = 0.1;
float friction = .90;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255);
  ellipse(200, y, radius, radius);
  velocity *= friction;
  velocity += acceleration; // Increase the velocity
  y += velocity; // Update the position
  if (y > height + radius) { // If over the bottom edge,
    y = radius; // move to the top
  }
}


