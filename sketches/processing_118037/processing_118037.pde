
SpriteObject navi;
Predator tatl;
 
void setup()
{
  size(500, 500);
  navi = new SpriteObject("navi.png");
  navi.x = width/2;
  navi.y = height/2;
  navi.s = 0.5;
  navi.speed = 6;
  navi.directionX = 1;
  navi.directionY = -1;
  tatl = new Predator("tatl.jpg");
  tatl.s = .5;
  tatl.speed = 30;
  tatl.targetX = navi.x;
  tatl.targetY = navi.y;
}
 
void draw()
{
  background(255);
  navi.update();
  navi.render();
  tatl.targetX = navi.x;
  tatl.targetY = navi.y;
  tatl.update();
  tatl.render();
}
class Predator extends SpriteObject
{
  float targetX;
  float targetY;
   
  Predator(String filename)
  {
    super(filename);
  }
   
  void update()
  {
    float target1 = targetX - x;
    float target2 = targetY - y;
     
    if(abs(target1) > 2)
    {
      x += target1 / speed;
    }
     
    if(abs(target2) > 2)
    {
      y += target2 / speed;
    }
  }
}
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed;
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
    
  void update()
  {
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      speed += 2;
      directionX = -directionX;
    }
      
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      speed -= 2;
      directionX = -directionX;
    }
      
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.s -= 2;
      directionY = -directionY;
    }
      
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.s += 2;
      directionY = -directionY;
    }
      
    // Move the sprite
    float wavespeed = 4;
    float waveHeight = 4;
    float angle = this.x * wavespeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += directionY * speed;
    this.x += directionX * speed;
    this.y += offset;
    this.x += random(-4, 4); 
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



