
SpriteObject titan;
SpriteObject eren;
SpriteObject win;
SpriteObject lose;

PImage background;

 
void setup()
{
   
  size(900, 500);
  titan = new SpriteObject("titan.png");
  titan.x = 900;
  titan.y = 250;
  titan.s = 1.0;
  
  background = loadImage("trees.jpg");
  
  eren = new SpriteObject("eren.png");
  eren.x = 600;
  eren.y = 250;
  eren.s = 0.3;
  
  win = new SpriteObject("winning.jpg");
  win.x = width/2;
  win.y = height/2;
  win.s = 1;
  
  lose = new SpriteObject("Lose.jpg");
  lose.x = width/2;
  lose.y = height/2;
  lose.s = 1;
}
 
void draw()
{
  image(background,width/2,height/2,900,500);
  
 
     if (titan.isOverlapping(eren) == true)
     {
       Lose();
       eren.x = 1500;
       titan.x = 1500;
       titan.x +=0;
     }
     else
     {
     titan.x -= .5;
   }
   
   if (eren.x < 10 || eren.x == 10)
   {
     Win();
     titan.x = 2000;
     titan.x +=0;
   }
   
  titan.render();
  eren.render();
 
}

void Win()
{
  win.render();
}

void Lose()
{
  lose.render();
}

void keyReleased()
{
  if (key == 'r')
  {
    eren.x =600;
    titan.x =900;
  }
  if (key == CODED)
  {
    if (keyCode == LEFT)
    eren.x -=8;
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


