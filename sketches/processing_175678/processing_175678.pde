
// set variables for ball position and size
 
float x = 100;
float y = 80;
float w = 50;
float h = 50;
 
// and speed in both the x and y axes
 
float speedX = 1;
float speedY = 0;
 
 
void setup() {
 
  size(300, 300);
  
  
  smooth();
 
  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
 
}
 
void draw() {
   
  //clear the background and set the fill colour
  background(#A133DE);
  fill(255, 100, 0);
 
  // draw the circle in its current position
  ellipse(x, y, w, h);
 
  // add gravity to the Y speed
  speedY = speedY + 0.5;
 
  // add the speed to the position
  x = x + speedX;
  y = y + speedY;
 
  // if we're off the left or off the right, reverse the speed
  if ((x > width - w) || (x <= 0)) {
    speedX = -speedX;
  }
 
  // if we've hit the floor...
  if (y > height - h) {
    // set the position to be on the floor
    y = height - h;
    // and make the y speed 90% of what it was,
    // but in the opposite direction
    speedY = speedY * -0.9;
  }
  else if (y <= 0) {
    // if the ball is off the top,
    // make it bounce off
    speedY = -speedY;
  }
}
 
void mousePressed() {
  // when the mouse is pressed, give the ball
  // a random velocity
 
  speedX = random(-20, 20);     
  speedY = -30;

fill(#F71E1E);
  rect(mouseX,mouseY,200,200);
}
