
/*
Elizabeth Umbrino
August 7, 2011
Bouncing Ball Homework
*/

PImage myImage;
PImage circle;
PImage blackcircle;
PImage greencircle;

int circleRadius = 10;
int blackcircleRadius = 10;
int greencircleRadius = 10;

float xPos;
float yPos;

float xPosblack;
float yPosblack;

float xPosgreen;
float yPosgreen;

boolean isGoingRightBlack = true;
boolean isGoingDownBlack = true;


boolean isGoingRight = true;
boolean isGoingDown = true;

boolean isGoingRightGreen = true;
boolean isGoingDownGreen = true;

void setup(){
  size(600,400);
  background(0);
  myImage= loadImage("ball pit.jpg");
  circle= loadImage("ball.gif");
  blackcircle= loadImage("blackball.png");
  greencircle= loadImage("green.png");
  greencircle.resize(greencircleRadius*2, greencircleRadius*2);
  circle.resize(circleRadius*2, circleRadius*2);
  blackcircle.resize(blackcircleRadius*2, blackcircleRadius*2);
  xPos = circleRadius;
  yPos = circleRadius;
  xPosblack = blackcircleRadius;
  yPosblack = blackcircleRadius;
  xPosgreen = greencircleRadius;
  yPosgreen = greencircleRadius;
  

  
}

void draw(){
  background(0);
  
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  
//  image(circle, width/2, height/2);
//  image(blackcircle, width/2, height/2);
//  

  image(circle, xPos, yPos);
  image(blackcircle, xPosblack, yPosblack);
  image(greencircle, xPosgreen, yPosgreen);
  
  //x circleRadius direction
  if (isGoingRight) {
    xPos+=3;
  }
  else {
    xPos-=3;
  }
  
  if (xPos + circleRadius >= width)
  isGoingRight=false;
  
  if(xPos - circleRadius <0) {
    isGoingRight = true;
  }
  
  //y circleRadius direction
  if (isGoingDown){
    yPos+=1;
  }
  else {
    yPos-=1;
  }
  
  if (yPos + circleRadius >= height)
  isGoingDown=false;
  
  if (yPos - circleRadius <=0) {
    isGoingDown = true;
  }
  
  //x blackcircleRadius direction
  if (isGoingRightBlack) {
    xPosblack+=5;
  }
  else {
    xPosblack-=5;
  }
  
  if (xPosblack + blackcircleRadius >= width)
  isGoingRightBlack=false;
  
  if(xPosblack - blackcircleRadius <0) {
    isGoingRightBlack = true;
  }
  
  //y blackcircleRadius direction
  if (isGoingDownBlack){
    yPosblack+=1;
  }
  else {
    yPosblack-=1;
  }
  
  if (yPosblack + blackcircleRadius >= height)
  isGoingDownBlack=false;
  
  if (yPosblack - blackcircleRadius <=0) {
    isGoingDownBlack = true;
  }
  
  
  
  
  
  
  
   //x greencircleRadius direction
  if (isGoingRightGreen) {
    xPosgreen+=1;
  }
  else {
    xPosgreen-=1;
  }
  
  if (xPosgreen + greencircleRadius >= width)
  isGoingRightGreen=false;
  
  if(xPosgreen - greencircleRadius <0) {
    isGoingRightGreen = true;
  }
  
  //y blackcircleRadius direction
  if (isGoingDownGreen){
    yPosgreen+=1;
  }
  else {
    yPosgreen-=1;
  }
  
  if (yPosgreen + circleRadius >= height)
  isGoingDownGreen=false;
  
  if (yPosblack - greencircleRadius <=0) {
    isGoingDownGreen = true;
  }
  
  
  
  
  
  
  
  
}

