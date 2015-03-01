
float x;
float y;
float xspeed = 2;
float yspeed = 2;
float radius = 15.0;

void setup() {
  size (500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background (#A8CDE0);
  if (y >= 485) {
    xspeed = -2;
  }
  if (x < 15)
  {
    xspeed = 2;
  }
  if (y >= 485)
  {
    yspeed = -2;
  }
  if (y < 15)
  {
    yspeed = 2;
  }
  y = y + yspeed;
  ellipse(250, y, radius, radius);
}

