
float x = 0;
float y = 0;
float speed = 1.5;
float left = 0;
float right = 0;
float up = 0;
float down = 0;
/*ellipse = 
e2x + 450
e3x + 200
e4x + 775
e5x + 470
e6x + 650
e7x + 730
e8x + 190*/

SpriteObject patreal;

void setup() 
{
  size(900, 900);
  patreal = new SpriteObject("pat-real.jpg");
  patreal.x = 450 ;
  patreal.y =  870 ;
  
  /*ellipse1.x = 200;
  ellipse2.x = 450;
  ellipse3.x = 200;
  ellipse4.x = 775;
  ellipse5.x = 470;
  ellipse6.x = 650;
  ellipse7.x = 730;
  ellipse8.x = 130;*/
  
}

void draw()
{
  background(#E89644);
  {
  patreal.x += (right - left) * speed;
  patreal.y -= (up - down) * speed;
}
ellipse(200, 150, 200, 200);
ellipse(450, 250, 200, 200);
ellipse(200, 375, 200, 200);
ellipse(775, 450, 200, 200);
ellipse(470, 550, 200, 200);
ellipse(650, 730, 200, 200);
ellipse(730, 170, 200, 200);
ellipse(190, 700, 200, 200);

patreal.render();
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
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
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
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
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


