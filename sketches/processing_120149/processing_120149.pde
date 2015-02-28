
PImage collisionImage;
PImage displayImage;
PImage jangoFett;

float playerX = 100;
float playerY = 100;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = .3;
 
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
 
 
 
void setup()
{
  size(500, 500);
  collisionImage = requestImage("level.png");
  displayImage = requestImage("levelDetail.png");
  jangoFett = requestImage("jangoFett.jpg");  
}
 
void draw()
{
  background(255); 
  fill(0);
 
  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;
   
  boolean tempOnGround = false;
  if (collisionImage.width > 0)
  {
    image(collisionImage, 0, 0, width, height);
    if (displayImage.width > 0)
    {
     image(displayImage, 0, 0, width, height);
    }
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      {
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
        float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
        float px = nextX;
        float py = playerY;
        float platformX = x * (int)scaleDiff;
        float platformY = y * (int)scaleDiff;
        float tileSize = 10;
        float playerSize = 10;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) == true && red(pixelColor) == 0)
        {
          // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX >= platformX + tileSize)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
         
        px = playerX;
        py = nextY;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) && red(pixelColor) == 0)
        {
          fill(255, 0, 0);
           
           // moving up and character is currently on the bottom side of the wall
           // commented out to jump up through platforms
          if (playerVelocityY < 0  && playerY >= platformY + tileSize)
          {
            playerVelocityY = 0;
          }
          // moving down and character is currently on the top side of the wall
           if (playerVelocityY > 0 && playerY < platformY)
          {
            playerVelocityY = 0;
            tempOnGround = true;
          }
        }
      }
    }
  }
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  image(jangoFett, playerX, playerY, playerSize, playerSize); 
  // rect(playerX, playerY, playerSize, playerSize);
  onGround = tempOnGround;
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
  if (key == ' ')
  {
    gravity = .3; 
  }
}
  
void keyPressed()
{
  if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY = playerJumpSpeed;
      gravity = 0;
   
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



