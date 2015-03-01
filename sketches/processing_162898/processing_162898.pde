
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
    fill(y * (255/( height - (2 * radius ))) - (2 * radius));
    background(255 - (y * (255/( height - (2 * radius )))) + (2 * radius));
  }
  if(speed == -1){
    background(y * (255/( height - (2 * radius ))) - (2 * radius));
    fill(255 - (y * (255/( height - (2 * radius )))) + (2 * radius));
  }
  ellipse(33, y, radius, radius);
  y = y + speed;
}


