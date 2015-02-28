
// Here we actually create the variable "myTank" of type Tank
Tank myTank;
PImage dungeon1;
  
// We use these variables both to keep track of whether a key is pressed down
boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean leftKeyPressed = false;
boolean rightKeyPressed = false;
 
// Bullet variables
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
 
void setup()
{
  size(800, 800);
  
  dungeon1 = requestImage("dungeon.jpg");
    
  myTank = new Tank();
    
  // Set the spawn position.
  myTank.x = 200;
  myTank.y = 200;
    
  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myTank.directionX = 0;
  myTank.directionY = 1;
    
  // Speed of forward and back movement (how many pixels to move each frame)
  myTank.speed = 3;
    
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
  image(dungeon1, 0, 0, width, height);
 
 
  myTank.draw();
   
   boolean hitMonster = false;
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
    
    if(dist(100, 100, bullets[i].x, bullets[i].y) < 60)
    {
      hitMonster = true;
  }
}

if (hitMonster)
{
  fill(255, 0, 0);
}
rectMode (CENTER);
rect(100, 100, 100, 100);
fill(255);
}    
  
void keyPressed()
{
    // We set forwardKeyPressed and backwardKeyPressed to true or false instead of setting
    // myTank position and rotation directly here. This allows us to have smooth
    // movement. Otherwise holding down a key only gets caled every second or so
    // and creates jerky movement because of Windows 7/Mac key repeat.
    // To get smooth movement you need to keep track of the states yourself.
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
       
      // start tank animation from fram 0->7
      myTank.sprite.setAnimation(6, 11, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
       
      // start tank animation from fram 0->7
      myTank.sprite.setAnimation(0, 5, true);
    }
    
    if (keyCode == LEFT)
    {
      leftKeyPressed = true;
      
      myTank.sprite.setAnimation(12,17,true);
    }
    
    if (keyCode == RIGHT)
    {
      rightKeyPressed = true;
      
      myTank.sprite.setAnimation(18,23,true);
}
}
  
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(6, 6, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(0, 0, true);
    }
        if (keyCode == RIGHT)
        {
          rightKeyPressed = false;
          
          myTank.sprite.setAnimation(12, 12, true);
        }
        if (keyCode == LEFT)
        {
          leftKeyPressed = false;
          
         myTank.sprite.setAnimation (18, 18, true);
    
    
}
    if (key == ' ')
    {
    bullets[bulletIndex].x = myTank.x;
    bullets[bulletIndex].y = myTank.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myTank.directionX;
    bullets[bulletIndex].directionY = myTank.directionY;
    bulletIndex += 1;
    }
    
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
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
       
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
   
}
  
 
class Tank
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;
   
  // Tank has an animated sprite
  AnimatedSprite sprite;
   
  Tank()
  {
    // 32 is the size of one frame in the 256x256 image
    this.sprite = new AnimatedSprite("kid.png", 32, 64);
  }
   
  // function to point tank at a position
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
      this.y -= this.speed;
      this.directionX = 0;
      this.directionY= -1;
    }
    // subtract to go backward
    else if (backwardKeyPressed)
    {
      this.y += this.speed;
            this.directionX = 0;
      this.directionY= 1;
    }
    else if (rightKeyPressed)
    {
      this.x += this.speed;
            this.directionX = 1;
      this.directionY= 0;
    }
    else if (leftKeyPressed)
    {
      this.x -= this.speed;
            this.directionX = -1;
      this.directionY= 0;
    }


   
    // apply transformations
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
    scale(this.s);
     
    // draw and animate the animated sprite
    this.sprite.draw();
     
    popMatrix();
     
    imageMode(CORNER);
  } 
}
 
// Bullet Class
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
    this.img = requestImage("powerball.png");
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



