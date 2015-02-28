
float x = 50.0;
float side = 15.0;
float velocity = 0.0;
float acceleration = 0.02;

void setup() {
  size(100, 100);
  smooth();
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255, 0, 60, 100);
  rect(x, 45, side, side);
  velocity += acceleration; 
  x += velocity; 
  if (x > width+side) { 
    x = -side;
  }
}


