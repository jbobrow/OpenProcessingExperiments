
float y = 200.0;
float radius = 15.0;
float velocity = 0.0;
float acceleration = 0.01;
int direction = 1;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  fill(200,220,90);
  ellipse(200, y, radius*13, radius);
  velocity += acceleration; // Increase the velocity
  y += velocity*direction; // Update the position
  if (y > height-radius) { 
     direction = -direction;
     } else if (y < 0+radius) {
     direction = -direction;
     }
}


