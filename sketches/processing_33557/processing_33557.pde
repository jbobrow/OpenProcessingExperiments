
/* PSEUDOCODE ->  BALL BOUNCING */

float ballCenterX = 15;
float ballCenterY = 30;
float ballMoveX = 1;
float ballMoveY = 1;

float ball2CenterX = 300;
float ball2CenterY = 30;
float ball2MoveX = -1;
float ball2MoveY = 1;

PImage bg;

/*int ball2CenterX = 20;
int ball2CenterY = 40;
int ball2MoveX = 10;
int ball2MoveY = 10;*/

void setup() {
  size(400, 300);
  background(255);
  bg = loadImage("IceHockeyRink good.jpg");
  smooth();
  frameRate(50);
  
}

void draw() {
  colorMode(RGB);
  image(bg, 0, 0);
 
  if((ballCenterX<=10)||(ballCenterX>=390)){  //test to see if ball is on boundary
    ballMoveX = ballMoveX*(-1);
  }
  if((ballCenterY<=10)){
    ballMoveY = ballMoveY*(-1);
  }
  
  if(ballCenterY>=290){
    ballMoveY = ballMoveY*(-1);
    
  }

  if((ball2CenterX<=10)||(ball2CenterX>=390)){  //test to see if ball is on boundary
    ball2MoveX = ball2MoveX*(-1);
  }
  if((ball2CenterY<=10)){
    ball2MoveY = ball2MoveY*(-1);
  }
  
  if(ball2CenterY>=290){
    ball2MoveY = ball2MoveY*(-1);
    
  }
  
 fill(250,103,20); 
    ellipse(ballCenterX, ballCenterY, 20, 20); //draw circle
  ballCenterX = ballCenterX + ballMoveX;
  ballCenterY = ballCenterY + ballMoveY;
    
  fill(0,223,100);
  ellipse(ball2CenterX, ball2CenterY, 20, 20); //draw circle
  ball2CenterX = ball2CenterX + ball2MoveX;
  ball2CenterY = ball2CenterY + ball2MoveY;
  
  if (ballMoveY > 0){
  
}
}


