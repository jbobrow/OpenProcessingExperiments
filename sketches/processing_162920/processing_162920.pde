
float y = 50.0;
float speed = 1.0;
float radius = 15.0;
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw() {
  background(0);
  ellipse(200, y, radius, radius);
  y = y + speed;
  if (y > height-radius) { 
  speed = -1.0; 
  }
  if (y < 0 + radius) {
    speed = 1;
  } 
}


