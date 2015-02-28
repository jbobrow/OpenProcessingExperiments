
Walker player;
Walker player2;
Walker damage;
Walker damage2;
Walker player3;
Walker player4;
Walker button1;
Walker pButton1;
Walker button2;
Walker pButton2;
Walker winspot;
Walker winspot2;
Walker scared;
Walker scared2;
AnimatedSpriteObject crystal;
AnimatedSpriteObject crystal2;

var mus = new Audio("DST-2ndBallad.mp3"); // from http://www.nosoapradio.us/

float leftkey = 0;
float rightkey = 0;
float downkey = 0;
float upkey = 0;
float leftkey2 = 0;
float rightkey2 = 0;
float downkey2 = 0;
float upkey2 = 0;

float timer = 20;

int gamestate = 0;
boolean playstate = false;
int winstate = 1;
int gameover = 2;

PImage displayImage;
PImage collisionMap;
PImage back;
PImage pic;
PFont typeface;

boolean shouldDrawCrystal = false;
boolean shouldDrawCrystal2 = false;
boolean shouldDrawDirections = true;
boolean onWall = true;

boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) 
 {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
 }


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
    this.spriteSheet = this.image1;
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
      this.image1 = this.spriteSheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
  }
   
}

  
class Walker
{
  PImage image1;
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
  
  //PImage img;
  boolean loaded = false;
  boolean dead = false;
  
Walker(String filename)
  {
    this.image1 = requestImage(filename);
  }

  
   boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.2 * this.s))
      && mouseX < (this.x + (this.w * 0.2 * this.s))
      && mouseY > (this.y - (this.h * 0.2 * this.s))
      && mouseY < (this.y + (this.h * 0.2 * this.s)))
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
    float left = this.position.x - (this.image1.width * 0.1);
    float right = this.position.x + (this.image1.width * 0.1);
    float top = this.position.y - (this.image1.height * 0.1);
    float bottom = this.position.y + (this.image1.height * 0.1);
       
    float otherLeft = other.x - (other.w * 0.1);
    float otherRight = other.x + (other.w * 0.1);
    float otherTop = other.y - (other.h * 0.1);
    float otherBottom = other.y + (other.h * 0.1); 
       
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
    
  }
    boolean isOverlapping2(Walker other2)
    {
      float left2 = this.position2.x - (this.image2.width * 0.1);
      float right2 = this.position2.x + (this.image2.width * 0.1);
      float top2 = this.position2.y - (this.image2.height * 0.1);
      float bottom2 = this.position2.y + (this.image2.height * 0.1);
    
      float otherLeft2 = other2.x - (other2.w * 0.1);
      float otherRight2 = other2.x + (other2.w * 0.1);
      float otherTop2 = other2.y - (other2.h * 0.1);
      float otherBottom2 = other2.y + (other2.h * 0.1);
    
      return !(left2 > otherRight2 || right2 < otherLeft2 || top2 > otherBottom2 || bottom2 < otherTop2);
    }
    
    boolean isOverlapping3(Walker other3)
  {
    float left3 = this.x - (this.w * 0.5);
    float right3 = this.x + (this.w * 0.5);
    float top3 = this.y - (this.h * 0.5);
    float bottom3 = this.y + (this.h * 0.5);
          
    float otherLeft3 = other3.x - (other3.w * 0.5);
    float otherRight3 = other3.x + (other3.w * 0.5);
    float otherTop3 = other3.y - (other3.h * 0.5);
    float otherBottom3 = other3.y + (other3.h * 0.5);
          
    return !(left3 > otherRight3 || right3 < otherLeft3 || top3 > otherBottom3 || bottom3 < otherTop3);
  }

  void render()
  {
    if (this.image1.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.image1.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.image1.height;
      }
    }
          
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.image1, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

