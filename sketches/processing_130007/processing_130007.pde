

float xPos = 0;
float xSpeed = 5;
float yPos, ellipseWidth, ellipseHeight;

boolean exceededBoundary = false;

void setup() {
  size(300, 300);
  yPos = 150;
  ellipseWidth = 30;
  ellipseHeight = 30;
}

void draw() {
  //get ready to move the ball
  xPos += xSpeed;
  //reset the background
  background(120,120,120);
  //this statement checks two things:
  //    are we going right? AND
  //    has the edge of the circle reached the edge of the canvas?
  //checking whether we're going right is not actually
  //necessary here, but this demonstrates how to combine 
  //more than one condition
  if  (   (xSpeed > 0) && (xPos + ellipseWidth/2 >= width)  ) {
    exceededBoundary = true;
  } else if (  (xSpeed < 0) && (xPos - ellipseWidth/2 <= 0)  ) {
    exceededBoundary = true;
  }
  
  //we've saved the result of our checks to this boolean
  //variable, so now we can just check its value to see what
  //to do
  if (exceededBoundary) {
    xSpeed *= -1;
    //it's important to set it back to false here! otherwise
    //the sketch will get stuck here
    exceededBoundary = false;
  }
  
  //finally, draw the ellipse
  ellipse(xPos, yPos, ellipseWidth, ellipseHeight);
}


