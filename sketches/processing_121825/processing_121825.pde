
PImage collisionImage;
PImage displayImage;
float playerX = 25;
float playerY = 0;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -3;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround = false;
float gravity = .3;
 
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


void setup()
{
  size(500, 500);
  //collisionImage = requestImage("PlatformerDetail.png");
  displayImage = requestImage("PlatformerDetail.png");
   
}
 
void draw()
{
  //System.out.println(onGround);
  if(playerY < 450 && !(isRectOverlapping(400, 400, 445, 420, playerX, playerY, playerX + playerSize, playerY + playerSize))){
  fill(0);
  if(isRectOverlapping(25, 25, 75, 50, playerX, playerY, playerX + playerSize, playerY + playerSize) || isRectOverlapping(100, 100, 120, 125, playerX, playerY, playerX + playerSize, playerY + playerSize) 
  || isRectOverlapping(130, 150, 145, 165, playerX, playerY, playerX + playerSize, playerY + playerSize) || isRectOverlapping(100, 100, 120, 125, playerX, playerY, playerX + playerSize, playerY + playerSize) 
  || isRectOverlapping(175, 180, 225, 195, playerX, playerY, playerX + playerSize, playerY + playerSize) || isRectOverlapping(225, 275, 265, 290, playerX, playerY, playerX + playerSize, playerY + playerSize)
 || isRectOverlapping(300, 280, 15, 25, playerX, playerY, playerX + playerSize, playerY + playerSize) || isRectOverlapping(350, 320, 380, 335, playerX, playerY, playerX + playerSize, playerY + playerSize))
 {
    if(onGround == false)
    {
      playerVelocityY = 0;
    }
   onGround = true;
  }
  
  else
  {
    playerVelocityY += gravity;
    onGround = false;
  }
  
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;
   
  boolean tempOnGround = false;
    if (displayImage.width > 0)
    {
      image(displayImage, 0, 0, width, height);
    }
  
  fill(0);
  rect(25, 25, 50, 25);
  rect(100, 100, 20, 25);
  rect(130, 150, 15, 15);
  rect(175, 180, 50, 15);
  rect(225, 275, 40, 15);
  //rect(300, 280, 15, 25);
  rect(350, 320, 30, 15);
  rect(400, 400, 45, 20);
  noFill();
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  fill(0);
  rect(playerX, playerY, playerSize, playerSize);
  noFill();
 // onGround = tempOnGround;
  }
  
  else if( playerY > 450)
  {
       textSize(50);
       fill(#FF0000);
       text("GAME OVER", 150, 250);
       noFill();
    }
  else if(isRectOverlapping(400, 400, 445, 420, playerX, playerY, playerX + playerSize, playerY + playerSize))
  {
     textSize(50);
       fill(#03DBFF);
       text("VICTORY", 150, 250);
       noFill();
  }
    
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == ' ')
  {
    if (onGround == true)
    {
    playerVelocityY = playerJumpSpeed;
    //onGround = false;
    }
  }
    
    
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }
}



