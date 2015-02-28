
float x = 0;
float y = 0;
float r = 0;
float l = 0;
float speed = 5;
SpriteObject standingken;

void setup()
{
size(700, 700);
standingken = new SpriteObject("standingken.png");
standingken.x = 675;
standingken.y = 675;
standingken.w = 50;
standingken.h = 50;
}

void draw()
{
background(0);
y += 1.0;
standingken.x -= (l - r) * speed;
float left = standingken.x - (standingken.w * 0.5 * standingken.s);
float right = standingken.x + (standingken.w * 0.5 * standingken.s);
float top = standingken.y - (standingken.h * 0.5 * standingken.s);
float bottom = standingken.y + (standingken.h * 0.5 * standingken.s);

if (standingken.isOverlapping(x + 0, y + 0, 25, 25) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect(x + 0, y + 0, 25, 25);

if (standingken.isOverlapping(x + 75, y + 0, 50, 50) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect( x + 75, y + 0, 50, 50);
if (standingken.isOverlapping(x + 150, y + 0, 75, 75) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect(x + 150, y + 0, 75, 75);
if (standingken.isOverlapping(x + 250, y + 0, 50, 50) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect(x + 250, y + 0, 50, 50);
if (standingken.isOverlapping(x + 350, y + 0, 75, 75) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect (x + 350, y + 0, 75, 75);
if (standingken.isOverlapping(x + 450, y + 0, 25, 25) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect (x + 450, y + 0, 25, 25);
if (standingken.isOverlapping(x + 550, y + 0, 50, 50) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect (x + 550, y + 0, 50, 50);
if (standingken.isOverlapping(x + 650, y + 0, 80, 80) == true)
{
  fill (255, 0, 0);
}
else
{
  fill (255);  
}
rect (x + 650, y + 0, 80, 80);  
standingken.render();
}

   class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage standingken;
  boolean loaded = false;
     
  SpriteObject(String filename)
  {
    this.standingken = requestImage(filename);
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
  
  
  boolean isOverlapping(float otherLeft, float otherTop, float rw, float rh )
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    float otherRight = otherLeft + rw;
    float otherBottom =otherTop + rh;
    
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
 

     
  void render()
  {
    if (this.standingken.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.standingken.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.standingken.height;
      }
    }
       
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.standingken, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      l = 0;
    }
    if (keyCode == RIGHT)
    {
      r = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      l = 1;
    }
    if (keyCode == RIGHT)
    {
      r = 1;
    }
  }
}



