
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

AnimatedSpriteObject link;

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
 
  link = new AnimatedSpriteObject("link.png");
  link.x = width / 2;
  link.y = height / 2;
  link.frameWidth = 90;
  link.frameHeight = 90;
  link.startFrame = 1;
  link.endFrame = 4;
  link.frameSpeed = 6.0;
   
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("bomb.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.50;
  }
}
 
void draw()
{
  background(0);
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
  link.update();
  link.render();
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[bulletIndex].x = link.x;
    b[bulletIndex].y = link.y;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  } 
}

void keyReleased()
{
    if (keyCode == 'A')
    {
      link.setAnimation(1, 4, true);
    }
    if (keyCode == 'D')
    {
      link.setAnimation(5, 8, true);  
    }
    if (keyCode == 'W')
    {
      link.setAnimation(10, 14, true);
    }
    if (keyCode == 'S')
    {
      link.setAnimation(15, 19, true);
    }
}
void keyPressed()
{
  if (keyCode == 'A')
  {
    link.x -= 3;
  }
  if (keyCode == 'D')
  {
    link.x += 3;
  }
  if (keyCode == 'W')
  {
    link.y += -3;
  }
  if (keyCode == 'S')
  {
    link.y += 3;
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



