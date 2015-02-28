
/*
@autor Ziqu Zou, 08/01/2013, Homework3.0-Moving ball
*/

int ballPosX; //ball's X position 
int ballPosY; //ball's Y position 
int ballW;

int boardPosX;
int boardPosY;
int boardW;
int boardY;

int boardPos2X;
int boardPos2Y;
int board2W;
int board2Y;

int speedX;
int speedY;//speed of ball
int backGroundColor;//backgroundcolor

void setup() {
  size(500, 500);
  background(0);

  ballW=30;
  ballPosX=int(random(0, width));
  ballPosY=height/2;
  
  boardW=120;
  boardY=20;
  
  
  
  
  speedX=6;
  speedY=6;

  fill(255);
}

void draw() {

  background(backGroundColor);


  ellipse(ballPosX, ballPosY, ballW, ballW);

  ballPosX+=speedX;
  ballPosY+=speedY;

  if (ballPosX<15||ballPosX>(width-15)) //hit test
  {
    /*
    if (ballPosX<25)
    {
      backGroundColor=0;
      fill(255);
    }
    else if (ballPosX>(width-15)) {
      backGroundColor=255;
      fill(255, 0, 0);
    }
    */
    
    speedX=speedX*-1;
    print("hit L&R");
    
    //Draw Board
    
  }
 
 /* 
  if (ballPosY<15)//||ballPosY>(height-15)
  {
    speedY=speedY*-1;
    print("hit T&D");
  }
 */ 
  
  if(ballPosY>(height-20-15)&&ballPosX>mouseX-60&&ballPosX<mouseX+60)//<(mouseX-boardW/2)&&ballPosX>(mouseX-boardW/2)
  {
    print("hit boardB");
    speedY=speedY*-1;
  }
  
  if(ballPosY<boardY+15&&ballPosX>mouseX-60&&ballPosX<mouseX+60)//<(mouseX-boardW/2)&&ballPosX>(mouseX-boardW/2)
  {
    print("hit boardT");
    speedY=speedY*-1;
  }
  
  if(ballPosY>=height+15)
  {
    ballPosX=int(random(0, width));
    ballPosY=height/2;
  }
  
    
    
    boardPosX=mouseX-boardW/2;
    boardPosY=height-boardY;
    rect(boardPosX,boardPosY,boardW,boardY);
    
    boardPosX=mouseX-boardW/2;
    boardPosY=0;
    rect(boardPosX,boardPosY,boardW,boardY);
}



