
float easing = 0.05;
float predatorX;
float predatorY;
float targetX;
float targetY;
SpriteObject spider1;
SpriteObject spider2;
SpriteObject spider3;
SpriteObject spider4;
SpriteObject spiderDead1;
SpriteObject spiderDead2;
SpriteObject spiderDead3;
SpriteObject spiderDead4;
Predator fly;
SpriteObject flyDead;
SpriteObject rat;
SpriteObject ratDead;

PImage background;
 
void setup()
{
  size(900, 537);
  
  background = requestImage("background.jpg");
   
  spider1 = new SpriteObject("spider.fw.png");
  spiderDead1 = new SpriteObject("spiderdead.fw.png");
  spider1.y = 600;
  spider1.x = 600;
  spider1.s = .35;
  spider1.directionX = 1;
  spider1.directionY = 1;
  spider1.speed = 7;
  
  spider2 = new SpriteObject("spider.fw.png");
  spiderDead2 = new SpriteObject("spiderdead.fw.png");
  spider2.y = 500;
  spider2.x = 850;
  spider2.s = .35;
  spider2.directionX = 1;
  spider2.directionY = 1;
  spider2.speed = 3;
  
  spider3 = new SpriteObject("spider.fw.png");
  spiderDead3 = new SpriteObject("spiderdead.fw.png");
  spider3.y = height/2;
  spider3.x = width/2;
  spider3.s = .35;
  spider3.directionX = 1;
  spider3.directionY = 1;
  spider3.speed = 4;
  
  spider4 = new SpriteObject("spider.fw.png");
  spiderDead4 = new SpriteObject("spiderdead.fw.png");
  spider4.y = 10;
  spider4.x = 20;
  spider4.s = .35;
  spider4.directionX = 1;
  spider4.directionY = 1;
  spider4.speed = 9;
  
  rat = new SpriteObject("rat.fw.png");
  ratDead = new SpriteObject("tombstone.fw.png");
  rat.x = 50;
  rat.y = height/2;
  rat.directionX = 1;
  rat.directionY =1;
  rat.speed = 2;
  
  
  
  fly = new Predator ("fly.fw.png");
  flyDead = new Predator ("flydead.fw.png");
  fly.x = 50;
  fly.y = 600;
  fly.speed = .5;
  fly.s = .8;
  
 
   
}
 
 float timer = 0;
 
void draw()
{
  imageMode(CORNER);
  if (background.width>0)
  {
    image(background,0,0,900,537);
  }

  timer += 0.0167;
  spider1.update();
  spider1.render();
    spider2.update();
  spider2.render();
    spider3.update();
  spider3.render();
    spider4.update();
  spider4.render();
  rat.render();
  rat.update();
  
  if (fly.isOverlapping(spider1) == true)
  {
    spider1.img = spiderDead1.img;
    spider1.speed = 0;
    fly.targetX = spider2.x;
    fly.targetY = spider2.y;
  }
  
    if (fly.isOverlapping(spider2) == true)
  {
    spider2.img = spiderDead1.img;
    spider2.speed = 0;
    fly.targetX = spider3.x;
    fly.targetY = spider3.y;
  }
  
    if (fly.isOverlapping(spider3) == true)
  {
    spider3.img = spiderDead1.img;
    spider3.speed = 0;
    fly.targetX = spider4.x;
    fly.targetY = spider4.y;
  }
  
    if (fly.isOverlapping(spider4) == true)
  {
    spider4.img = spiderDead1.img;
    spider4.speed = 0;
    fly.targetX = width / 2;
    fly.targetY = height /2;
  
     
  }
  
    if (timer > 8)
  {
     rat.speed = 0;
     rat.img = ratDead.img;
  }
  
  

  fly.render();
  fly.update(); 

}

class Predator extends SpriteObject { 
  float targetX;
  float targetY;
  Predator(String filename) { 
    super(filename); 
  } 

  void update()
  {
    float targetX = spider1.x;
    float dx = targetX - predatorX;
    
    if (abs(dx) > 1)
    {
      predatorX += dx * easing;
    }
    
    float targetY = spider1.y;
    float dy = targetY - predatorY;
    
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
      spider1.speed += random(2,6);
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      spider1.speed -= random(2,6);
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
    
    float waveSpeed = 5;
    float waveHeight = 9;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    
    if (this.speed > 0)
    {
      this.y += offset;
    
      this.x += random (-6,6);
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



