
//Initial Position of the Ball
int xPos=25;
int yPos=25;

//Velocity of the Ball
int xVel=2;
int yVel=5;

//Space Setup
void setup() {
  size(500, 200);
  smooth();
}

//Bouncing Ball Setup
void draw() {
  background(30,30,15);
  fill(0, 200, 200);
  ellipse(xPos, yPos, 50, 50);

  xPos=xPos+xVel;
  yPos=yPos+yVel;

//To reverse the direction we set the value to Negative (Multiplying by -1)
  if (xPos>width-25||xPos<25) {
    xVel=xVel*-1;
  }
  if (yPos>height-25||yPos<25) {
    yVel=yVel*-1;
  }
}


