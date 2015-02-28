
PImage collisionImage;
PImage displayImage;

float playerX = 100;
float playerY = 100;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -8;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = .3;

SpriteObject playerChar; 
 
void setup()
{
  size(500, 500);
  collisionImage = requestImage("levelv2.png");
  displayImage = requestImage("level.jpg");
  playerChar = new SpriteObject("garu.jpg");
  playerChar.x = playerX;
  playerChar.y = playerY;
  playerChar.speed = playerSpeed;
  playerChar.s = 0.2;
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
    imageMode(CORNER);
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
        int xx = (int)(nextX / scaleDiff);
        int yy = (int)(playerY / scaleDiff);
        int platformX = x * (int)scaleDiff;
        int platformY = y * (int)scaleDiff;
        if (xx == x &&  yy == y && red(pixelColor) < 240)
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
         
        xx = (int)(playerX / scaleDiff);
        yy = (int)(nextY / scaleDiff);
        if (xx == x &&  yy == y && red(pixelColor) < 240)
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
//  rectMode(CENTER);
//  rect(playerX, playerY, playerSize, playerSize);
  playerChar.x = playerX;
  playerChar.y = playerY;
  playerChar.render();
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

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  
    boolean isMouseOver()
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y + h)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  boolean isOverlappingMouse()
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
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
    
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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



