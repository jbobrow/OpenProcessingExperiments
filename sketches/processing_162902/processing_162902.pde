
float y = 50.0;
float speed = 1;
float radius = 15.0;
 
void setup() {
  size(200, 200);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
}
 
void draw() {
  if (y > height-radius) {
    speed = -1;
  }
  if (y < radius) {
    speed = 1;
  }
  if(speed == 1){
    fill(0);
    background(255);
  }
  if(speed == -1){
    background(0);
    fill(255);
  }
  ellipse(33, y, radius, radius);
  y = y + speed;
}


