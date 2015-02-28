
PImage collisionImage;
PImage displayImage;
PImage man, man2, currentMan, fallingMan, fallingMan2, jumpingMan, jumpingMan2;

float playerX = 100;
float playerY = 100;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5;
float playerSize = 40;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = .3;


void setup()
{
  size(500, 500);
  collisionImage = requestImage("level2.png");
  displayImage = requestImage("level2Detail.png");
  man = requestImage("stickman.png");
  man2 = requestImage("stickman2.png");
  currentMan = requestImage("stickman.png");
  fallingMan = requestImage("crushed.png");
  fallingMan2 = requestImage("crushed2.png");
  jumpingMan = requestImage("jump.png");
  jumpingMan2 = requestImage("jump2.png");
}

void draw()
{
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
        int px = (int)(nextX / scaleDiff);
        int py = (int)(playerY / scaleDiff);
        int platformX = x * (int)scaleDiff;
        int platformY = y * (int)scaleDiff;
        if (px == x &&  py == y && red(pixelColor) == 0)
        {
          // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX >= platformX)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }

        px = (int)(playerX / scaleDiff);
        py = (int)(nextY / scaleDiff);
        if (px == x &&  py == y && red(pixelColor) == 0)
        {
          fill(255, 0, 0);

          // moving up and character is currently on the bottom side of the wall
          // commented out to jump up through platforms
          /*if (playerVelocityY < 0  && playerY >= platformY)
           {
           playerVelocityY = 0;
           }*/
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
  if (playerVelocityY<0)
  {
    if (currentMan==man)
    {
      image(jumpingMan, playerX-3, playerY-40, playerSize-10, playerSize);
    }
    else
    {
     image(jumpingMan2, playerX-3, playerY-40, playerSize-10, playerSize);
    }
  }
  if (playerVelocityY<=5 && playerVelocityY>=0)
  {
    image(currentMan, playerX-3, playerY-40, playerSize-30, playerSize);
  }
  if(playerVelocityY>5)
  {
    if (currentMan==man)
    {
      image(fallingMan, playerX-3, playerY-40, playerSize, playerSize-20);
    }
    else
    {
      image(fallingMan2, playerX-3, playerY-40, playerSize, playerSize-20);
    }
  }
  onGround = tempOnGround;
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
      currentMan=man2;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
      currentMan=man;
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
      currentMan=man2;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
      currentMan=man;
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



