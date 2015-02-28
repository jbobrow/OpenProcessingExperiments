
float x;
float y;
float speed = 0;
float grav = 0.1;
float rad = 50;
 
 
void setup () {
  size(200, 200);
  smooth();
  x = 100;
  y = 0;
}
 
void draw() {
  background(180);
  ellipseMode(CENTER);
  fill(100);
  ellipse(x, y, rad/2, rad/2);
  y = y + speed;
  speed = speed + grav;
  if (y > width-rad/2) {
    speed = speed * -0.95;
  }
}
