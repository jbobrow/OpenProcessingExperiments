
// set variables for ball position and size
 
float x = 100;
float y = 80;
float w = 50;
float h = 50;
 
// and speed in both the x and y axes
 
float speedX = 1;
float speedY = 1.5;
 
 
void setup() {
 
  size(300, 300);
  smooth();
 
  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
 
}
 
void draw() {
   
  //clear the background and set the fill colour
  background(100, 0, 0);
  fill(255, 100, 0);
 
  // draw the circle in its current position
  ellipse(x, y, w, h);
  
  // add the speed to the position
  x = x + speedX;
  y = y + speedY;
 
  // if we're off the left or off the right, reverse the speed
  if ((x > width - w) || (x <= 0)) {
    speedX = -speedX;
  }
 
  // if we've hit the bottom or the top
  if ((y > height - h)||(y <= 0)) {

    // reverse the speed
    speedY = -speedY;
  }
}
