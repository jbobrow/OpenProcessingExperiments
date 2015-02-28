
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
    this.frameColumn = 0;
    if (colCount > 0)
    {
      this.frameColumn = (int)this.currentFrame % colCount;
      this.frameRow = (int)this.currentFrame / colCount;
    }
    
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth, 
      this.frameRow * this.frameHeight, 
      this.frameWidth, 
      this.frameHeight);
  }
  
}

AnimatedSpriteObject knight;
AnimatedSpriteObject explosion;

void setup()
{
  size(500,500);
  
  knight = new AnimatedSpriteObject("knight.png");
  knight.x = width/2;
  knight.y = height/2;
  knight.frameWidth = 32;
  knight.frameHeight = 64;
  knight.startFrame = 1;
  knight.endFrame = 5;
  knight.frameSpeed = 6.0; // 6fps
  
  explosion =  new AnimatedSpriteObject("explosion.png");
  explosion.x = 400;
  explosion.y = 400;
  explosion.frameSpeed = 30.0; // 30fps
  explosion.frameWidth = 64;
  explosion.frameHeight = 64;
  explosion.startFrame = 0;  
  explosion.endFrame = 24;
  explosion.scaleX = 2.0;
  explosion.scaleY = 5.0;
}
 
void draw()
{
  background(0);
  
  knight.update();
  knight.render(); 
  
  explosion.update();
  explosion.render(); 
}
 

void keyReleased()
{

  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      knight.startFrame = 7;
      knight.endFrame = 11;
      knight.currentFrame = knight.startFrame;
    }
    if (keyCode == RIGHT)
    {
      // or use the helper function that does the same thing.
      // start, end, looping
      knight.setAnimation(19, 23, true);
    }
    if (keyCode == UP)
    {
      knight.setAnimation(13, 17, true);
    }
    if (keyCode == DOWN)
    {
      knight.startFrame = 1;
      knight.endFrame = 5;
      knight.currentFrame = knight.startFrame;
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



