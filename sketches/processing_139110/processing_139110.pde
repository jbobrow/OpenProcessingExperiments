
Ship myShip;
  
boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
 

int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
 
void setup()
{
  size(1000, 1000);
    
  myShip = new Ship();
 
  myShip.x = 500;
  myShip.y = 850;
    
  
  myShip.directionX = 0;
  myShip.directionY = 1;
    

  myShip.speed = 3;
    
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}
  
void draw()
{
  // Clear the screen
  background(100);
 
  myShip.lookAt(mouseX, mouseY);
  myShip.draw();
   
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
  }
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    bullets[bulletIndex].x = myShip.x;
    bullets[bulletIndex].y = myShip.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myShip.directionX;
    bullets[bulletIndex].directionY = myShip.directionY;
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
      forwardKeyPressed = true;
     
      myShip.sprite.setAnimation(0, 7, true);
    }
    if (key == 's')
    {
      backwardKeyPressed = true;
       
      myShip.sprite.setAnimation(0, 7, true);
    }
}
  
void keyReleased()
{
    if (key == 'w')
    {
      forwardKeyPressed = false;
       
      myShip.sprite.setAnimation(0, 0, true);
    }
    if (key == 's')
    {
      backwardKeyPressed = false;
       
      myShip.sprite.setAnimation(0, 0, true);
    }
}
 
class AnimatedSprite
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
  PImage img;
   
  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    } 
       
    this.loop = looping;
  }
   
  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }
     
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
       
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
   
}
  
 
class Ship
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;
  AnimatedSprite sprite;
   
 Ship()
  {
    this.sprite = new AnimatedSprite("ship.png", 98, 98);
  }
   
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }
   
  void draw()
  {
    if (forwardKeyPressed)
    {
      this.x += this.directionX * this.speed;
      this.y += this.directionY * this.speed;
    }
    // subtract to go backward
    if (backwardKeyPressed)
    {
      this.x -= this.directionX * this.speed;
      this.y -= this.directionY * this.speed;
    }
   
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
    scale(this.s);
     
    this.sprite.draw();
     
    popMatrix();
     
    imageMode(CORNER);
  } 
}

class Bullet
{
  float x = 0.0;
  float y = 0.0;
  float w = 30.0;
  float h = 30.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
   
  Bullet()
  {
    this.img = requestImage("blaster.png");
  }
    
  void draw()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
     
    if (this.img.width > 0)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
       
      imageMode(CORNER);
    }
  }
}


