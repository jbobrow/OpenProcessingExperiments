
PImage displayImage;
PImage collisionImage;
float playerX=100;
SpriteObject wakka;
float playerY=100;
float playerVelocityY=0;
float playerVelocityX=0;
float playerSpeed=3;
float JumpSpeed= -5;
float playerSize=10;
float upKey;
float rightKey;
float downKey;
float leftKey;
float gravity=.3;
boolean onGround=true;
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

void setup()
{
  size(500,500);
    collisionImage = requestImage("level.png");
  displayImage = requestImage("leveldetail.png");
  wakka=new SpriteObject("wakka.png");
}

void draw()
{
  background(255);
  fill(0);
  playerVelocityY+=gravity;
  playerVelocityX=(rightKey-leftKey)*playerSpeed;
  float nextX=playerX+playerVelocityX;
  float nextY=playerY+playerVelocityY;
    onGround=false;
  if(collisionImage.width>0)
  {
    collisionImage.loadPixels();
    for (int y=0; y<collisionImage.height;y+=1)
    {
    for (int x=0;x<collisionImage.width;x+=1)
    {
      color pixelColor=collisionImage.pixels[y*collisionImage.width+x];
         float platformSize=10;
       float platformX= x*platformSize;
  float platformY=y*platformSize;
  boolean collided=isRectOverlapping(nextX,playerY, nextX+playerSize, playerY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);
  if (collided==true && red(pixelColor)==0)
  {
if(playerVelocityX<0 && playerX>=platformX+platformSize)
{
  playerVelocityX=0;
}
if (playerVelocityX >0 &&playerX<platformX)
  {
    playerVelocityX=0;
  }
  }
  collided=isRectOverlapping(playerX,nextY, nextX+playerSize, nextY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);

  if (collided==true && red(pixelColor)==0)
  {
    if (playerVelocityY>0 &&playerY<platformY)
    {
      playerVelocityY=0;
      onGround=true;
    }
    if (playerVelocityY<0&& playerY>platformY+platformSize)
    {
      playerVelocityY=0;
    }
  }
  }  
  }
  }

  if(displayImage.width>0)
  {
    imageMode(CORNER);
    image(displayImage,0,0,500,500);
  }
  playerX+=playerVelocityX;
  playerY+=playerVelocityY;
  wakka.render();
  wakka.x=playerX;
  wakka.y=playerY;
  wakka.h=playerSize;
  wakka.w=playerSize;
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY =JumpSpeed;
    }
  }
    
    
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }
}
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
    
  SpriteObject(String filename)
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
   
  boolean isOverlapping(SpriteObject other)
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
   
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
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
      imageMode(CORNER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}




