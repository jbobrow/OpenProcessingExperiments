
Walker player;
Walker player2;
Walker damage;
Walker damage2;
Walker player3;
Walker player4;
Walker button1;
Walker pButton1;
Walker scared;
Walker scared2;
AnimatedSpriteObject crystal;
float leftkey = 0;
float rightkey = 0;
float downkey = 0;
float upkey = 0;
float leftkey2 = 0;
float rightkey2 = 0;
float downkey2 = 0;
float upkey2 = 0;

class AnimatedSpriteObject extends Walker
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

  
class Walker
{
  PImage image;
  PVector position;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
  
  PImage image2;
  PVector position2;
  int frameRow2;
  int frameColumn2;
  float frameTimer2;
  PVector velocity2;
  float speed2;
  
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  boolean dead = false;
  
Walker(String filename)
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
    
  boolean isOverlapping(Walker other)
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

void setup()
{
  size(600, 200);
  
  player = new Walker("Actor1.png");
  player.image = loadImage("Actor1.png");
  player.position = new PVector(200, 100);
  player.velocity = new PVector(0, 0);
  player.frameRow = 0;
  player.frameColumn = 0;
  player.frameTimer = 0;
  player.speed = 2;
  
  player3 = new Walker("Actor2.png");
  player3.image2 = loadImage("Actor2.png");
  player3.position2 = new PVector(150, 100);
  player3.velocity2 = new PVector(0, 0);
  player3.frameRow2 = 0;
  player3.frameColumn2 = 0;
  player3.frameTimer2 = 0;
  player3.speed2 = 4;
  
  damage = new Walker ("Damage1.png");
  damage.image = loadImage("Damage1.png");
  
  damage2 = new Walker ("Damage2.png");
  damage2.image2 = loadImage("Damage2.png");
  
  scared = new Walker ("Behavior.png");
  scared.image = loadImage("Behavior.png");
  
  scared2 = new Walker ("Behavior2.png");
  scared2.image2 = loadImage("Behavior2.png");
  
  player2 = new Walker("Actor1.png");
  player2.image = loadImage("Actor1.png");
  
  player4 = new Walker("Actor2.png");
  player4.image2 = loadImage("Actor2.png");
  
  button1 = new Walker("Switch1.png");
  button1.x = 100;
  button1.y = 100;
  
  pButton1 = new Walker("Switch2.png");
  
  
  crystal =  new AnimatedSpriteObject("crystal.png");
  crystal.x = random(0,250);
  crystal.y = random(0,150);
  crystal.frameSpeed = 4.0;
  crystal.frameWidth = 32;
  crystal.frameHeight = 62;
  crystal.startFrame = 0; 
  crystal.endFrame = 2;

}
 
void draw()
{
  background(#0B3105);
  
  button1.render();
  
  player.velocity.x = player.speed * (leftkey + rightkey);
  player.velocity.y = player.speed * (upkey + downkey);
  player.position.add(player.velocity);
   
  player.frameTimer += 0.1;
  if (player.frameTimer >= 3)
  {
    player.frameTimer = 1;
  }
  player.frameColumn = (int)player.frameTimer;
   
  if (player.velocity.x == 0 && player.velocity.y == 0)
  {
    player.frameColumn = 0;
  }
   
  if (leftkey != 0)
  {
    player.frameRow = 1;
  }
  if (rightkey != 0)
  {
    player.frameRow = 2;
  }
  if (upkey != 0)
  {
    player.frameRow = 3;
  }
  if (downkey != 0)
  {
    player.frameRow = 0;
  }
 
  pushMatrix();
  translate(player.position.x, player.position.y);
  imageMode(CENTER);
   
  PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 34, 32);
   

  image(frameImage, 0, 0);
   
  popMatrix();
  
  player3.velocity2.x = player3.speed2 * (leftkey2 + rightkey2);
  player3.velocity2.y = player3.speed2 * (upkey2 + downkey2);
  player3.position2.add(player3.velocity2);
   
  player3.frameTimer2 += 0.1;
  if (player3.frameTimer2 >= 3)
  {
    player3.frameTimer2 = 1;
  }
  player3.frameColumn2 = (int)player3.frameTimer2;
   
  if (player3.velocity2.x == 0 && player3.velocity2.y == 0)
  {
    player3.frameColumn2 = 0;
  }
   
  if (leftkey2 != 0)
  {
    player3.frameRow2 = 1;
  }
  if (rightkey2 != 0)
  {
    player3.frameRow2 = 2;
  }
  if (upkey2 != 0)
  {
    player3.frameRow2 = 3;
  }
  if (downkey2 != 0)
  {
    player3.frameRow2 = 0;
  }
 
  pushMatrix();
  translate(player3.position2.x, player3.position2.y);
  imageMode(CENTER);
   
  PImage frameImage2 = getSubImage(player3.image2, player3.frameRow2, player3.frameColumn2, 33, 32);
   

  image(frameImage2, 0, 0);
   
  popMatrix();

}
 

PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}

PImage getSubImage2(PImage image2, int row2, int column2, int frameWidth2, int frameHeight2)
{
  return image2.get(column2 * frameWidth2, row2 * frameHeight2, frameWidth2, frameHeight2);
}
 
void keyPressed()
{
  if (keyCode == RIGHT)
  {
    rightkey = 1;
  }
  if (keyCode == LEFT)
  {
    leftkey = -1;
  }
  if (keyCode == UP)
  {
    upkey = -1;
  }
  if (keyCode == DOWN)
  {
    downkey = 1;
  }
    if (keyCode == ENTER)
    {
    //if(player2.isOverlapping(button1))
    //{
      button1.img = pButton1.img;
    //}
      player.image = scared.image;
    }
    
    if (key == ' ')
    {
      player3.image2 = scared2.image2;
      button1.img = pButton1.img;
        
      crystal.update();
      crystal.render();
    }
    
    if (key == 'd')
    {
      rightkey2 = 1;
    }
    if (key == 'a')
    {
      leftkey2 = -1;
    }
    if (key == 's')
    {
      downkey2 = 1;
    }
    if (key == 'w')
    {
       upkey2 = -1;
    }
}
 
void keyReleased()
{
  if (keyCode == RIGHT)
  {
    rightkey = 0;
  }
  if (keyCode == LEFT)
  {
    leftkey = 0;
  }
  if (keyCode == UP)
  {
    upkey = 0;
  }
  if (keyCode == DOWN) 
  {
    downkey = 0;
  }
  if (keyCode == ENTER)
  { 
    player.image = player2.image;
  }
  
  if (key == ' ')
  {
    player3.image2 = player4.image2;
  }
  if (key == 'd')
    {
      rightkey2 = 0;
    }
    if (key == 'a')
    {
      leftkey2 = 0;
    }
    if (key == 's')
    {
      downkey2 = 0;
    }
    if (key == 'w')
    {
       upkey2 = 0;
    }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    player.image = damage.image;
    player3.image2 = damage2.image2;
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
   player.image = player2.image;
   player3.image2 = player4.image2;
  }
}


