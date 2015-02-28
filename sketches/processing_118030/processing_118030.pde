

float predatorX;
float predatorY;
float targetX;
float targetY;
float easing = 0.05;
SpriteObject shepard;
Predator reaper;

 
void setup()
{
  size(1000, 900);
   
  shepard = new SpriteObject("shepard.fw.png");
  shepard.y = 200;
  shepard.s = .35;
  shepard.directionX = 1;
  shepard.directionY = 1;
  shepard.speed = 5;
  
  reaper = new Predator ("reaper.fw.png");
  reaper.x = 50;
  reaper.y = 600;
  reaper.speed = 3;
  
   
}
 
void draw()
{
  background(0);
 
  shepard.update();
  shepard.render();
  reaper.render();
  reaper.update(); 

}

class Predator extends SpriteObject { 
  Predator(String filename) { 
    super(filename); 
  } 

  void update()
  {
    float targetX = shepard.x;
    float dx = targetX - predatorX;
    
    if (abs(dx) > 1)
    {
      predatorX += dx * easing;
    }
    
    float dy = targetX - predatorY;
    
    if (abs(dy) > 1)
    {
      predatorY += dy * easing;
    }
    
    this.x = predatorX;
    this.y = predatorY;
    
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
      shepard.speed += random(2,6);
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      shepard.speed -= random(2,6);
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      shepard.s -= .03;
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      shepard.s += .03;
    }
     
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    float waveSpeed = 3;
    float waveHeight = 6;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += offset;
    
    this.x += random (-6,6);
    
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



