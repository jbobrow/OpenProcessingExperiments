
PImage background;
PImage box;
 

Man myMan;
  

boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean spaceKeyPressed = false;


int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
 
void setup()
{
  size(800, 800);
  background = requestImage("background.png");
  box = requestImage("Barrel.png");
    
  myMan = new Man();
    
  myMan.x = 100;
  myMan.y = 400;
    
  myMan.directionX = 0;
  myMan.directionY = 1;
    
  myMan.speed = 3; 
    
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}
  
void draw()
{

  image(background, 0, 0, width, height);
 
  myMan.draw();
  
  if (forwardKeyPressed == false && backwardKeyPressed == false && spaceKeyPressed == false)
  {
    pushMatrix();
    imageMode(CENTER);
    image(box, myMan.x, myMan.y, 80, 80);
    popMatrix();
  }
   
  boolean hitTarget = false;
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
     
    if (dist(700, 400, bullets[i].x, bullets[i].y) < 50)
    {
      hitTarget = true;
    }
  }
  if (hitTarget)
  {
    fill(255, 0, 0);
  }
  ellipse(700, 400, 100, 100);
  fill(255);
}
 
  
void keyPressed()
{
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
      myMan.sprite.setAnimation(0, 2, true);
      spaceKeyPressed = true;
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
      myMan.sprite.setAnimation(0, 2, true);
      spaceKeyPressed = true;
    }
    
     
}
  
void keyReleased()
{
    
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
      myMan.sprite.setAnimation(0, 0, true);
      spaceKeyPressed = false;
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
      myMan.sprite.setAnimation(0, 0, true);
      spaceKeyPressed = false;
    }
     
    if (keyCode == ' ')
  {
    bullets[bulletIndex].x = myMan.x;
    bullets[bulletIndex].y = myMan.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myMan.directionX;
    bullets[bulletIndex].directionY = myMan.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
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
  
 
class Man
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed = 10;
  float directionX;
  float directionY;
  float s = 2.0;
  float T = 0;
   
  AnimatedSprite sprite;
   
  Man()
  {
    this.sprite = new AnimatedSprite("megamansheet.png", 60, 61);
  }
  
  void lookAt (float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }


  void draw()
  {
    if (forwardKeyPressed)
    {
      this.y -= this.directionY * this.speed;
    }
    
    if (backwardKeyPressed)
    {
     this.y += this.directionY * this.speed;
    }
    
     
     
   
   
    // apply transformations
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
     
    // draw and animate the animated sprite
    this.sprite.draw();
     
    popMatrix();
     
    imageMode(CORNER);
    
    if (this.y >= height - 30)
    {
      if (backwardKeyPressed)
      {
       this.speed = 0;
      }
      else
      {
        this.speed = 3;
      }
    }
    
    if (this.y <= 0 + 30)
    {
      if (forwardKeyPressed)
      {
        this.speed = 0;
      }
      else
      {
        this.speed = 3;
      }
    }
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
  float s = -1.0;
  PImage img;
   
  Bullet()
  {
    this.img = requestImage("fire.png");
  }
    
  void draw()
  {
    this.x += this.speed;
     
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



