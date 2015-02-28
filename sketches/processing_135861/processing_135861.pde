
Predator predator;
SpriteObject notpredator;
Kitty kitty;
PImage cartoonbg;
float timer;
int y;
boolean eaten = false;
 
void setup()
{
  size(500, 500);
   
  cartoonbg = requestImage("cartoonbg.png");
  kitty = new Kitty("kittenface.png");
  kitty.y = 175;
  kitty.directionX = 10;
  kitty.directionY = 10;
  kitty.speed = 1.5;
     
  notpredator = new SpriteObject("puppydog.gif");
  notpredator.y = 200;
  notpredator.directionX = 10;
  notpredator.directionY = 10;
  notpredator.speed = .5;
     
  predator = new Predator("ANGRYbird.png");
  predator.y = 175;
  predator.directionX = 10;
  predator.directionY = 10;
  predator.speed = .5;
 
}
   
void draw()
{
   
  image(cartoonbg, width/2, height/2, width, height);
  stroke(225, 210, 0);
  y++;
  
  if (y > height)
  {
    y = 0;
  }
   
  if(!predator.isOverlapping(notpredator))
  {
    notpredator.update();
    notpredator.render();
  }
  else
  {
    predator.w = 125;
    predator.h = 125;
  }
   
  predator.update();
  predator.render();
   
  kitty.update();
  kitty.render();
     
  timer += 0.0155;
    
  predator.targetX = notpredator.x;
  predator.targetY = notpredator.y;
   
  if(timer < 10)
  {
  kitty.targetX = predator.x;
  kitty.targetY = predator.y;
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
      
  boolean eaten()
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
    if(timer < 11)
       return false;
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
      notpredator.speed += .35;
  
    }
       
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      notpredator.speed += -.35;
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
      
    float waveSpeed = 3;
    float waveHeight = 6;
    float angle = this.x + waveSpeed;
    float offset2 = sin(radians(angle)) * waveHeight;
    this.y += offset2;
      
    this.x += random (-3, 3);
   
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
 
 
  
class Predator extends SpriteObject
{
  float targetX;
  float targetY;
  float easing = 0.05;
    
  Predator(String filename)
  {
    super(filename);
  }
    
  void update()
  {
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
    
    
  float dy = targetY - y;
  if(abs(dy) > 1)
  {
    y += dy * easing;
  }
  if ( timer > 5)
  {
    speed += 5;
  }
  }
}
 
class Kitty extends Predator
{
  float targetX;
  float targetY;
  float easing = 0.05;
 
 Kitty(String filename)
 {
   super(filename);
 }
  
  void update()
 {
  float dx = targetX - x;
 if(abs(dx) > 1)
 {
   x += dx * easing;
 }
  
   float dy = targetY - y;
   if(abs(dy) > 1)
   {
     y += dy * easing;
   } 
 }
 
}


