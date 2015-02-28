
//// Nathen McVittie
///// Creative Computing
////// Assignment 2
/////// Pong Style Game
//////// | . |


// Variables
int yPos;
int xPos;
int xSpeed;
int ySpeed;
int paddleY;
int paddleY2;
int paddleSpeed;
int paddleSpeed2;

void setup() {
  smooth();
  size(400, 800);
  xPos = 100;
  yPos = 100;
  xSpeed = 5;
  ySpeed = 3;
  //paddleY = right paddle
  paddleY = 0;
  //paddleY2 = left paddle
  paddleY2 = 0;
  paddleSpeed = 3;
  paddleSpeed2 = 5;
}

void draw() {

  background(0);
  //bounce back from the sides
  if (xPos >= width || xPos <= 0) {
    xSpeed = -xSpeed;
  }
  //bounce back from top and bottom
  if (yPos >= height-25 || yPos <= 25) {
    ySpeed = -ySpeed;
  }
  //bounce for right paddle (only need one bounce as moving on one axis)
  if (paddleY < 0 || paddleY >= height-90) {
    paddleSpeed = -paddleSpeed;
  }
  //bounce for left paddle (only need one bounce as moving on one axis)
  if (paddleY2 < 0 || paddleY2 >= height-90) {
    paddleSpeed2 = -paddleSpeed2;
  }
  //ellipse bounce off right paddle
  if (xPos >= 360 &&  xPos <= 385) {
    xSpeed =- xSpeed;
  }
  //ellipse bounce
  if (yPos >= paddleY && yPos <= paddleY+90) {
    ySpeed =- ySpeed;
  }

  if (xPos >= 15 && xPos <= 40) {
    xSpeed =- xSpeed;
  }

  if (yPos >= paddleY2 && yPos <= paddleY2+90) {
    ySpeed =- ySpeed;
  }

    xPos += xSpeed;
    yPos += ySpeed;
    paddleY += paddleSpeed;
    paddleY2 += paddleSpeed2;
    ellipse(xPos, yPos, 50, 50);
    noStroke();
    rect(360, paddleY, 25, 90);
    rect(15, paddleY2, 25, 90);
    //check y position of right paddle
    println(paddleY);

  //making sure paddle moves and doesn’t get stuck
  if (paddleSpeed > 0) {
    paddleSpeed = 3;
  }
 
  else {
    paddleSpeed = -3;
  }
 
  if (paddleSpeed2 > 0) {
    paddleSpeed2 = 3;
  }
 //helping it bounce back
  else {
    paddleSpeed2 = -3;
  }
  //key pressed makes paddle speed up -- reverts back to default speed
    if (keyPressed == true) {
      if (key =='a') {
        paddleSpeed = 8;
      }
    }

    if (keyPressed == true) {
      if (key =='s') {
        paddleSpeed2 = 8;
      }
    }
  }


