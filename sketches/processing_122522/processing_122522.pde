
float x;
float y;
float easing = 0.01;
float timer =0;

PImage life;

SpriteObject zombie;
SpriteObject police;
SpriteObject tomb;
SpriteObject run;

void setup()
{
 size(700,700);
 
 zombie = new SpriteObject("zombie4.jpg");
 zombie.y = 150;
 zombie.x= 40;
 zombie.speed =5;
 zombie.s = .2;
 zombie.directionY = random(4);
 zombie.directionX = random(4);
 
 
 police = new SpriteObject("police.JPG");
 police.y = 80;
 police.x =100;
 police.speed =5;
 police.s = .2;
 police.directionY = random(2);
 police.directionX = random(2);
 
 tomb = new SpriteObject("tomb.png");
 tomb.s =.2;

 
 run = new SpriteObject("run.png");
 run.y = 400;
 run.x =280;
 run.speed =5;
 run.s = .2;
 run.directionY = random(2);
 run.directionX = random(2);
 
 life = requestImage("city.jpg");
  
}


void draw()
{
 if(life.width > 0)
 {
   imageMode(CORNER);
   image(life,0,0,width,height);
 }
  
  timer += 0.0167;
  
  zombie.run();
  zombie.render();
  
  run.run();
  run.render();
  

  police.run();
  police.render();
  if (zombie.isOverlapping(police) == true)
  {
   police.s =0;
   zombie.s= .5;
  }
  
  if (timer >15)
 {
   run.speed = 0;
   tomb.x = run.x;
   tomb.y = run.y;
   tomb.render();
 } 
  
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
    float targetX = police.x;
    float dx = targetX - x;
     if(abs(dx) > 1)
     {
    x += dx * easing;
  }
    
  float targetY = police.y;
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
 





