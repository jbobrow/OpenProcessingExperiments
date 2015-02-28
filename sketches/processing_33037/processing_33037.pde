
/* PSEUDOCODE ->  BALL BOUNCING */

float ballCenterX = 20;
float ballCenterY = 289.9;
float ballMoveX = 10;
float ballMoveY = -30;

float ball2CenterX = 350;
float ball2CenterY = 289.9;
float ball2MoveX = -8;
float ball2MoveY = -60;

int time = 0;
int time2 = 0;
float gravity = .008;

PImage bGround;
PImage ball1;
PImage ball2;

void setup() {
  size(400, 300);
  background(255);
  smooth();
  frameRate(100);
  
  bGround = loadImage("bGround.jpg");
  ball1 = loadImage("ball1.png");
  ball2 = loadImage("ball2.png");
  
}

void draw() {
  image(bGround, 0, 0);
  fill(0);
  
  //BALL 1
  if(ballCenterX<=10){  //test to see if ball is on left boundary
    ballCenterX = 10.1; //move ball just right of left boundary to avoid being trapped beyond boundary
    ballMoveX = ballMoveX*(-1); //change x-direction of ball 
  }
    
  if(ballCenterX>=390){ //same as above but right boundary
    ballCenterX = 389.9;
    ballMoveX = ballMoveX*(-1);
  }
   
  if((ballCenterY<=10)){ //test to see if ball is on top boundary
    ballCenterY=10.1;
    ballMoveY=ballMoveY*(-1);
    
  }
  if(ballCenterY>=290){ //when ball passes the bottom boundary
    ballCenterY=289.9;
    ballMoveY = ballMoveY*(-.3); //simulate dampening of vertical rebound on impact
    ballMoveX = ballMoveX*(.7); //simulate friction in the horizontal direction
    time=0;
  }
  
  if(ballMoveX<.15&&ballMoveX>(-.15)){ //end vertical vibration of ball once its magnitude gets small enough
    ballMoveY = 0.001;
  }
  
  if(ballMoveX<(.11)&&ballMoveX>(-.11)){ //end horizontal movement of ball once its magnitude gets small enough
  ballMoveX = 0;
  }
  
  image(ball1, ballCenterX-10, ballCenterY-10); //load image of ball 1
  ballCenterX = ballCenterX + ballMoveX;
  ballCenterY = ballCenterY + ballMoveY;
  
  ballMoveY = ballMoveY + gravity*time;
 
  time++;
  
   //BALL 2
  if(ball2CenterX<=20){  //test to see if ball is on left boundary
    ball2CenterX = 20.1; //move ball just right of left boundary to avoid being trapped beyond boundary
    ball2MoveX = ball2MoveX*(-1); //change x-direction of ball 
  }
    
  if(ball2CenterX>=380){ //same as above but right boundary
    ball2CenterX = 379.9;
    ball2MoveX = ball2MoveX*(-1);
  }
   
  if((ball2CenterY<=10)){ //test to see if ball is on top boundary
    ball2CenterY=10.1;
    ball2MoveY=ball2MoveY*(-1);
    
  }
  if(ball2CenterY>=280){ //when ball passes the bottom boundary
    ball2CenterY=279.9;
    ball2MoveY = ball2MoveY*(-.3); //simulate dampening of vertical rebound on impact
    ball2MoveX = ball2MoveX*(.7); //simulate friction in the horizontal direction
    time2=0;
  }
  
  if(ball2MoveX<.15&&ball2MoveX>(-.15)){ //end vertical vibration of ball once its magnitude gets small enough
    ball2MoveY = 0.001;
  }
  
  if(ball2MoveX<(.11)&&ball2MoveX>(-.11)){ //end horizontal movement of ball once its magnitude gets small enough
  ball2MoveX = 0;
  } 
  
  image(ball2, ball2CenterX-20, ball2CenterY-20); //load ball 2
  ball2CenterX = ball2CenterX + ball2MoveX;
  ball2CenterY = ball2CenterY + ball2MoveY;
  
  ball2MoveY = ball2MoveY + gravity*time2;
  
  time2++;
  
}



