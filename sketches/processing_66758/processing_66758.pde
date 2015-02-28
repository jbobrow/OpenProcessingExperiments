
// A combination of the things we have covered today

//Y-Direction
int yPos = 200;  //vertical position of circles
int yVel = 1;  //amount of pixels and direction (+ or -) circles will move each frame

//X-Direction
 int xPos = 200;
 int xVel = 1;

void setup() {
  size(400, 400);
  frameRate(60);
  smooth();
  ellipseMode(CENTER);  //sets reference node of ellipse to the center (as opposed to top left)
  noStroke();
}

void draw () {
  fill(255, 255, 255, 10); //set color white to reset background... 4th input is alpha value
  // try adjusting the alpha value to vary the gradient (the tail) of the circles
  rect(0, 0, 400, 400);
  fill(0); //set color back to black with full alpha

  for (int i=0; i<4; i++) {
    
    //Y-Direction
    ellipse(0+80*(i+1), yPos, 20, 20);
    
    //X-Direction
    ellipse(xPos, 0+80*(i+1), 20, 20);  //this will draw a vertical
  }

  moveCircles(5); // Play with the number inside of the function to change the speed of the circles
}


void moveCircles(int speedMultiplier) {
// Y-Direction
  if (yPos == 10 || yPos == 390) { //checks to see if the circles are at the top or bottom of render window
    yVel = yVel*(-1); //if they are, changes the direction of the movement
  }
  
  yPos = yPos + speedMultiplier*yVel; //applies the movement to the position

// X-Direction
  if (xPos == 10 || xPos == 390) {
    xVel = xVel*(-1);
  }

  xPos = xPos + speedMultiplier*xVel;
}


