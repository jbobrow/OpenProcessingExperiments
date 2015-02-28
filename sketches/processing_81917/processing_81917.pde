
float xPosition = 0;
float xSpeed = 50;

void setup() {     // things such as canvus size and background colour goes here

  size(600, 400);
 
}

void draw() {   // moving objects and such go here


  background(93, 14, 137);             // resets the background - delete to leave pattern
  ellipse(xPosition, 200, 50, 50);     // x/y/height/width
  if (mousePressed)                    // causes the ball to move when the mouse is pressed
    xPosition = xPosition + xSpeed;    // the speed of how it travels left to right

  if (xPosition>width) {    // if xpostion is greater than width it will reset)
    xSpeed = -20;   // xPosition = 0; <-- makes it repeat
  }
  if (xPosition<0) {      //this makes it bounce back and forth using the -20 and 20

      xSpeed = 20;
  }
}
