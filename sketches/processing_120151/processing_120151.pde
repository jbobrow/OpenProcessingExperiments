


AnimatedSpriteObject explosion, player;
boolean up = false, down = true, left = false, right = false, explode = false;


void setup()
{
  size(600, 600);
  explosion = new AnimatedSpriteObject("explosionSheet.png");
  explosion.frameWidth = 115;
  explosion.frameHeight = 95;
  explosion.setAnimation(0, 11, false);
  
  player = new AnimatedSpriteObject("doomSoldierSprite.png");
  player.frameWidth = 60;
  player.frameHeight = 68;
  player.setAnimation(0, 3, true);
}

void draw()
{
  rect(0, 0, width, height);
  player.update();
  player.x = width/2;
  player.y = height/2;
  
  if(explode)
  {
    explosion.update();
    explosion.render();
  }
  
  player.render();
  
  
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      player.setAnimation(16, 19, true);
      up = true;
      down = false;
      left = false;
      right = false;
    }
    if(keyCode == DOWN)
    {
      player.setAnimation(0, 3, true);
      up = false;
      down = true;
      left = false;
      right = false;
    }
    if(keyCode == RIGHT)
    {
      player.setAnimation(24, 27, true);
      up = false;
      down = false;
      left = false;
      right = true;
    }
    if(keyCode == LEFT)
    {
      player.setAnimation(8, 11, true);
      up = false;
      down = false;
      left = true;
      right = false;
    }
  }
  
  if(key == ' ')
  {
    if(up)
    {
      player.setAnimation(20, 22, false);
      explosion.setAnimation(0, 14, false);
      explosion.x = width / 2;
      explosion.y = 100;
      explode = true;
    }
    else if(down)
    {
      player.setAnimation(4, 6, false);
      explosion.setAnimation(0, 14, false);
      explosion.x = width / 2;
      explosion.y = 500;
      explode = true;
    }
    else if(left)
    {
      player.setAnimation(12, 14, false);
      explosion.setAnimation(0, 14, false);
      explosion.x = 100;
      explosion.y = height / 2;
      explode = true;
    }
    else if(right)
    {
      player.setAnimation(28, 30, false);
      explosion.setAnimation(0, 14, false);
      explosion.x = 500;
      explosion.y = height / 2;
      explode = true;
    }
  }
}
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



