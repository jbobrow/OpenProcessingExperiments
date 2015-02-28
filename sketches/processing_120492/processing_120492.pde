

//map
PImage collisionImage;
PImage displayImage;

//player
PImage RStand, LStand, RMove, LMove, RLand, LLand, RJump, LJump;
PImage URStand, ULStand, URMove, ULMove, URLand, ULLand, URJump, ULJump;
PImage currentMan;

float playerX = 100;
float playerY = 100;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 1.5;
float playerJumpSpeed = -10;
float playerSize = 100;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = 0.3;


void setup()
{
  
  size(500, 500);
  
  collisionImage = requestImage("level.png");
  displayImage = requestImage("levelDetail.png");
  
  RStand = requestImage("JmanRightBot.png");
  LStand = requestImage("JmanLeftBot.png");
  RMove = requestImage("JmanRightMotionBot.png");
  LMove = requestImage("JmanLeftMotionBot.png");
  RLand = requestImage("JmanRightLandBot.png");
  LLand = requestImage("JmanLeftLandBot.png");
  RJump = requestImage("JmanRightJumpAirBot.png");
  LJump = requestImage("JmanLeftJumpAirBot.png");
  
  URStand = requestImage("JmanRightTop.png");
  ULStand = requestImage("JmanLeftTop.png");
  URMove = requestImage("JmanRightMotionTop.png");
  ULMove = requestImage("JmanLeftMotionTop.png");
  URLand = requestImage("JmanRightLandTop.png");
  ULLand = requestImage("JmanLeftLandTop.png");
  URJump = requestImage("JmanRightJumpAirTop.png");
  ULJump = requestImage("JmanLeftJumpAirTop.png");
  
  currentMan = requestImage("JmanRightBot.png");


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
    
    for(int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width; x += 1)
      {
        
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
        float scaleDiff = width / collisionImage.width;
        int px = (int) (nextX / scaleDiff);
        int py = (int) (playerY / scaleDiff);
        int platformX = x * (int)scaleDiff;
        int platformY = y * (int)scaleDiff;
        
        if (px == x && py == y && red(pixelColor) == 0)
        {
          if (playerVelocityX < 0 && playerX >= platformX)
          {
            playerVelocityX = 0;
          }
          
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
        
        px = (int) (playerX / scaleDiff);
        py = (int) (nextY / scaleDiff);
        
        if (px == x && py == y && red(pixelColor) == 0)
        {
          fill(255, 0, 0);
          
          /*if (playerVelocityY < 0 && playerY >= platformY)
          {
            playerVelocityY = 0;
          }*/
          
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
  
  if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX-3, playerY-40, playerSize-10, playerSize);
    }
    else
    {
      image(LJump, playerX-3, playerY-40, playerSize-10, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX-3, playerY-40, playerSize-30, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX-3, playerY-40, playerSize, playerSize-20);
    }
    else
    {
      image(ULJump, playerX-3, playerY-40, playerSize, playerSize-20);
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
      currentMan = LStand;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
      currentMan = RStand;
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
      currentMan = LMove;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
      currentMan = RMove;
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


class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  boolean dead = false;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
      
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
         
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
        
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
   
     
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
         
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

  
  


