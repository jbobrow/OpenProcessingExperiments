
float y = 50.0;
float speed = 5.0;
float radius = 15.0;
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw() {
  background(0);
  fill(random(255),random(255),random(255));
  stroke(255,255,255);
  ellipse(33, y, radius, radius);
  ellipse(73, y, radius, radius);
  ellipse(113, y, radius, radius);
  y = y + speed;
  if (y > height+15) {
    y = height + 15;
    speed = - speed;
  }
  if (y < radius && speed < 0)
  { 
    speed = -speed;
  }
}
