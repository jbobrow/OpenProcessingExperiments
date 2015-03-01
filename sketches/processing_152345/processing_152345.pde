
/* @pjs preload="http://www.happilyeverafterinvesting.com/wp-content/uploads/2009/03/starry-sky.png"; */

int playerXPos = 100;
int playerYPos = 400;
int playerXSpeed = 1;
int playerXSpeedAcc = 1;
int playerXSpeedMax = 5;
int playerYSpeed = 1;
int playerWidthHalf = 20;
int playerHeight = 25;

int gameAreaWidth = 430;
int gameAreaHeight = 279;

//background
PImage backGroundGameArea; 

void setup() {  //setup function called initially, only once
  size(gameAreaWidth , gameAreaHeight );
  //background(20);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  
  backGroundGameArea = loadImage("starry-sky.png","png");
  println("test: " + backGroundGameArea.height);
}

void draw() 
{  
//draw function loops 
  updatePositions();
  drawBackground();
  drawPlayer();
}

void updatePositions()
{
    playerXPos += playerXSpeed;
    updatePositionsFixPlayerOutofbounds();
}

void updatePositionsFixPlayerOutofbounds()
{
    if (playerXPos > gameAreaWidth)
    {
        playerXPos = 0;
    }
    else if (playerXPos < 0)
    {
        playerXPos  = gameAreaWidth;
    }
    else
    {
     
    }
}

void drawPlayer() 
{
    //draw the player object
    fill(60,255,120);
    triangle(playerXPos,playerYPos,playerXPos - playerWidthHalf,playerYPos+playerHeight,playerXPos + playerWidthHalf,playerYPos+playerHeight);
}

void drawBackground()
{
   //background(100);
   background(backGroundGameArea);
   
}

void keyPressed()
{
    println('keyPressed at ' + str(second()) + '. Value = ' + int(key));
     
     if(key =='a' || key =='A')
     {
         //accelerate left
         playerXSpeed-=playerXSpeedAcc;
         
         //if more than -maxspeed, set to -max
         if (playerXSpeed < -playerXSpeedMax)
         {
             playerXSpeed = -playerXSpeedMax;
         }
             
     }
     if(key =='d' || key =='D')
     {
         //accelerate right
         playerXSpeed+=playerXSpeedAcc;
         
         //if more than maxspeed, set to max
         if (playerXSpeed > playerXSpeedMax)
         {
             playerXSpeed = playerXSpeedMax;
         }    
     }
   
}
