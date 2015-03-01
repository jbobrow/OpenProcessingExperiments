
int circleX = 0;
int speed = 1;
void setup() {
  size(200,200);
  smooth();
}
void draw() {
  background(255);
  circleX = circleX + speed;
  if ( circleX > width || circleX < 0)
     speed = speed * -1;  // reverse course
  // Display the circle at x location
  stroke(0);
  fill(175);
  ellipse(circleX, 100, 32, 32);  
}
