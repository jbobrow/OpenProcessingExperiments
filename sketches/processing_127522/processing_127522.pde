
/*
a bouncing ball
*/
 
float ballX = 100;
float ballY = 0;
float h = 50;
 
//create a variable for speed
float speedY = 2;
 
void setup() {
  size(400,400);
  smooth();
  noStroke();
   
  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
 
}
 
void draw() {
  //clear the background and set the fill colour
  background(0);
  fill(255);
   
  //draw the circle in it's current position
  ellipse(ballX, ballY, h,h);
  
  //add a little gravity to the speed
  speedY = speedY + 2.0; 
   
  //add speed to the ball's
  ballY = ballY + speedY;
   
   
  if (ballY > height - h) {
    // set the position to be on the floor
    ballY = height - h;
    // and make the y speed 90% of what it was,
    // but in the opposite direction
    speedY = speedY * -0.9;
     
    //switch the direction
    //speedY = speedY;
  }
  else if (ballY <= 0) {
    // if the ball hits the top,
    // make it bounce off
    speedY = -speedY;
  }
 
   
}


