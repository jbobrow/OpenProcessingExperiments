
class SideJumper
{
  PImage image;
  PImage pic;
  PVector player;
  PVector player2;
  float direction;
  float direction2;
  PVector playerVelocity;
  PVector playerVelocity2;
  float playerJumpSpeed;
  float playerJumpSpeed2;
  float playerSpeed;
  float playerSpeed2;
  float playerSize;
}

SideJumper mustacheMan;
float left;
float right;
float up;
float down;
/*
SideJumper bunnyGirl;
float left2;
float right2;
float up2;
float down2;
*/
 
float gravity = .5;
//float gravity2 = .5;
 
float bottom = 480;
boolean onBottom = true;

PImage collisionImage;
PImage displayImage;
 
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
                          }



void setup()
{
  size(500, 500);
      
  collisionImage = requestImage("level.png");
  displayImage = requestImage("leveldDetail.png");
   
  mustacheMan = new SideJumper();
  mustacheMan.image = loadImage("mustache dude.png");
  mustacheMan.player = new PVector(200, 200);
  mustacheMan.direction = 1;
  mustacheMan.playerVelocity = new PVector(0, 0);
  mustacheMan.playerJumpSpeed = -10;
  mustacheMan.playerSpeed = 5;
  
  /*
  bunnyGirl = new SideJumper();
  bunnyGirl.pic = loadImage("bunny firegirl.png");
  bunnyGirl.player2 = new PVector(300, bottom);
  bunnyGirl.direction2 = 1;
  bunnyGirl.playerVelocity2 = new PVector(0, 0);
  bunnyGirl.playerJumpSpeed2 = 11;
  bunnyGirl.playerSpeed2 = 10;
  */
  

}

