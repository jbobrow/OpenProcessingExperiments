
float playerX = 250;
float playerY = 250;
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

PImage displayImage;
PImage collisionImage;
class AnimatedSpriteObject extends SpriteObject
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
   
  AnimatedSpriteObject(String filename)
  {
    super(filename);
    this.spriteSheet = this.img;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
  }
   
  void update()
  {
    // Increment currentFrame by the frameRate related to current fps)
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }
     
    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
  }
   
}

class Bullet extends SpriteObject
{
  Bullet(String filename)
  {
    super(filename);
  }
     
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}
int bulletCount = 10;
Bullet[] b = new Bullet[bulletCount];
int bulletIndex = 0;

AnimatedSpriteObject boba;
AnimatedSpriteObject bobaleft;

 
void setup()
{
  size(500,500);
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("missle.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].scaleX = 0.25;
    b[i].scaleY = 0.25;
  }
  
  collisionImage = requestImage("level.png");
  displayImage = requestImage("level.png");
  
  boba = new AnimatedSpriteObject("boba.png");
  boba.x = width/4;
  boba.y = height/4;
  boba.frameWidth = 34;
  boba.frameHeight = 70;
  boba.startFrame = 1;
  boba.endFrame = 1;
  boba.frameSpeed = 6.0; // 6fps
  boba.scaleX = 0.5;
  boba.scaleY = 0.5;
 
}
void draw()
{
  fill(0);
  
 for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
  
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
        if (xx == x &&  yy == y && red(pixelColor) == 0)
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
          
        xx = (int)(playerX / scaleDiff);
        yy = (int)(nextY / scaleDiff);
        if (xx == x &&  yy == y && red(pixelColor) == 0)
        {
          fill(255, 0, 0);
            
 
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
  rectMode(CENTER);
  boba.x = playerX;
  boba.y = playerY;
   
    boba.update();
    boba.render();
  
  onGround = tempOnGround;
}
  
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
      boba.startFrame = 4;
 
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
      boba.startFrame = 0;
 
    }
    if (keyCode == UP)
    {
      b[bulletIndex].x = boba.x;
    b[bulletIndex].y = boba.y;
    b[bulletIndex].speed = 10;
    b[bulletIndex].directionX = playerX; 
    b[bulletIndex].directionY = playerY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
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
     boba.setAnimation(4, 7, true);
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
      boba.setAnimation(0, 3, true);
    }
    if (keyCode == UP)
    {
      upKey = 1;
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
  float scaleX = 1.0;
  float scaleY = 1.0;
  PImage img;
  boolean loaded = false;
        
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
       
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.scaleX))
      && mouseX < (this.x + (this.w * 0.5 * this.scaleX))
      && mouseY > (this.y - (this.h * 0.5 * this.scaleY))
      && mouseY < (this.y + (this.h * 0.5 * this.scaleY)))
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
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);
          
    float otherLeft = other.x - (other.w * 0.5 * other.scaleX);
    float otherRight = other.x + (other.w * 0.5 * other.scaleX);
    float otherTop = other.y - (other.h * 0.5 * other.scaleY);
    float otherBottom = other.y + (other.h * 0.5 * other.scaleY);
          
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
     
  void update()
  {
    if (this.x > width - (this.w * this.scaleX * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.scaleX * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.scaleY * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.scaleY * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
     
 
        
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
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


