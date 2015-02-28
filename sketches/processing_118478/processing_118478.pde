
SpriteObject web;
SpriteObject bug1;
SpriteObject bug2;
SpriteObject bug3;
SpriteObject bug4;
SpriteObject spider;
SpriteObject fly;
SpriteObject dead;
float timer = 0;


void setup()
{
  size(500, 500);
 
  web = new SpriteObject("web.jpg");
  web.s = .5;
  web.x = width / 2;
  web.y = height / 2;
  
  bug1 = new SpriteObject("bug.png");
  bug1.speed = 1;
  bug1.s = .2;
  bug1.directionY = -1;
  bug1.directionX = 1;
  bug1.x = random(500);
  bug1.y = random(500);
  
  bug2 = new SpriteObject("bug2.png");
  bug2.speed = 1;
  bug2.s = .2;
  bug2.directionY = -.5;
  bug2.directionX = .5;
  bug2.x = random(500);
  bug2.y = random(500);
  
  bug3 = new SpriteObject("bug3.png");
  bug3.speed = 1;
  bug3.s = .5;
  bug3.directionY = -1.5;
  bug3.directionX = 1.5;
  bug3.x = random(500);
  bug3.y = random(500);
  
  bug4 = new SpriteObject("bug4.png");
  bug4.speed = 1;
  bug4.s = .5;
  bug4.directionY = -2;
  bug4.directionX = 2;
  bug4.x = random(500);
  bug4.y = random(500);
  
  spider = new SpriteObject("spider.png");
  spider.speed = 1;
  spider.s = .1;
  spider.directionY = .5;
  spider.directionX = 1;
  spider.x = 0;
  spider.y = 0;
  
  fly = new SpriteObject("fly.png");
  fly.speed = 2;
  fly.s = .1;
  fly.x = random(500);
  fly.y = random(500);
  fly.directionY = random(2);
  fly.directionX = random(2);
    
  dead = new SpriteObject("dead.png");
  dead.s = .4;
  
}

void draw()
{
  timer += 0.0167;
  

  
  if (spider.isOverlapping(fly) == true)
  {
    fly.s = 0;
    spider.s = .15;
  }
  
  web.render();
  spider.update();
  spider.render();
  fly.update();
  fly.render();
  bug1.update();
  bug1.render();
  bug2.update();
  bug2.render();
  bug3.update();
  bug3.render();
  bug4.update();
  bug4.render();
  
  if (timer > 8)
  {
    bug1.speed = 0;
    dead.x = bug1.x;
    dead.y = bug1.y;
    dead.render();
  }
 
  if (timer > 12)
  {
    bug2.speed = 0;
    dead.x = bug2.x;
    dead.y = bug2.y;
    dead.render();
  }
  
  if (timer > 6)
  {
    bug3.speed = 0;
    dead.x = bug3.x;
    dead.y = bug3.y;
    dead.render();
  }
  
  if (timer > 10)
  {
    bug4.speed = 0;
    dead.x = bug4.x;
    dead.y = bug4.y;
    dead.render();
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
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.4) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.4);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.2) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.2);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.4) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.4);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.3) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.3);
      this.directionY = -this.directionY;
    }
      
    this.y += directionY * speed;
    this.x += directionX * speed;
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


