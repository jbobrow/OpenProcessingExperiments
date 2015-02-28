
SpriteObject master;
Predator yoshi;
float s = 1;

 
void setup()
{
  size(500, 500);
   
  master = new SpriteObject("master.png");
  master.y = 200;
  master.directionX = random(5);
  master.directionY = random(10);
  master.speed = .5;
  yoshi = new Predator("yoshi.png");
  yoshi .y = 200;
  yoshi .directionX = random(5);
  yoshi .directionY = random(10);
  yoshi .speed = .5;
   
  
}
 
void draw()
{
  background(0);
  master.update();
  master.render();
  
  yoshi.update();
  yoshi.render();
  
  
   
 
 
   

}

class Predator extends SpriteObject 
{ 
  
  Predator(String filename) 
  { 
    super(filename); 
  } 
  
  float targetX ;
  float targetY;
  float predX;
  float predY;
  float easing = 0.05;
  
 void update()
 
 
  {
     float targetX = master.x;
    float dx = targetX - predX;
    if (abs(dx) > 1)
    {
      predX += dx * easing;
    }
   
    float targetY = master.y;
    float dy = targetY - predY;
    if (abs(dy) > 1)
    {
      predY += dy * easing;
    }
     
    this.x = predX;
    this.y = predY;

    
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
      this.directionX = -this.directionX;
      this.speed += .5;
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed -= .5;
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s -= .5;
     
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s += .5;
      
    }
     
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    
     float waveSpeed = 4;
     float waveHeight = 4;
     float angle = this.x * waveSpeed;
     float offset = sin(radians(angle)) * waveHeight;
      this.y += offset;
    
    //this.x += random (-4, 4);
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


