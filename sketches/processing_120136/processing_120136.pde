
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
   
   void setAnimation (int start, int end, boolean looping)
   {
     this.startFrame = start;
     this.endFrame = end;
     this.currentFrame = this.startFrame;
     this.loop = looping;  
   }
   
  void update()
  {
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

    this.rotation = degrees(atan2(mouseY-this.y, mouseX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
     
    this.y += (up - down) * this.directionY * this.speed;
    this.x += (up - down) * this.directionX * this.speed;
  }
}
 
 
AnimatedSpriteObject knight;

 
// Bullet Class
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
 
float up;
float down;
 
void setup()
{
  size(500, 500);
 
  knight = new AnimatedSpriteObject("knight.png");
  knight.x = width/2;
  knight.y = height/2;
  knight.frameWidth = 32;
  knight.frameHeight = 64;
  knight.startFrame = 1;
  knight.endFrame = 5;
  knight.frameSpeed = 6.0; // 6fps

  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("Fireball.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].scaleX = 0.25;
    b[i].scaleY = 0.25;
  }
}
 
void draw()
{
  background(0);
  knight.update();
  knight.render();
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[bulletIndex].x = knight.x;
    b[bulletIndex].y = knight.y;
    b[bulletIndex].speed = 10;
    b[bulletIndex].directionX = knight.directionX;
    b[bulletIndex].directionY = knight.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  } 
}
 
void keyPressed()
{
    if (key == 'w')
    {
      up = 5;
    }
    if (key == 's')
    {
      down = 5;
    }
}
   
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (key == 'w')
    {
      up = 0;
    }
    if (key == 's')
    {
      down = 0;
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



