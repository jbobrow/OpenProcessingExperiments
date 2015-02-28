
SpriteObject luigi;
SpriteObject[] poop = new SpriteObject[8];
color luigiColor = color(255, 255, 255);
float x = 0;
float speed = 7.5;
float left = 0;
float right = 0;

void setup()
{
  size(500,500);
  luigi = new SpriteObject("LUIGI.png");
  luigi.x = 0.0;
  luigi.y = width / 1.0;
  luigi.x = 1.0;
  
  for(int i = 0; i < 8; i++)
  {
    poop[i] = new SpriteObject("FOOT.png");
    poop[i].x = random(125+ 17);
    poop[i].y = width / 6.0;
    poop[i].speed = random(1.0, 5.0);
  }
}

void draw()
{
  background(0);
  fill(255);
  
  for(int i = 0; i < 8; i++)
  {
    if(poop[i].isOverlapping(luigi) == true)
    {
      tint(255, 5);
      luigiColor = color(0, 255, 0);
    }
    else
    {
      tint(255);
    }
    poop[i].render();
    poop[i].y += poop[i].speed;
  }
  
  x += (right - left) * speed;
  luigi.x = x;
  
  if(luigi.isMouseOverlapping() == false)
  {
   tint(luigiColor);
   luigi.render();
   luigiColor = color(255);
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      right = 0;
    }
    if(keyCode == LEFT)
    {
      left = 0;
    }
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      left = 1.5;
    }
    if(keyCode == RIGHT)
    {
      right = 1.5;
    }
  }
}
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float speed;
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
     if (mouseX> (this.x - (this.w * 0.5 * this.s))
       && mouseX <(this.x + (this.w * 0.5 * this.s))
       &&mouseY > (this.y - (this.w * 0.5 * this.s))
       &&mouseY < (this.y + (this.w * 0.5 * this.s)))
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


