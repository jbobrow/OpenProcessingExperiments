
int gamePLAY = 0;
int gameWIN = 1;
int gameLOSE = 2;

float ballX; //<--> power in these directions
float ballY;
float ballSize = 15;

float ballPower = 1;
float ballDirection = 0;
float speedBoost = 15;

int padWidth = 10;
int padHeight = 50;

int wallDist = 15;

float gamePoints = 0; //how many times the ball hits the paddle
float timer = 11.0;

void setup()
{
  size(400,400);
  textSize(20);
  frameRate(30);
  
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  
  ballX = 1;
  ballY = random(20, (height-150));
}

void draw()
{  
  fill(#FFFFFF);
  rect(0,350, 400,50);
  
  fill(#000000);
  text("Time: " + (int)timer, 250,355);
  text("Hits: " + (int)gamePoints, 50,355);
  
  fill(0,0,0, 10);
  rect(0,0,width,height);
  
  timer -= (1.0 / 30.0);
  if (timer <= 1)
  {
    timer = 1;
    if (gamePoints > 1){gamePLAY = gameWIN;}
    else {gamePLAY = gameLOSE;}
  }
  
  ballX += ballPower * speedBoost; //ball speed
  ballY += ballDirection;
  
  //Constrain paddle to screen
  float padY = constrain(mouseY, padHeight, height-padHeight-100);
  
  //Test to see if the ball is touching the paddle
  float padTouch = width - wallDist - padWidth - ballSize; //making sure the ball does not hit the edge, wall, paddle, or ball size
  
  if (ballX >= padTouch && ballY > (padY - padHeight - ballSize) && ballY < (padY + padHeight + ballSize))
  {
    ballPower *= -1;
    if (mouseY != pmouseY) //if mouseY is not equal to previous mouseY
    {
      ballDirection = (mouseY - pmouseY) / 2.0;
      if (ballDirection >  5) {ballDirection =  5;}
      if (ballDirection < -5) {ballDirection = -5;}
    }
    gamePoints += 1;
    
    fill(#00DD00);
    textAlign(CENTER);
    text("Speed Boost!", width/2,280);
    speedBoost += 2;
  }
  
  //If the ball hits the paddle or back wall, reverse direction
  if (ballX < ballSize && ballPower == -1)
  {
    gamePoints += 1;
    ballPower *= -1;
  }
  
  if (ballX > width){gamePLAY = gameLOSE;}
  
  //If the ball is touching top or bottom edge, reverse direction
  if (ballY > (height - ballSize)-100)
  {
    gamePoints += 1;
    ballDirection *= -1;
  }
  if (ballY < ballSize)
  {
    gamePoints += 1;
    ballDirection *= -1;
  }
  
  //Draw ball
  fill(#FF8833);
  ellipse(ballX, ballY, ballSize,ballSize); //posX, posY, sizeX,sizeY
  
  //Draw paddle
  fill(#C2C2C2);
  rect(width-wallDist, padY, padWidth, padHeight);
  
  if (gamePLAY == gameWIN)
  {
    ballPower = 0;
    ballDirection = 0;
    
    fill(#00CC11);
    rect(0,0, width,height);
    
    fill(#FFFFFF);
    textAlign(CENTER);
    text("Congratulations!", width/2,150, width,100);
    text("You did not die!", width/2,200, width,100);
    text("Your score: " + (int)gamePoints, width/2,300, width,100);
    text("Now try to beat that!", width/2,350, width,100);
  }
  if (gamePLAY == gameLOSE)
  {
    ballPower = 0;
    ballDirection = 0;
   
    fill(#E00000);
    rect(0,0, width,height);
    
    fill(#FFFFFF);
    textAlign(CENTER);
    text("Failure!", width/2,150, width,100);
    text("You died!", width/2,200, width,100);
    text("You can do better than that!", width/2,250, width,100);
    text("...", width/2,350, width,100);
    text("Can't you?", width/2,400, width,100);
  }
}