void setup()
{
  size(800, 480);
  
  displayImage = requestImage("final game back.png");
  collisionMap = requestImage("detail final game2.png");
  back = requestImage("final game iback.png");
  pic = requestImage("final game in.png");
  
  player = new Walker("Actor1.png");
  player.image1 = loadImage("Actor1.png");
  player.position = new PVector(22, 44);
  player.velocity = new PVector(0, 0);
  player.frameRow = 0;
  player.frameColumn = 0;
  player.frameTimer = 0;
  player.speed = 3;
  
  player3 = new Walker("Actor2.png");
  player3.image2 = loadImage("Actor2.png");
  player3.position2 = new PVector(780, 42);
  player3.velocity2 = new PVector(0, 0);
  player3.frameRow2 = 0;
  player3.frameColumn2 = 0;
  player3.frameTimer2 = 0;
  player3.speed2 = 4;
  
  damage = new Walker ("Damage1.png");
  damage.image1 = loadImage("Damage1.png");
  
  damage2 = new Walker ("Damage2.png");
  damage2.image2 = loadImage("Damage2.png");
  
  scared = new Walker ("Behavior.png");
  scared.image1 = loadImage("Behavior.png");
  
  scared2 = new Walker ("Behavior2.png");
  scared2.image2 = loadImage("Behavior2.png");
  
  player2 = new Walker("Actor1.png");
  player2.image1 = loadImage("Actor1.png");
  
  player4 = new Walker("Actor2.png");
  player4.image2 = loadImage("Actor2.png");
  
  button1 = new Walker("Switch1.png");
  button1.x = 140;
  button1.y = 240;
  
  button2 = new Walker("Switch1.png");
  button2.x = 588;
  button2.y = 175;
  
  pButton1 = new Walker("Switch2.png");
  pButton2 = new Walker("Switch2.png");
  
  winspot = new Walker("place.png");
  winspot.x = 16;
  winspot.y = 305;
  
  winspot2 = new Walker("place.png");
  winspot2.x = 784;
  winspot2.y = 112;
  
  
  crystal =  new AnimatedSpriteObject("crystal.png");
  crystal.x = 300;
  crystal.y = 290;
  crystal.frameSpeed = 4.0;
  crystal.frameWidth = 32;
  crystal.frameHeight = 62;
  crystal.startFrame = 0; 
  crystal.endFrame = 2;
  
  //println(crystal.x);
  
  crystal2 =  new AnimatedSpriteObject("crystal.png");
  crystal2.x = 687;
  crystal2.y = 290;
  crystal2.frameSpeed = 4.0;
  crystal2.frameWidth = 32;
  crystal2.frameHeight = 62;
  crystal2.startFrame = 0; 
  crystal2.endFrame = 2;

  typeface = createFont("Lucida Console");
}
 
