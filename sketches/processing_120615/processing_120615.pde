



// Player data
float playerX = 200;
float playerY = 100;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -10;
float playerSize = 30;
boolean onGround = true;
float gravity = .3;
PImage shepard;
 
// Input data
float upKey;
float rightKey;
float downKey;
float leftKey;
 
// Only used for collision, not drawn
PImage collisionImage;
 
// Only drawn
PImage displayImage;
 
// function to check if two rects overlapping
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
 
void setup()
{
  size(500, 500);
  collisionImage = requestImage("level.png");
  displayImage = requestImage("levelDetail.png");
  shepard = requestImage("minishepard.fw.png");
}
 
void draw()
{
  fill(0);
   
  // Add gravity to velocityY each frame so if we jump we eventually start moving down faster and faster
  playerVelocityY += gravity;
   
  // Use the input multiplied by speed to get the velocityX
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
   
  // Temporary variables to check if using these velocites would cause collision
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;
   
  onGround = false;
  if (collisionImage.width > 0)
  {
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      {
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
     
        float platformSize = 10;
        float platformX = x * platformSize;
        float platformY = y * platformSize;
         
        boolean collided = isRectOverlapping(nextX, playerY, nextX + playerSize, playerY + playerSize,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
           
        if (collided == true && red(pixelColor) == 0)
        {
           // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX >= platformX + platformSize)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
         
        collided = isRectOverlapping(playerX, nextY, playerX + playerSize, nextY + playerSize,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
        
           
        if (collided == true && red(pixelColor) == 0)
        {
          // top
          if (playerVelocityY > 0 && playerY < platformY)
          {
            playerVelocityY = 0;
            onGround = true;
          }
          // bottom
          if (playerVelocityY < 0 && playerY > platformY + platformSize)
          {
            playerVelocityY = 0;
          }
        }
      }
    }
  }
 
  if (displayImage.width > 0)
  {
    imageMode(CORNER);
    image(displayImage, 0, 0, width, height);
  }
 
  playerX += playerVelocityX;
  playerY += playerVelocityY;
 
  image(shepard,playerX, playerY, playerSize, playerSize);
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
 


