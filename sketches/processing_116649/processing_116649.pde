

SpriteObject[] fallingObjects;
int[] speeds;
SpriteObject player;
boolean colliding;

void setup()
{
  size(600, 600);
  player = new SpriteObject("Duck.png");
  fallingObjects = new SpriteObject[8];
  speeds = new int[8];
  colliding = false;
  for(int c = 0; c < 8; c++)
  {
    fallingObjects[c] = new SpriteObject("falcon.png");
    fallingObjects[c].s = 0.1;
    fallingObjects[c].x = random(50, 550);
    fallingObjects[c].y = -100;
    speeds[c] = (int)random(3, 10);
  }
  
  player.s = 0.1;
}

void draw()
{
  if(!colliding)
  {
    background(52, 117, 206);
  }
  
  else
  {
    background(203, 0, 0);
  }
  
  colliding = false;
  player.x = mouseX;
  player.y = mouseY;
  
  player.render();
  
  for(int c = 0; c < 8; c++)
  {
    fallingObjects[c].render();
    fallingObjects[c].y += speeds[c];
    if(fallingObjects[c].collidesWith(player))
    {
      colliding = true;
    }
    
    if(fallingObjects[c].y >= 700)
    {
      fallingObjects[c].y = -100;
      fallingObjects[c].x = random(50, 550);
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
  
  boolean collidesWith(SpriteObject other)
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
}



