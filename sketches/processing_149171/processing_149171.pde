
float x;
float y;
float easing = 0.01;
 
PImage castle;
  
SpriteObject mario;
SpriteObject bowser;
SpriteObject peach;
SpriteObject dead;
   
void setup()
{
  size(800, 800);
     
  mario = new SpriteObject("mario.png");
  mario.y = 200;
  mario.speed = 4;
  mario.s = .4;
  mario.directionY = random(3);
  mario.directionX = random(3);
    
  bowser = new SpriteObject("bowser.png");
  bowser.x = x;
  bowser.y = y;
  bowser.s = .6;
   
  peach = new SpriteObject("peach.png");
  peach.x = 75;
  peach.y = 150;
  peach.s = .45;
  peach.directionY = random(5);
  peach.directionX = random(5);
  peach.speed = 3;
   
  dead = new SpriteObject("dead.png");
  dead.s = .45;
   
 
   
 
   
  castle = requestImage("castle.jpg");
  
     
}
   
float timer = 0;
void draw()
{
if (castle.width > 0)
{
  imageMode(CORNER);
  image(castle, 0, 0, width, height);
}
  timer += 0.0167;
 
if (timer > 6)
{
  bowser.step();
  bowser.render();
}
   
  peach.run();
  peach.render();
   
if (timer > 15)
{
  peach.speed = 0;
  dead.x = peach.x;
  dead.y = peach.y;
  dead.render();
}
    
     
  mario.update();
  mario.render();
   
   
  if (bowser.isOverlapping(mario) == true)
  {
    mario.s = 0;
    bowser.s = .8;
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
    float targetX = mario.x;
    float dx = targetX - x;
     if(abs(dx) > 1)
     {
    x += dx * easing;
  }
    
  float targetY = mario.y;
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


