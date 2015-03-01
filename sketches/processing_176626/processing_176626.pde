
float x = 100;
float y = 100;
float xspeed = 5;
float yspeed = 5.3;

float a = 50;
float b = 50;
float aspeed = 5;
float bspeed = 5.3;

float c = 0;
float d = 0;
float cspeed = 5;
float dspeed = 5.3;

void setup() {
  size(1000,700);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(1000,1000,width,height);
  
  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;
  a = a + aspeed;
  b = b + bspeed;
  c = c + cspeed;
  d = d + dspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  if ((a > width) || (a < 0)) {
    aspeed = aspeed * -1;
  }
  if ((b > height) || (b < 0)) {
    bspeed = bspeed * -1;
  }
  if ((c > width) || (c < 0)) {
    cspeed = cspeed * -1;
  }
  if ((d > height) || (d < 0)) {
    dspeed = dspeed * -1;
  }

  // Display at x,y location
  stroke(0);
  fill(255);
  triangle(x,y,a,b,c,d);

}
