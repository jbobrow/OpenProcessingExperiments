
SpriteObject cat;
Predator dog;
 
void setup()
{
  size(700, 700);
  cat = new SpriteObject("catface.jpg");
  cat.x = width/2;
  cat.y = height/2;
  cat.s = 0.1;
  cat.speed = 5;
  cat.directionX = 2;
  cat.directionY = -2;
  
  dog = new Predator("dogface.jpg");
  dog.s = 0.1;
  dog.speed = 10;
  dog.targetX = cat.x;
  dog.targetY = cat.y;
}
 
void draw()
{
  background(0);
  cat.update();
  cat.render();
  
  dog.targetX = cat.x;
  dog.targetY = cat.y;
  
  dog.update();
  dog.render();
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
    float dirx = targetX - x;
    float diry = targetY - y;
     
    if(abs(dirx) > 2)
    {
      x += dirx / speed;
    }
     
    if(abs(diry) > 2)
    {
      y += diry / speed;
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
      this.s -= 0.1;
      directionY = -directionY;
    }
      
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.s += 0.1;
      directionY = -directionY;
    }
      
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    float rad = this.x * 5;
    this.y += sin(radians(rad)) * 5;
    
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