void draw()
{
 if (displayImage.width >0)
 {
   imageMode(CORNER);
   image(displayImage,0,0,width,height);
 }
 
 mus.play();
 
 if (shouldDrawCrystal == true)
  {
     crystal.update();
     crystal.render();
  }
  if (shouldDrawCrystal2 == true)
  {
     crystal2.update();
     crystal2.render();
  }
  
  button1.render();
  button2.render();
  winspot.render();
  winspot2.render();
  
  player.velocity.x = player.speed * (leftkey + rightkey);
  player.velocity.y = player.speed * (upkey + downkey);
   
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
   
  PImage frameImage = getSubImage(player.image1, player.frameRow, player.frameColumn, 34, 32);
   

  image(frameImage, 0, 0);
   
  popMatrix();
  
  player3.velocity2.x = player3.speed2 * (leftkey2 + rightkey2);
  player3.velocity2.y = player3.speed2 * (upkey2 + downkey2);
   
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
  
float nextY = player.position.y + player.velocity.y;
float nextX = player.position.x + player.velocity.x;
float next2Y = player3.position2.y + player3.velocity2.y;
float next2X = player3.position2.x + player3.velocity2.x;

onWall = false;

  
   if (collisionMap.width > 0)
  {
    collisionMap.loadPixels();
    for (int y = 0; y < collisionMap.height; y += 1)
    {
      for (int x = 0; x < collisionMap.width ; x += 1)
      {
        color pixelColor = collisionMap.pixels[y*collisionMap.width+x];
     
        float platformSize = 10;
        float platformX = x * platformSize;
        float platformY = y * platformSize;
        float xOffset = 8;
        float yOffset = 8;
        
        boolean collided = isRectOverlapping(nextX - xOffset, player.position.y - yOffset, nextX + xOffset, player.position.y + yOffset,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
           
        if (collided == true && red(pixelColor) < 128)
        {
          //fill(255, 0, 0);
          //rect(platformX, platformY, platformSize, platformSize);
           // moving left and character is currently on the right side of the wall
          if (player.velocity.x < 0 && player.position.x - xOffset >= platformX + platformSize)
          {
            player.velocity.x = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (player.velocity.x > 0 && player.position.x + xOffset < platformX)
          {
            player.velocity.x = 0;
          }
        }
        
         boolean collided2 = isRectOverlapping(next2X - xOffset, player3.position2.y - yOffset, next2X + xOffset, player3.position2.y + yOffset,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
           
        if (collided2 == true && red(pixelColor) < 128)
        {
          //fill(255, 0, 0);
          //rect(platformX, platformY, platformSize, platformSize);
           // moving left and character is currently on the right side of the wall
          if (player3.velocity2.x < 0 && player3.position2.x - xOffset >= platformX + platformSize)
          {
            player3.velocity2.x = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (player3.velocity2.x > 0 && player3.position2.x + xOffset < platformX)
          {
            player3.velocity2.x = 0;
          }
        }
        
         
        collided = isRectOverlapping(player.position.x - xOffset, nextY - yOffset, player.position.x + xOffset, nextY + yOffset,
        platformX, platformY, platformX + platformSize, platformY + platformSize);
        
           
        if (collided == true && red(pixelColor) < 128)
        {      
          // top
          if (player.velocity.y > 0 && player.position.y + yOffset < platformY)
          {
            player.velocity.y = 0;

          }
          // bottom
          if (player.velocity.y < 0 && player.position.y - yOffset > platformY + platformSize)
          {
            player.velocity.y = 0;
          }
        }
        collided2 = isRectOverlapping(player3.position2.x - xOffset, next2Y - yOffset, player3.position2.x + xOffset, next2Y + yOffset,
        platformX, platformY, platformX + platformSize, platformY + platformSize);
        
           
        if (collided2 == true && red(pixelColor) < 128)
        {      
          // top
          if (player3.velocity2.y > 0 && player3.position2.y + yOffset < platformY)
          {
            player3.velocity2.y = 0;

          }
          // bottom
          if (player3.velocity2.y < 0 && player3.position2.y - yOffset > platformY + platformSize)
          {
            player3.velocity2.y = 0;
          }
        }
      }
    }
  }
  player.position.x += player.velocity.x;
  player.position.y += player.velocity.y;
  player3.position2.x += player3.velocity2.x;
  player3.position2.y += player3.velocity2.y;
  
  if (player.isOverlapping(crystal))
    {
      crystal.x = player.position.x;
      crystal.y = player.position.y;
    }
      if (player3.isOverlapping2(crystal2))
    {
      crystal2.x = player3.position2.x;
      crystal2.y = player3.position2.y;
    }

    fill(0);
    textFont(typeface, 20);
    text("TIME: " + (int)timer, 351,21);
    fill(255);
    textFont(typeface, 20);
    text("TIME: " + (int)timer, 350,20);
    
     if (timer < 0)
    {
      timer = 0;
      gamestate = gameover;
      
    }
      if (gamestate == gameover)
    {
      image(back,width/2,height/2,width,height);
      
      fill(255);
      text("Congratulations! Because of you, your friends are dead." ,80, 250);
    }
    
    if (crystal.isOverlapping3(winspot))
    {
      if (crystal2.isOverlapping3(winspot2))
      {
       gamestate = winstate;
      }
    }
    
    if (gamestate == winstate)
    {
      image(back,width/2,height/2,width,height);
      
      fill(255);
      text("Congratulations!", 310, 220);
      text("Give yourself a pat on the back for this tiny victory.",75, 250);
    }
  if (playstate == false)
  {
    directions();
  }
  if (playstate == true)
    {
      timer -= 0.0167;
    }
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
  if (key == 'd')
  {
    rightkey = 1;
  }
  if (key == 'a')
  {
    leftkey = -1;
  }
  if (key == 'w')
  {
    upkey = -1;
  }
  if (key == 's')
  {
    downkey = 1;
  }
    if (key == 'e')
    {
      player.image1 = scared.image1;
      if (player.isOverlapping(button1))
      {
        button1.image1 = pButton1.image1;
        shouldDrawCrystal = true;
      }
        
    }
    
    if (key == 'u')
    {
      player3.image2 = scared2.image2;
      
      if (player3.isOverlapping2(button2))
       {
         button2.image1 = pButton2.image1;
         shouldDrawCrystal2 = true;
       }
       
    }
    
    if (key == 'l')
    {
      rightkey2 = 1;
    }
    if (key == 'j')
    {
      leftkey2 = -1;
    }
    if (key == 'k')
    {
      downkey2 = 1;
    }
    if (key == 'i')
    {
       upkey2 = -1;
     }
}
 
void keyReleased()
{
  if (key == 'd')
  {
    rightkey = 0;
  }
  if (key == 'a')
  {
    leftkey = 0;
  }
  if (key == 'w')
  {
    upkey = 0;
  }
  if (key == 's') 
  {
    downkey = 0;
  }
  if (key == 'e')
  { 
    player.image1 = player2.image1;
  }
  
  if (key == 'u')
  {
    player3.image2 = player4.image2;
  }
  if (key == 'l')
    {
      rightkey2 = 0;
    }
    if (key == 'j')
    {
      leftkey2 = 0;
    }
    if (key == 'k')
    {
      downkey2 = 0;
    }
    if (key == 'i')
    {
       upkey2 = 0; 
    }
    
   if (key == ' ')
   {
     playstate = true;
     shouldDrawDirections = false;
   }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    player.image1 = damage.image1;
    player3.image2 = damage2.image2;
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
   player.image1 = player2.image1;
   player3.image2 = player4.image2;
  }
}

void directions()
{
  if (shouldDrawDirections == true)
  {
    image(pic,width/2,height/2,width,height);
  }
}


