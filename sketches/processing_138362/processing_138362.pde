
// Here we actually create the variable "myTank" of type Tank
Tank myTank;
  
// We use these variables both to keep track of whether a key is pressed down
boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean leftKeyPressed = false;
boolean rightKeyPressed = false;
PImage room;
PImage yarnBall;
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
 
// Bullet variables
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
 
void setup()
{
  yarnBall = requestImage("yarnball.png"); 
  room = requestImage("livingRoom.jpg");
  size(640, 399);
    
  myTank = new Tank();
    
  // Set the spawn position.
  myTank.x = 300;
  myTank.y = 300;
    
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
  image(room,0,0,640,399);
 
  //myTank.lookAt(mouseX, mouseY);
  myTank.draw();
  image(yarnBall,400,300,30,30);
   
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
  }
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    bullets[bulletIndex].x = myTank.x;
    bullets[bulletIndex].y = myTank.y;
    bullets[bulletIndex].speed = 6;
    bullets[bulletIndex].directionX = myTank.directionX;
    bullets[bulletIndex].directionY = myTank.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  }
}
  
void keyPressed()
{
    // We set forwardKeyPressed and backwardKeyPressed to true or false instead of setting
    // myTank position and rotation directly here. This allows us to have smooth
    // movement. Otherwise holding down a key only gets caled every second or so
    // and creates jerky movement because of Windows 7/Mac key repeat.
    // To get smooth movement you need to keep track of the states yourself.
    
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        forwardKeyPressed = true;
       
        // start tank animation from fram 0->7
        myTank.sprite.setAnimation(9, 11, true);
      }
      if (keyCode == DOWN)
      {
        backwardKeyPressed = true;
       
        // start tank animation from fram 0->7
        myTank.sprite.setAnimation(0, 2, true);
      }
       if (keyCode == LEFT)
      {
        leftKeyPressed = true;
       
        // start tank animation from fram 0->7
        myTank.sprite.setAnimation(3, 5, true);
        left = true;
      }
       if (keyCode == RIGHT)
      {
        rightKeyPressed = true;
       
        // start tank animation from fram 0->7
        myTank.sprite.setAnimation(6, 8, true);
      }
    }
}
  
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      forwardKeyPressed = false;
      backwardKeyPressed = false;
      rightKeyPressed = false;
      left = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == RIGHT)
    {
      forwardKeyPressed = false;
      backwardKeyPressed = false;
      leftKeyPressed = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == UP)
    {
      backwardKeyPressed = false;
      rightKeyPressed = false;
      leftKeyPressed = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == DOWN)
    {
      rightKeyPressed = false;
      forwardKeyPressed = false;
      leftKeyPressed = false;
       
      // stop tank animation
      myTank.sprite.setAnimation(0, 0, true);
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
    this.sprite = new AnimatedSprite("galleryanimals.png", 32, 32);
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
      this.x += this.directionX * this.speed;
      this.y += this.directionY * this.speed;
    }
    // subtract to go backward
    if (backwardKeyPressed)
    {
      this.x -= this.directionX * this.speed;
      this.y -= this.directionY * this.speed;
    }
    if (rightKeyPressed)
    {
      this.x -= this.directionX * this.speed;
      this.y -= this.directionY * this.speed;
    }
   if (leftKeyPressed)
    {
      this.x -= this.directionX * this.speed;
      this.y -= this.directionY * this.speed;
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
    this.img = requestImage("claws.png");
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



