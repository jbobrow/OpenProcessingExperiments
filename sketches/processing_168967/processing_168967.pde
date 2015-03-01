
float x;
float y;
float easing = 0.02;

PImage Back;
 
SpriteObject oli;
SpriteObject bulborb;
SpriteObject pikmin;
SpriteObject ghost;
  
void setup()
{
  size(800, 800);
    
  oli = new SpriteObject("Olimar.png");
  oli.y = 200;
  oli.speed = 4;
  oli.s = .65;
  oli.directionY = random(3);
  oli.directionX = random(3);
   
  bulborb = new SpriteObject("bulborb.png");
  bulborb.x = x;
  bulborb.y = y;
  bulborb.s = .82;
  
  pikmin = new SpriteObject("pikmin.png");
  pikmin.x = 75;
  pikmin.y = 150;
  pikmin.s = .45;
  pikmin.directionY = random(10);
  pikmin.directionX = random(10);
  pikmin.speed = 6;
  
  ghost = new SpriteObject("ghost.png");
  ghost.s = .45;


  

  
  Back = requestImage("world.png");
 
    
}
  
float timer = 0;
void draw()
{
if (Back.width > 0)
{
  imageMode(CORNER);
  image(Back, 0, 0, width, height);
}
  timer += 0.0167;

if (timer > 6)
{
  bulborb.step();
  bulborb.render();
}
  
  pikmin.run();
  pikmin.render();
  
if (timer > 12)
{
  pikmin.speed = 0;
  ghost.x = pikmin.x;
  ghost.y = pikmin.y;
  ghost.render();
  
}
   
    
  oli.update();
  oli.render();
  
  
  if (bulborb.isOverlapping(oli) == true)
  {
    oli.s = 0;
    bulborb.s = 1.4;
  }
   if (timer > 14.5)
{
  pikmin.speed = 55;
  
}
 
}
  
 class Predator extends SpriteObject
{
  Predator(String filename) { super(filename);}
}
 
  
  
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
      
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
 

  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
     this.directionY = -this.directionY;
    }
      
    this.y += random(directionY) * speed;
    this.x += random(directionX) * speed;
     
     
 
  }
  
    void run()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
      
    this.y += random(directionY) * speed;
    this.x += random(directionX) * speed;
   
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
   
  void step()
  {
    float targetX = oli.x;
    float dx = targetX - x;
     if(abs(dx) > 1)
     {
    x += dx * easing;
  }
   
  float targetY = oli.y;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
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


}




