
float x = 0;
float y = 0;
float speed = 8.0;
float left = 0;
float right = 0;
SpriteObject SpaceShip;
 
 
void setup()
{
   
  size(500, 500);
  SpaceShip = new SpriteObject("SpaceShip.jpg");
  SpaceShip.x = 25;
  SpaceShip.y = 475;
  SpaceShip.w = 50;
  SpaceShip.h = 50;
}
 
void draw()
{
   SpaceShip.x += (right - left) * speed;
  y += 5;
  background(0);
  fill(255, 0, 0);
  ellipse(x + 100, y, 50, 50);
  rect(x + 400, y - 25, 50, 50);
  ellipse(x + 275, y, 25, 100);
  rect(x + 150, y - 10, 20, 40);
  ellipse(x, y, 30, 45);
  rect(x + 50, y - 20, 10, 40);
  ellipse(x + 320, y, 45, 45);
  ellipse(x + 500, y, 55, 65);
  noFill();
   
  if (SpaceShip.isOverlapping(x + 400, y - 25, x + 400 + 50, y - 25 + 50) == true)
   {
     tint(255, 0, 0);
   }
   else
   {
     tint(255);
   }
  if (SpaceShip.isOverlapping(x + 100, y, x + 100 + 25, y + 25) == true)
  {
   tint(255, 0, 0);
  }
  if (SpaceShip.isOverlapping(x + 275, y, x + 275 + 12.5, y + 50) == true)
  {
   tint(255, 0, 0);
  }
  if (SpaceShip.isOverlapping(x + 150, y - 10, x + 150 + 20, y - 10 + 40) == true)
  {
   tint(255, 0, 0);
  }
 if (SpaceShip.isOverlapping(x, y, x + 15, y + 22.5) == true)
  {
   tint(255, 0, 0);
  } 
  if (SpaceShip.isOverlapping(x + 50, y - 20, x + 50 + 10, y - 20 + 40) == true)
  {
   tint(255, 0, 0);
  }
  if (SpaceShip.isOverlapping(x + 320, y, x + 320 + 22.5, y + 22.5) == true)
  {
   tint(255, 0, 0);
  }
 if (SpaceShip.isOverlapping(x + 500, y, x + 500 + 27.5, y + 32.5) == true)
  {
   tint(255, 0, 0);
  } 
   fill(0, 0, 255);
   ellipse(450,450, 25, 25);
   noFill();
   
   if(SpaceShip.isOverlapping(450, 450, 450 + 25, 450 + 25) == true)
   {
     tint(0, 255, 0);
   }
   
  SpaceShip.render();

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
 
  boolean isOverlapping(float otherLeft, float otherTop, float otherRight, float otherBottom)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
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
 
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
 
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}



