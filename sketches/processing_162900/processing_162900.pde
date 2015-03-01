
float y = 50.0;
float speed = 1;
float radius = 15.0;
 
void setup() {
  size(200, 200);
  smooth();
  ellipseMode(RADIUS);
  fill(#034CFF);
  noStroke();
  colorMode(HSB, 360, 100, 100);
}
 
void draw() {
  fill(y * (360/( height - (2 * radius ))) - (2 * radius), 100, 100);
  background(360 - (y * (360/( height - (2 * radius )))) + (2 * radius), 100, 100);
  ellipse(33, y, radius, radius);
  y = y + speed;
  if (y > height-radius) {
    speed = -1;
  }
  if (y < radius) {
    speed = 1;
  }
}


