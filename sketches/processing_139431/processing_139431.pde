
//http://www.openprocessing.org/sketch/134436
Cat myCat;
Balloon myBalloon;
Littlem myLittlem;

boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean rightKeyPressed = false;
boolean leftKeyPressed = false;
 
// Bullet variables
//int bulletCount = 10;
//Bullet[] bullets = new Bullet[bulletCount];
//int bulletIndex = 0;

PImage grass;
PImage cat;
PImage balloon;
 
void setup()
{
  size(400, 400);
  grass = requestImage ("grass.jpg");
  
  myCat = new Cat();
  myBalloon = new Balloon();
  myLittlem = new Littlem();
    
  
  myCat.x = 200;
  myCat.y = 200;
    
  myCat.directionX = 0;
  myCat.directionY = 1;
    
  // Speed of forward and back movement (how many pixels to move each frame)
  myCat.speed = 3;
    
//  for (int i = 0; i < bulletCount; i += 1)
//  {
//    bullets[i] = new Bullet();
//    bullets[i].x = -1000;
//    bullets[i].y = -1000;
//  }
}
  
void draw()
{
  background(100);
  image(grass, 0, 0, width, height);
 
  if (dist(myBalloon.x, myBalloon.y, myCat.x, myCat.y) < 40)
  {
    myCat.x += random(-myCat.scaredAmount, myCat.scaredAmount);
    myCat.y += random(-myCat.scaredAmount, myCat.scaredAmount);
    myCat.scaredAmount += 1;
    tint(255, 0, 0);
  }
  if (dist(myBalloon.x, myBalloon.y, myCat.x, myCat.y) < 40)
  {
    myCat.x += random(-myCat.scaredAmount, myCat.scaredAmount);
    myCat.y += random(-myCat.scaredAmount, myCat.scaredAmount);
    tint(255, 0, 0);
  }
  myCat.draw();
  noTint();
  myBalloon.draw();
  myLittlem.draw();
  
//  boolean hitBalloon = false; 
//  for (int i = 0; i < bulletCount; i += 1)
//  {
//    bullets[i].draw();
 
// if (dist(250, 720, bullets[i].x, bullets[i].y) < 75)
//    {
//      hitBalloon = true;
//    }
//  }
//  if(hitBalloon)
//  {
//    tint(255, 0, 0);
//  }
//  else
//  {
//    noTint();
//  }
}
 

class Littlem
{
  float x = 100;
  float y = 100;
  float speed = 2;
  PImage img;
  
  Littlem()
  {
    this.img = requestImage("littlem.png");
  }
  
  void draw()
  {
    this.x += this.speed;
    if(this.x > width - (width/6 / 2) || this.x < (width/6 / 2))
    {
      this.speed = -this.speed;
    }
    if (this.img.width > 0)
    {
      pushMatrix();
      translate(this.x, this.y);
      if (this.speed > 0)
      {
        scale(-1, 1);
      }
      imageMode(CENTER);
      image(this.img, 0, 0, width/6, height/6);
      imageMode(CORNER);
      popMatrix();
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
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
       
      // start tank animation from fram 0->7
      myCat.sprite.setAnimation(12, 15, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
       
      // start tank animation from fram 0->7
      myCat.sprite.setAnimation(0, 3, true);
    }
    if (keyCode == RIGHT)
    {
      rightKeyPressed = true;
       myCat.sprite.setAnimation(8, 11, true);
    }
    if (keyCode == LEFT)
    {
      leftKeyPressed = true;
       myCat.sprite.setAnimation(4, 7, true);
    }
}
  
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
      myCat.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
      myCat.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == RIGHT)
    {
      rightKeyPressed = false;
    }
    if (keyCode == LEFT)
    {
      leftKeyPressed = false;
    }
    {
//  if (key == ' ')
//  {
//    bullets[bulletIndex].x = myCat.x;
//    bullets[bulletIndex].y = myCat.y;
//    bullets[bulletIndex].speed = 10;
//    bullets[bulletIndex].directionX = myCat.directionX;
//    bullets[bulletIndex].directionY = myCat.directionY;
//    bulletIndex += 1;
//    if (bulletIndex >= bulletCount)
//    {
//      bulletIndex = 0;
//    }
//  }
}
}
class Balloon
{
  PImage Balloon;
  float x = 200;
  float y = 250;
  float radius = 12.0;//15.0
  float speedX = 1.0;
  float speedY = 2.0;
  int directionX = 1;
  int directionY = -1;
  
  
  Balloon()
  {
    Balloon = loadImage("balloon.png");
   }
   
   void draw()
   {
     imageMode(CENTER);
     image(Balloon, x, y, width/8, height/6);
     imageMode(CORNER);
     
     pushMatrix();
     translate(x, y);
     scale(directionX, 1);
     //rect(-radius, -radius, radius * 2, radius * 2);
     popMatrix();
     
     x += sin(y * 0.1) + (speedX * directionX);
     if ((x > width-radius) || (x < radius)) {
          directionX = -directionX; // Change direction
    }
    y += speedY * directionY;
    if ((y > height-radius) || (y < radius)) {
        directionY = -directionY; // Change direction
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
  
 
class Cat
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;
  float scaredAmount = 3;
  AnimatedSprite sprite;
   
  Cat()
  {
    this.sprite = new AnimatedSprite("catsprite6.png", 32, 32);
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
      this.directionX = 0;
      this.directionY = -1;
    }
    // subtract to go backward
    else if (backwardKeyPressed)
    {
      this.directionX = 0;
      this.directionY = 1;
    }
    else if (rightKeyPressed)
    {
      this.directionX = 1;
      this.directionY = 0;
    }
    else if (leftKeyPressed)
    {
      this.directionX = -1;
      this.directionY = 0;
    }
    else
    {
      this.directionX = 0;
      this.directionY = 0;  
      this.sprite.setAnimation(0, 0, false);
    }
    
    
    this.x += this.directionX * this.speed;
    this.y += this.directionY * this.speed;
   
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
    this.img = requestImage("fireballegg.png");
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


