
Pray bluePray; 
Pray redPray; 
SpriteObject skull; 
Predator frankenstein;
void setup()
{
 background(0); 
  size(500, 500);
  skull = new SpriteObject ("skull.png");
  skull.y = 300; 
  skull.directionX = 1; 
  skull.directionY = 1; 
  skull.speed = 3; 
  skull.s = 0.2;
  
  
  frankenstein = new Predator ("frankenstein.png");
  frankenstein.s = .1;
  frankenstein.x =skull.directionX; 
  frankenstein.y =skull.directionY;
  frankenstein.speed = 1;
  frankenstein.y = skull.y;  


}



void draw()
{
  background(0);
  skull.update(); 
  skull.render(); 
  frankenstein.update();
  frankenstein.render(); 
    

}


class Pray
{
  float x;
  float y;
  float directionX = 0;
  float directionY = 1;
  float speed = 3;
  color carColor;
   
   
  void bounce()
  {
    // Bounce the car if it goes off screen
     
    if (this.x > width - 25 && this.directionX > 0)
    {
      this.directionX *= -1;
      this.x = width - 25;
    }
    if (this.x < 25 && this.directionX < 0)
    {
      this.directionX *= -1;
      this.x = 25;
    }
    if (this.y > height - 50 && this.directionY > 0)
    {
      this.directionY *= -1;
      this.y = height - 50;
    }
    if (this.y < 50 && this.directionY < 0)
    {
      this.directionY *= -1;
      this.y = 50;
    }
     
    // Move the car by the direction and speed
    this.x += this.directionX * speed; 
    this.y += this.directionY * speed;
  }
   
  void stop()
  {
    this.speed = 0;
  }
   
  void go(float s)
  {
    this.speed = s; 
  }
   
 
   
  void render()
  {
    rectMode(CENTER);
    fill(this.carColor);
    rect(this.x, this.y, 50, 100);
  }
}


class Predator extends SpriteObject {
  Predator(String filename) 
  { 
    super(filename); 
  } 
  void update()
  {
    this.y += skull.directionY *speed;
    this.x += skull.directionX *speed; 
     
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
      this.speed +=1; 
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed -= 1; 
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height -(this.h * this.s * .5);
      this.directionY = -this.directionY;
      this.s *=.5; 
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * .5);
      this.directionY = -this.directionY;
      this.s *= 2; 
    }
     
    // Move the sprite
    this.y += random(directionY) * random(speed);
    this.x += directionX * random(speed);
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



