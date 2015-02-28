
/**
This is an exercise in pure randomness. On each frame, a 
point is randomly chosen on the canvas, and a line connects
it to the last randomly chosen point.

Transparency is used so that an overall texture emerges over
time. In this version, we added a black rectangle to fade the
lines over time. This kind of gives it a sixties era title
sequence kind of feel.

C. Andrews
2014-01-08
**/


float lastX, lastY;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0,0,0);
  lastX = 0;
  lastY = 0;
}



void draw() {
  // draw a mostly transparent black rect over the whole 
  // canvas to fade the contents over time.
  fill(0,0,0,3);
  noStroke();
  rect(0,0,width, height);
  
  strokeWeight(random(25)+5);
  stroke(180  + random(60) - 30, 100,100, 30);
  float newX = random(width);
  float newY = random(height);
  line(lastX, lastY, newX, newY);
  lastX = newX;
  lastY = newY;
}



