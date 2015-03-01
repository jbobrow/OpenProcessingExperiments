

float x = 200;
float y = 120;
float w = 80;
float h = 80;
 
// and speed in both the x and y axis
 
float speedX = 5;
float speedY = 2;
 
 
void setup() {
 
  size(500, 500);
  smooth(3);
 
  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
 
}
 
void draw() {
   
  //clear the background and set the fill colour
  background(50, 0, 0);
  fill(241, 75, 0);
 
  // draw the circle in its current position
  ellipse(x, y, w, h);
 
  // add gravity to the Y speed
  speedY = speedY + 1;
 
  // add the speed to the position
  x = x + speedX;
  y = y + speedY;
 
  // if we're off the left or off the right, reverse the speed
  if ((w > width - x) || (x <= 5)) {
    speedX = -speedX;
  }
 
  // if we've hit the floor...
  if (y > height - h) {
    // set the position to be on the top
    y = height - h;
    
    speedY = speedY * -0.9;
  }
  else if (y <= 0) {
    // if the ball is off the top,
    // make it bounce off
    speedY = -speedY;
  }
}
 
void mousePressed() {
  // moving velocity of the ball with mousePressed
 
  speedX = random(-50, 30);     
  speedY = -50;
}

