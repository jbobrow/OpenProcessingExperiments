
float xPosition = 0;
float xSpeed = 50;
float yPosition = 0;
float ySpeed = 50;
float radius =15;

void setup() {   //Static things, such as background

  size(400,300);
  background(93, 14, 137);
}

void draw() {                          // Stuff that happens over and over again, moving etc
  
  if (mousePressed)   {
  fill(247, 96, 25);
  } else {       // <-- causes the ellipse to change colour depending on mousepress
    fill(255);
  }
  // <-- play with this  ! = if not pressed
      //background(93, 14, 137);        // resets the background - delete to leave pattern

  ellipse(xPosition, yPosition, 15, 15);    // x/y/height/width
  xPosition = xPosition + xSpeed;      // the speed of how it travels left to right
  yPosition = yPosition + ySpeed;

  if (yPosition+radius>height) {
    ySpeed = -10;
  }
  if (xPosition+radius>width) {                 // if xpostion is greater than width it will reset)
    xSpeed = -10;                     // xPosition = 0; <-- makes it repeat
  }

  else if (xPosition<radius) {             //this makes it bounce back and forth using the -20 and 20

      xSpeed = 10;
  }
  else if (yPosition<radius) {
    ySpeed = 10;
  }
}
