
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
 
float speed = 1; 
float wraithX = 300; 
float wraithY = 300; 
float wraithRadius = 40; 
float wraithSpeed = 2; 
float easing = 0.05; 
PImage hell;
PImage heaven; 

float soulX = 100;
float soulY = 100;
float soulRadius = 20;
float soulSpeed = 2;


int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;

int gamestate = PLAY_STATE;
class Soul
{
  float size = 40;
  float speed = 2;
  PVector position = new PVector (100, 100);
  PImage img;
  float y = 50.0;
  float x = 33;
  boolean dead = false;
  
  Soul()
  {
    this.img = requestImage("Soul.png");
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
    if (img.width > 0 && this.dead == false) 
    { 
      image(img, this.position.x, this.position.y, this.size, this.size); 
    } 
  }
} 
Soul mySoul;
Soul mySoul2;
Soul mySoul3;
Soul mySoul4;
Soul mySoul5;

class Wraith 
{ 
  float size = 40; 
  float stuntimer = 0;
  float speed = 2; 
  PVector position = new PVector(300, 300); 
  PImage img; 
  float y = 50.0; 
  float x = 33;
  
  Wraith() 
  { 
    this.img = requestImage("Wraith.png"); 
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
    stuntimer -= 1/30.0;
    // Move at a constant speed 
    PVector direction = new PVector(toX , toY); 
    direction.normalize(); 
    if (stuntimer <= 0)
    {
    this.position.x += direction.x * this.speed; 
    this.position.y += direction.y * this.speed; 
    }
  } 
  void draw() 
  { 
    //ellipse(this.position.x, this.position.y, this.size, this.size); 
    if (img.width > 0) 
    { 
      image(img, this.position.x, this.position.y, this.size, this.size); 
    } 
  }
} 
Wraith myWraith;

void setup()
{
  size(800, 800);
  hell = requestImage("hell.png");
  heaven = requestImage("heaven.png");
  mySoul = new Soul(); 
  mySoul2 = new Soul(); 
  mySoul3 = new Soul();
  mySoul4 = new Soul();
  mySoul5 = new Soul();
  mySoul2.x += 100;
  mySoul3.x += 150;
  mySoul4.x += 200;
  mySoul5.x += 250;
  myWraith = new Wraith(); 
  myShepherd = new Shepherd();
   
  // Set the spawn position. 
  myShepherd.x = 200;
  myShepherd.y = 200;
   
  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myShepherd.directionX = 0;
  myShepherd.directionY = 1;
   
  frameRate(30);
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
  
  if (gamestate == PLAY_STATE)
  {

  myShepherd.lookAt(mouseX, mouseY);
  myShepherd.draw();
  
  mySoul.x = myShepherd.x-(myShepherd.directionX*50);
  mySoul.y = myShepherd.y-(myShepherd.directionY*50);  
  mySoul.update(); 
  mySoul.draw();
 
  mySoul2.x = myShepherd.x-(myShepherd.directionX*100);
  mySoul2.y = myShepherd.y-(myShepherd.directionY*100);  
  mySoul2.update(); 
  mySoul2.draw();  
  
  mySoul3.x = myShepherd.x-(myShepherd.directionX*150);
  mySoul3.y = myShepherd.y-(myShepherd.directionY*150);  
  mySoul3.update(); 
  mySoul3.draw();
  
  mySoul4.x = myShepherd.x-(myShepherd.directionX*200);
  mySoul4.y = myShepherd.y-(myShepherd.directionY*200);  
  mySoul4.update(); 
  mySoul4.draw();
  
  mySoul5.x = myShepherd.x-(myShepherd.directionX*250);
  mySoul5.y = myShepherd.y-(myShepherd.directionY*250);  
  mySoul5.update(); 
  mySoul5.draw();
  
  myWraith.x = mySoul.position.x;
  myWraith.y = mySoul.position.y; 
 
 if ( mySoul.dead == true)
 {
    myWraith.x = mySoul2.position.x;
    myWraith.y = mySoul2.position.y; 
 }
 if (mySoul2.dead == true)
 {
    myWraith.x = mySoul3.position.x;
    myWraith.y = mySoul3.position.y; 
 }
 if (mySoul3.dead == true)
 {
    myWraith.x = mySoul4.position.x;
    myWraith.y = mySoul4.position.y; 
 }
 if (mySoul4.dead == true)
 {
    myWraith.x = mySoul5.position.x;
    myWraith.y = mySoul5.position.y; 
 }
 
 
 
  myWraith.update(); 
  myWraith.draw(); 
  

  if (dist(mySoul.position.x, mySoul.position.y, myWraith.position.x, myWraith.position.y) < 25)
  {
    mySoul.dead = true;
  }
   if (dist(mySoul2.position.x, mySoul2.position.y, myWraith.position.x, myWraith.position.y) < 25)
  { 
    mySoul2.dead = true; // this should be mySoul2
  }
   if (dist(mySoul3.position.x, mySoul3.position.y, myWraith.position.x, myWraith.position.y) < 25)
  {
    mySoul3.dead = true; // 3
  }
   if (dist(mySoul4.position.x, mySoul4.position.y, myWraith.position.x, myWraith.position.y) < 25)
  {
    mySoul4.dead = true; /// 4
  }
// dont make this an else if, just make it an if.
   if (dist(mySoul5.position.x, mySoul5.position.y, myWraith.position.x, myWraith.position.y) < 25)
  {
    mySoul5.dead = true;
    gamestate = LOSE_STATE;
  }

  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
    if (dist (myWraith.position.x, myWraith.position.y, bullets[i].x, bullets[i].y) < 20)
    {
      myWraith.stuntimer = 5;
    }
  }
  
  fill(255);
  rect(width-50, height-50, width, height);
  
  if (dist(width-25, height-25, myShepherd.x, myShepherd.y) < 25)
  {
    gamestate = WIN_STATE;
  }
  }
  else if (gamestate == WIN_STATE)
  {
    textAlign(CENTER);
    image(heaven, 0, 0, width, height);
    text("All the souls made it to heaven, Thank you", 0, 0, width, 100);
  }
  else if (gamestate == LOSE_STATE)
  {
    textAlign(CENTER);
    //image(heaven, 0, 0, width, height);
    text("All the souls are stuck in hell.", 0, 0, width, 100);
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
      myShepherd.sprite.setAnimation(0, 0, true);
    }
    if (key == 's')
    {
      backwardKeyPressed = true;
      
      // start tank animation from fram 0->7
      myShepherd.sprite.setAnimation(0, 0, true);
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
      

    }
  }
}






