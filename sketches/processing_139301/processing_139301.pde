
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138340*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// Here we actually create the variable "myTank" of type Tank
Shepherd myShepherd;
 
// We use these variables both to keep track of whether a key is pressed down
boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;

// Bullet variables
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
float radius = 20; 
float y = 50.0; 
float x = 33; 
float speed = 1; 
float wraithX = 300; 
float wraithY = 300; 
float wraithRadius = 40; 
float wraithSpeed = 2; 
float easing = 0.05; 
PImage hell;


class Wraith 
{ 
  float size = 40; 
  float speed = 2; 
  PVector position = new PVector(300, 300); 
  PImage img; 
  
  Wraith() 
  { 
    this.img = requestImage("wolf.jpg"); 
  } 
  void update() 
  { 
    float toX = x - this.position.x; 
    float toY = y - this.position.y; 
    // Use easing to move with an acceleration 
    // add the direction to the prey 
    // but multiply by a small value (easing) to slow him down 
    //predatorX += (toX * easing); 
    //predatorY += (toY * easing); 
    // check if predator is les than 200 away from prey and double speed if so 
    if (dist(x, y, this.position.x, this.position.y) < 200) 
    { 
      this.speed = 4; 
    } 
    
    // Move at a constant speed 
    PVector direction = new PVector(toX , toY); 
    direction.normalize(); 
    this.position.x += direction.x * this.speed; 
    this.position.y += direction.y * this.speed; 
  } 
  void draw() 
  { 
    //ellipse(this.position.x, this.position.y, this.size, this.size); 
    if (img.width > 0 && dist(x, y, this.position.x, this.position.y) > 20) 
    { 
      image(img, this.position.x, this.position.y, this.size, this.size); 
    } 
  }
} 
Wraith myWraith = new Wraith(); 

void setup()
{
  size(800, 800);
  hell = requestImage("hell.png");
  myShepherd = new Shepherd();
   
  // Set the spawn position. 
  myShepherd.x = 200;
  myShepherd.y = 200;
   
  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myShepherd.directionX = 0;
  myShepherd.directionY = 1;
   
  // Speed of forward and back movement (how many pixels to move each frame)
  myShepherd.speed = 3;
   
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
  image(hell, 0, 0, width, height);

  myShepherd.lookAt(mouseX, mouseY);
  myShepherd.draw();
  
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    bullets[bulletIndex].x = myShepherd.x;
    bullets[bulletIndex].y = myShepherd.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myShepherd.directionX;
    bullets[bulletIndex].directionY = myShepherd.directionY;
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
    if (key == 'w')
    {
      forwardKeyPressed = true;
      
      // start tank animation from fram 0->7
      myShepherd.sprite.setAnimation(0, 7, true);
    }
    if (key == 's')
    {
      backwardKeyPressed = true;
      
      // start tank animation from fram 0->7
      myShepherd.sprite.setAnimation(0, 7, true);
    }
}
 
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (key == 'w')
    {
      forwardKeyPressed = false;
      
      // stop tank animation
      myShepherd.sprite.setAnimation(0, 0, true);
    }
    if (key == 's') 
    {
      backwardKeyPressed = false;
      
      // stop tank animation
      myShepherd.sprite.setAnimation(0, 0, true);
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
 

class Shepherd
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
  
  Shepherd()
  {
    // 32 is the size of one frame in the 256x256 image
    this.sprite = new AnimatedSprite("MulticolorTanks.png", 32, 32);
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
    this.img = requestImage("Fireball.png");
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
      
      
myWraith.update(); 
myWraith.draw(); 
    }
  }
}






