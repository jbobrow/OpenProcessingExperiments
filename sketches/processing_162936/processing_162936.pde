
float y = 50.0;
float speed = 1.0;
float radius = 50.0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  ellipse(250, y, radius, radius);
  y = y + speed;
  if (y > height-radius) {
    speed = speed *-1;
  else if (y <= radius){
    speed = -speed;

  }
}
}


