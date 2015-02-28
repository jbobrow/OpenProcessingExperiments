
/**
 This is an exercise in pure randomness. On each frame, a 
 point is randomly chosen on the canvas, and a line connects
 it to the last randomly chosen point.
 
 Transparency is used so that an overall texture emerges over
 time.
 
 C. Andrews
 2014-01-08
 **/

float lastX, lastY;

void setup() {
  size(600, 600);

  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0);
  lastX = 0;
  lastY = 0;
}



void draw() {

  strokeWeight(random(25)+5);
  stroke(random(80)+240, 100, 100, 5);
  float newX = random(width);
  float newY = random(height);
  line(lastX, lastY, newX, newY);
  lastX = newX;
  lastY = newY;
}



