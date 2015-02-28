
float playerX = 50;
float playerY = 450;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -7;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = .3;

int playstate = 0;

SpriteObject bounty;
SpriteObject slime1;
SpriteObject slime2;
SpriteObject slime3;
SpriteObject slime4;
SpriteObject slime5;
SpriteObject slime6;
SpriteObject slime7;
SpriteObject slime8;
SpriteObject slime9;

PImage titlemenu;
PImage displayImage;
PImage collisionImage;
PImage victory;
PImage defeat;
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
  
  titlemenu = requestImage("titlemenu.png");
  collisionImage = requestImage("level.png");
  displayImage = requestImage("background.png");
  victory = requestImage("victoryscreen.png");
  defeat = requestImage("defeatscreen.png");
  
  bounty = new SpriteObject("bounty_clipped_rev_1.png");
  bounty.x = 450;
  bounty.y = 60;
  bounty.scaleX = .5;
  bounty.scaleY = .5;
  
  slime1 = new SpriteObject("slime1.png");
  slime1.x = 325;
  slime1.y = 500;
  
   slime2 = new SpriteObject("slime2.png");
  slime2.x = 475;
  slime2.y = 405;
  slime2.scaleX = 1;
  slime2.scaleY = 1;
  
   slime3 = new SpriteObject("slime3.png");
  slime3.x = 0;
  slime3.y = 0;
  slime3.scaleX = .5;
  slime3.scaleY = .5;
  
   slime4 = new SpriteObject("slime4.png");
  slime4.x = 0;
  slime4.y = 0;
  
   slime5 = new SpriteObject("slime5.png");
  slime5.x = 0;
  slime5.y = 0;
  
   slime6 = new SpriteObject("slime6.png");
  slime6.x = 140;
  slime6.y = 170;
  slime6.scaleX = .5;
  slime6.scaleY = .5;
  
   slime7 = new SpriteObject("slime7.png");
  slime7.x = 230;
  slime7.y = 140;
  slime7.scaleX = .5;
  slime7.scaleY = .5;
  
   slime8 = new SpriteObject("slime8.png");
  slime8.x = 320;
  slime8.y = 105;
  slime8.scaleX = .5;
  slime8.scaleY = .5;
  
   slime9 = new SpriteObject("slime9.png");
  slime9.x = 0;
  slime9.y = 0;
  
  boba = new AnimatedSpriteObject("boba_clipped_rev_1.png");
  boba.x = width/4;
  boba.y = height/4;
  boba.frameWidth = 38;
  boba.frameHeight = 80;
  boba.startFrame = 1;
  boba.endFrame = 1;
  boba.frameSpeed = 6.0; // 6fps
  boba.scaleX = 1;
  boba.scaleY = 1;
 
  
 
}
void draw()
{
  if (playstate == 0)
  { 
    if (titlemenu.width > 0)
    {
      image(titlemenu, 0, 0, width, height);
    }
  }
   if (playstate == 1)
   {
  fill(0);
  
   if (boba.isOverlapping(bounty) == true)
    {
      playstate = 2;
    }
     if (boba.isOverlapping(slime1) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime2) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime3) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime4) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime5) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime6) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime7) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime8) == true)
    {
      playstate = 3;
    }
    if (boba.isOverlapping(slime9) == true)
    {
      playstate = 3;
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
    bounty.render();
    slime1.render();
    slime2.render();
    slime3.render();
    slime4.render();
    slime5.render();
    slime6.render();
    slime7.render();
    slime8.render();
    slime9.render();
  
  onGround = tempOnGround;
}
if (playstate == 2)
{ 
  if (victory.width > 0)
    {
      image(victory, 250,250);
    }
}
if (playstate == 3)
{ 
  if (defeat.width > 0)
    {
      image(defeat, 250,250);
    }
}
}
  
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == ' ')
    {
      boba.endFrame = 0;
      
    }
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
      boba.startFrame = 9;
      boba.endFrame = 9;
    }
  }
  if (keyCode == ENTER)
   {
    playstate = 1;
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


