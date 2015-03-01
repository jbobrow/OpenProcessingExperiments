

// how to cite so you do not end up plaigiarizing!

/* This code is based upon Alberto Bustillo's sketch, "Simple Gravity" at http://www.openprocessing.org/sketch/66568, which shows a bouncing ball that seems to adhere to the laws of gravity. I changed the ball into a square.
*/

float x, y;
color col = color(0, 255, 255);
float speed = 0;
float gravity = 0.1;
float ediam = 100;
 
 
void setup () {
  size(500, 500);
  smooth();
  x = width/2;
  y = random(0, height/3);
}
 
void draw() {
  background(180);
 
  //display the ball
  rectMode(CENTER);
  fill(col);
  strokeWeight(3);
  rect(x, y, ediam, ediam);
  y = y + speed;
  speed = speed + gravity;
  if (y > height-ediam/2) {
    speed = speed * -0.95;
    col = color(random(255), random(255), random(255));
  }
}

