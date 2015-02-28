
SpriteObject troll;
SpriteObject troll2;
SpriteObject troll3;

void setup()
{
  size(500, 500);
  troll = new SpriteObject("troll.png");
  troll.x = width/2;
  troll.y = height/2;
  
  troll2 = new SpriteObject("troll.png");
  troll2.y = width/2;
  troll2.x = 0;
  troll2.s = 0.8;
  
  troll3 = new SpriteObject("troll.png");
  troll3.y = 0;
  troll3.x = 400;
  troll3.s = 1.5;
}
 
void draw()
{
  background(0);
  if (troll.isOverlappingMouse() == false)
  {
    tint(255);
    troll.render();
  } 
  
  if (troll2.isOverlapping(troll) == true)
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255);
  }
   
  troll2.render();
  troll2.x += 1;

  if (troll3.isOverlapping(troll2) == true)
  {
    tint(0, 0, 255);
  }
  else
  {
    tint(255);
  }
  
  troll3.render();
  troll3.y += 0.8;
  

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



