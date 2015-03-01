
float y = 50.0;
float speed = 1.0;
float radius = 15.0;
 
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw() {
  background(206, 240, 239);
  fill(239, 206, 240);
  ellipse(width/2.0, y, radius, radius);
  fill(233, 206, 240);
  ellipse(width/4.0, y, radius, radius);
  fill(218, 206, 240);
  ellipse(3*width/4.0, y, radius, radius);
  fill(206, 209, 240);
  ellipse(width/8.0, y, radius, radius);
  fill(206, 223, 240);
  ellipse(3*width/8.0, y, radius, radius);
  fill(218, 206, 240);
  ellipse(5*width/8.0, y, radius, radius);
  fill(206, 240, 227);
  ellipse(7*width/8.0, y, radius, radius);
  y = y + speed;
  if (y >= height-radius) {
    speed = -speed;
  }else if (y <= radius){
    speed = -speed;
  }
}

