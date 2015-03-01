
float y = 50.0;
float speed = 3.0;
float radius = 15.0;
 
void setup() {
  size(100, 100);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw() {
  background(0);
  ellipse(33, y, radius, radius);
  y = y + speed;
  if (y+radius > height) {
    speed = -speed;
  }
  else if (y-radius < 0){
    speed = -speed;  
  }
}


