
float timer;
SpriteObject falcon;
SpriteObject yoshi;
SpriteObject yoshiDead;

Predator game;
PImage fd;
 
float x;
float y;
  
void setup()
{
  size(500, 500);
  
  fd = requestImage("fd.jpg");
  
  yoshi = new SpriteObject("yoshi.png");
  yoshiDead = new SpriteObject("green.png");
  yoshi.y = 100;
  yoshi.directionX = 1.5;
  yoshi.directionY = 2.0;
  yoshi.speed = 3.5;
  yoshi.s = 0.7;
    
falcon = new SpriteObject("falcon.jpg");
 falcon.y = 200;
 falcon.directionX = 1;
 falcon.directionY = 1;
  falcon.speed = 5;
 game = new Predator("game.png");
  
    
   
}
  
void draw()
{
  imageMode(CORNER);
  if (fd. width>0)
  {
    image(fd,0,0,500,500);
  }
  
  falcon.update();
  falcon.render();
   
  game.update();
  game.render();
  
  yoshi.update();
  yoshi.render();
   
  if (game.isOverlapping(falcon) == true)
  {
  falcon.s *= 0.99;
  game.img = game.img;
  game.s += 0.000167;
 
  }
  
  if (timer > 5)
  {
    yoshi.speed = 0;
    yoshi.x = 400;
    yoshi.y = 250;
    yoshi.img = yoshiDead.img;
  }
    
  timer += 0.0167;
   
}
  
   class Predator extends SpriteObject
   {
    
  float easing = 0.05;
  
  void update()
  {
    float targetY = falcon.y;
    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }
  
    float targetX = falcon.x;
    float dx = targetX - x;
  
    if (abs(dx) > 1)
    {
      x += dx * easing;
    }
  }
  
  
  Predator (String filename)
  {
    super(filename);
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
    }
      
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
      
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
      
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
      
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
     
     float waveSpeed = 4;
    float waveHeight = 4;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += offset;
     
    this.x += random(-5, 5);
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




