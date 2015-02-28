
float circle_x = 300;
float circle_y = 20;
float circle_x2 = 10;
float circle_y2 = 700;
float circle_x3 = 150;
float circle_y3 = 50;
float circle_x4 = 500;
float circle_y4 = 100;
float move_x = 6;
float move_y = -6;
float move_x2 = -6;
float move_y2 = 6;
float move_x3 = 3;
float move_y3 = -3;
float move_x4 = -3;
float move_y4 = 3;

float timer = 30;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 0;
//int LOSE_STATE = 0;

Jellyfish myJellyfish;
PImage room;
PImage winbackground;
   
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
  size(1024, 768);
  room = requestImage("underwater.jpg");
  winbackground = requestImage("images4-.jpeg");
     
  myJellyfish = new Jellyfish();
     
  
  myJellyfish.x = 200;
  myJellyfish.y = 200;
     
  
  myJellyfish.directionX = 0;
  myJellyfish.directionY = 1;
     
  myJellyfish.speed = 3;
     
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}
   
void draw()
{
  if (gamestate == PLAY_STATE)
  {
  image(room, 0, 0, width, height);
  timer = timer - (1.0 / 30.0);
  
  text("TIME: " + (int)timer, 425, 400);
  textSize(40);
  }
  
 if (timer < 0)
 {
   if (gamestate == WIN_STATE)
   {
     background(0,255,0);
     textAlign(CENTER);
     text("YOU WIN!", 0, 200, width, 100);
   }
 }

  
  myJellyfish.draw();
    
  boolean hitMonster = false;
    
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
      
    if (dist(100, 100, bullets[i].x, bullets[i].y) < 75)
    {
      hitMonster = true;
    }
  }
    
  if (hitMonster)
  {
    fill(255,0,0);
  }
    
  //rectMode(CENTER);
  //rect(100, 100, 100, 100);
  //fill(255);
 {
  fill(#AFECF7);
  stroke(#FFFFFF);
  strokeWeight(2);
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width)
  {
    circle_x = width;
    move_x = -move_x;
  }
  if(circle_y > height)
  {
    circle_y = height;
    move_y = -move_y;
  }
  if(circle_x < 0)
  {
    circle_x = 0;
    move_x = -move_x;
  }
  if(circle_y < 0)
  {
    circle_y = 0;
    move_y = -move_y;
  }
 }
 
 {

  ellipse(circle_x2, circle_y2, 40, 40);
  circle_x2 = circle_x2 + move_x2;
  circle_y2 = circle_y2 + move_y2;
  
  if(circle_x2 > width)
  {
    circle_x2 = width;
    move_x2 = -move_x2;
  }
  if(circle_y2 > height)
  {
    circle_y2 = height;
    move_y2 = -move_y2;
  }
  if(circle_x2 < 0)
  {
    circle_x2 = 0;
    move_x2 = -move_x2;
  }
  if(circle_y2 < 0)
  {
    circle_y2 = 0;
    move_y2 = -move_y2;
  }
 }
 
 {
 
 ellipse(circle_x3, circle_y3, 40, 40);
  circle_x3 = circle_x3 + move_x3;
  circle_y3 = circle_y3 + move_y3;
  
  if(circle_x3 > width)
  {
    circle_x3 = width;
    move_x3 = -move_x3;
  }
  if(circle_y3 > height)
  {
    circle_y3 = height;
    move_y3 = -move_y3;
  }
  if(circle_x3 < 0)
  {
    circle_x3 = 0;
    move_x3 = -move_x3;
  }
  if(circle_y3 < 0)
  {
    circle_y3 = 0;
    move_y3 = -move_y3;
  }
 }

{
 
 ellipse(circle_x4, circle_y4, 40, 40);
  circle_x4 = circle_x4 + move_x4;
  circle_y4 = circle_y4 + move_y4;
  
  if(circle_x4 > width)
  {
    circle_x4 = width;
    move_x4 = -move_x4;
  }
  if(circle_y4 > height)
  {
    circle_y4 = height;
    move_y4 = -move_y4;
  }
  if(circle_x4 < 0)
  {
    circle_x4 = 0;
    move_x4 = -move_x4;
  }
  if(circle_y4 < 0)
  {
    circle_y4 = 0;
    move_y4 = -move_y4;
  }
 }
}

  
  
   
void keyPressed()
{
   
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
        
      myJellyfish.sprite.setAnimation(0, 7, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
        
      // start tank animation from fram 0->7
      myJellyfish.sprite.setAnimation(0, 7, true);
    }
      
    if (keyCode == LEFT)
    {
      leftKeyPressed = true;
        
      myJellyfish.sprite.setAnimation(0, 7, true);
    }
      
    if (keyCode == RIGHT)
    {
      rightKeyPressed = true;
        
      myJellyfish.sprite.setAnimation(0, 7, true);
    }
      
    if (key == ' ')
    {
        
    bullets[bulletIndex].x = myJellyfish.x;
    bullets[bulletIndex].y = myJellyfish.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myJellyfish.directionX;
    bullets[bulletIndex].directionY = myJellyfish.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  }
}
   
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
        
      // stop tank animation
      myJellyfish.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
        
      // stop tank animation
      myJellyfish.sprite.setAnimation(0, 0, true);
    }
   if (keyCode == LEFT)
    {
      leftKeyPressed = false;
    }
      
    if (keyCode == RIGHT)
    {
      rightKeyPressed = false;
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
   
  
class Jellyfish
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
    
  Jellyfish()
  {
    // 32 is the size of one frame in the 256x256 image
    this.sprite = new AnimatedSprite("jellyfish2.png", 115, 125);
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
      this.rotation += 8;
    }
      
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
      
      if (leftKeyPressed)
      {
        this.rotation -= 8;
      }
        
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
    
      
    
    // apply transformations
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation) - radians(90));
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
  float w = 70.0;
  float h = 30.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
    
  Bullet()
  {
    this.img = requestImage("bolt5.png");
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




