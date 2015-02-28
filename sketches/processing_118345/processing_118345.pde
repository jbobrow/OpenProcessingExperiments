
float x;
float y;
float easing = 0.01;

PImage Back;
 
SpriteObject troll;
SpriteObject boss;
SpriteObject pink;
SpriteObject dead;
  
void setup()
{
  size(800, 800);
    
  troll = new SpriteObject("zebra.png");
  troll.y = 200;
  troll.speed = 4;
  troll.s = .4;
  troll.directionY = random(3);
  troll.directionX = random(3);
   
  boss = new SpriteObject("lion.png");
  boss.x = x;
  boss.y = y;
  boss.s = .6;
  
  pink = new SpriteObject("elephant.png");
  pink.x = 75;
  pink.y = 150;
  pink.s = .45;
  pink.directionY = random(5);
  pink.directionX = random(5);
  pink.speed = 3;
  
  dead = new SpriteObject("dead.png");
  dead.s = .45;
  

  

  
  Back = requestImage("africa.png");
 
    
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
  boss.step();
  boss.render();
}
  
  pink.run();
  pink.render();
  
if (timer > 15)
{
  pink.speed = 0;
  dead.x = pink.x;
  dead.y = pink.y;
  dead.render();
}
   
    
  troll.update();
  troll.render();
  
  
  if (boss.isOverlapping(troll) == true)
  {
    troll.s = 0;
    boss.s = .8;
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
    float targetX = troll.x;
    float dx = targetX - x;
     if(abs(dx) > 1)
     {
    x += dx * easing;
  }
   
  float targetY = troll.y;
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



