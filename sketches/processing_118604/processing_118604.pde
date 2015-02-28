

float easing = 0.01;


SpriteObject web;
SpriteObject spider;
SpriteObject fly;
SpriteObject beetle;
 
void setup()
{
  size(500, 500);
  
  web = new SpriteObject("web.png");
  web.x = width / 2;
  web.y = height / 2;
  
  fly = new SpriteObject("fly.png");
  fly.y = 200;
  fly.s = .1;
  fly.speed = 2.5;
  fly.directionY = sin(1);
  fly.directionX = sin(5);
  
  spider = new SpriteObject("spider.png");
  spider.s = .2;
  
  beetle = new SpriteObject("beetle.png");
  beetle.y = 200;
  beetle.s = .3;
  beetle.speed = 3;
  beetle.directionY = sin(10);
  beetle.directionX = sin(15);

}

float timer = 0;
void draw()
{
  background(0);
  web.render();
  timer += 0.0167;
  
  fly.update();
  fly.render();
  
  beetle.update();
  beetle.render();
  
  spider.chase();
  spider.render();
  
  if (spider.isOverlapping(fly) == true)
  {
    fly.s = 0;
    spider.s = .3;
  }
  
  if (timer >= 5)
  {
    beetle.speed = 1.5;
  }
  
  if (timer >= 6.5)
  {
    beetle.speed = 0;
  }
  
  if (timer >= 7.5)
  {
    if (beetle.s > .05)
    {
      beetle.s -= .05;
    }
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
     
    this.y += directionY * speed;
    this.x += directionX * speed;
    
  }
  
  void chase()
{
  
  float targetX = fly.x;
  float dx = targetX - x;
  
  if(abs(dx) > 1)
  {
    x += dx * easing;
  }
    
  float targetY = fly.y;
  float dy = targetY - y;
  
  if(abs(dy) > 1)
  {
    y += dy * easing;
  }
  
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



