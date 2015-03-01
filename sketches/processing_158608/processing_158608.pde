
//bouncingBallColorChange, jeg Sandbox #1

float xPos, yPos;
float xSpeed, ySpeed;
color aCol, bCol, cCol, dCol;
color theColor;

void setup() {
  size(400, 400);
  xPos = width/2;
  yPos = height/2;
  xSpeed = 10;
  ySpeed = 4;

  aCol = color(255, 0, 0);
  bCol = color(0, 255, 0);
  cCol = color(0, 0, 255);
  dCol = color(255);
  theColor = dCol;

  smooth();
}

void draw() {
  background(120);
  fill(theColor);
  ellipse(xPos, yPos, 80, 80);

  xPos = xPos + xSpeed;
  yPos = yPos + ySpeed;

  if (xPos > width) {
    xSpeed = xSpeed * -1;
    theColor = aCol;
  }
  if (xPos < 0) {
    xSpeed = xSpeed * -1;
    theColor = bCol;
  }

  if (yPos > height) {
    ySpeed = ySpeed * -1;
    theColor = cCol;
  }
  if (yPos < 0) {
    ySpeed = ySpeed * -1;
    theColor = dCol;
  }
}

//How would we make the background change to the color the ball
//had previously?