void draw()
{
  background(255);
  mustacheMan.playerVelocity.y += gravity;
  mustacheMan.playerVelocity.x = (right + left) * mustacheMan.playerSpeed;
  float nextY = mustacheMan.player.y + mustacheMan.playerVelocity.y;
  float nextX = mustacheMan.player.x + mustacheMan.playerVelocity.x;


  //updatebunnyGirl();
  
  
  onBottom = false;
  if (collisionImage.width > 0)
  {
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      {
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
     
        float platformSize = 10;
        float platformX = x * platformSize;
        float platformY = y * platformSize;
         
        float mLeft = nextX - 0.5 * mustacheMan.image.width;
        float mTop = mustacheMan.player.y - 0.5 * mustacheMan.image.height;
        float mRight = nextX + 0.5 * mustacheMan.image.width;
        float mBottom = mustacheMan.player.y + 0.5 * mustacheMan.image.height;
        boolean collided = isRectOverlapping(mLeft, mTop, mRight, mBottom,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
           
        if (collided == true && red(pixelColor) == 0)
        {
          if (mustacheMan.playerVelocity.x < 0 && mustacheMan.player.x - 0.5 * mustacheMan.image.width >= platformX + platformSize)
          {
            mustacheMan.playerVelocity.x = 0;
          }
      
          if (mustacheMan.playerVelocity.x > 0 && mustacheMan.player.x + 0.5 * mustacheMan.image.width < platformX)
          {
            mustacheMan.playerVelocity.x = 0;
          }
        }
         
        mLeft = mustacheMan.player.x - 0.5 * mustacheMan.image.width;
        mTop = nextY - 0.5 * mustacheMan.image.height;
        mRight = mustacheMan.player.x + 0.5 * mustacheMan.image.width;
        mBottom = nextY + 0.5 * mustacheMan.image.height;
        collided = isRectOverlapping(mLeft, mTop, mRight, mBottom,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
        
           
        if (collided == true && red(pixelColor) == 0)
        {
          if (mustacheMan.playerVelocity.y > 0 && mustacheMan.player.y + 0.5 * mustacheMan.image.height < platformY)
          {
            mustacheMan.playerVelocity.y = 0;
            onBottom = true;
          }
          if (mustacheMan.playerVelocity.y < 0 && mustacheMan.player.y - 0.5 * mustacheMan.image.height > platformY + platformSize)
          {
            mustacheMan.playerVelocity.y = 0;
          }
        }
      }
    }
  }
 
  if (displayImage.width > 0)
  {
    imageMode(CORNER);
    image(displayImage, 0, 0, width, height);
  }
 
  mustacheMan.player.x += mustacheMan.playerVelocity.x;
  mustacheMan.player.y += mustacheMan.playerVelocity.y;
 
  //rect(playerX, playerY, playerSize, playerSize);
    
  drawmustacheMan();

}

void drawmustacheMan()
{ 
  pushMatrix();
   
  translate(mustacheMan.player.x, mustacheMan.player.y);
   
  scale(mustacheMan.direction, 1);
   
  imageMode(CENTER);
  image(mustacheMan.image, 0, 0);
   
  popMatrix();
}

/*
void updatebunnyGirl()
{
  if (bunnyGirl.player2.y < bottom)
  {
    bunnyGirl.PlayerVelocity2.y += gravity2;
  }
  else
  {
    bunnyGirl.PlayerVelocity2.y = 0;
  }
   
  if (bunnyGirl.player2.y >= bottom && up2 != 0)
  {
    bunnyGirl.PlayerVelocity2.y = -bunnyGirl.playerJumpSpeed2;
  }
   
  bunnyGirl.PlayerVelocity2.x = bunnyGirl.playerSpeed2 * (left2 + right2);
   
  PVector lastplayer = new PVector(bunnyGirl.player2.x, bunnyGirl.player2.y);
  lastplayer.add(bunnyGirl.PlayerVelocity2);
   
  float offset2 = 0;
  if (lastplayer.x > offset2 && lastplayer.x < (width - offset2))
  {
    bunnyGirl.player2.x = lastplayer.x;
  }
  if (lastplayer.y > offset2 && lastplayer.y < (height - offset2))
  {
    bunnyGirl.player2.y = lastplayer.y;
  }
   
  pushMatrix();
   
  translate(bunnyGirl.player2.x, bunnyGirl.player2.y);
   
  
  scale(bunnyGirl.direction2, 1);
   
  imageMode(CENTER);
  image(bunnyGirl.pic, 0, 0);
   
  popMatrix();
  
}*/

void keyPressed()
{
    if (key == 'w')
  {
    if (onBottom == true)
    {
      mustacheMan.playerVelocity.y = mustacheMan.playerJumpSpeed;
    }
  }
  
  if (key == 'd')
  {
    right = 1;
    mustacheMan.direction = 1;
  }
  if (key == 'a')
  {
    left = -1;
    mustacheMan.direction = -1;
  }
  if (key == 'w') //the jump
  {
    up = -1;
  }
  if (key == 's')
  {
    down = 1;
  }
  if (key == CODED)
  {
   /* if (keyCode == RIGHT)
    {
      right2 = 1;
      bunnyGirl.direction2 = 1;
    }
    if (keyCode == LEFT)
    {
    left2 = -1;
    bunnyGirl.direction2 = -1;
    }
    if (keyCode == UP)
    {
      up2 = -1;
    }
    if (keyCode == DOWN)
    {
      down2 =1;
    }*/
  }
}
 
void keyReleased()
{
  if (key == 'd')
  {
    right = 0;
  }
  if (key == 'a')
  {
    left = 0;
  }
  if (key == 'w')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
   /*if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      right2 = 0;
    }
    if (keyCode == LEFT)
    {
    left2 = 0;
    }
    if (keyCode == UP)
    {
      up2 = 0;
    }
    if (keyCode == DOWN)
    {
      down2 = 0;
    }
  }*/
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
    boolean isMouseOver()
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y + h)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
 
  boolean isOverlappingMouse()
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
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
     
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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



