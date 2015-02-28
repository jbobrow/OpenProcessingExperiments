
// bouncing circle
// this time, our circle bounces in both the x and y directions
// also takes the radius of the circle into account when calculating
// when to bounce

float x;
float y;
float speedX = random(1, 2);
float speedY = random(1, 2);
float radius = 50;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  fill(255, 91, 0);
  stroke(255);
  strokeWeight(3);
  // we can't assign x and y up there -- we have to wait until we 
  // called size(), otherwise not be what we expect
  x = width/2;
  y = height/2;
}

//--------------------------------------------------------
void draw() {
  background(132, 0, 46);

  // draw the circle
  ellipse(x, y, radius*2, radius*2);
  
  // move the circle
  x = x + speedX;
  y = y + speedY;

  // bounce when we reach the edges edges! 
  if ( x > (width-radius) || x < radius ) {
    speedX = speedX * -1;
  }
  if ( y > (height-radius) || y < radius ) {
    speedY = speedY * -1;   
  }
}

