
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

SpriteObject troll;
SpriteObject ball;
Predator pre;

void setup()
{
  size(500, 500);
   
  pre = new Predator("pre.png"); 
  
  troll = new SpriteObject("troll.png");
  troll.y = 200;
  troll.speed = 2;
  troll.directionY = 1;
  troll.directionX = 1;
  
  ball = new SpriteObject("ball.png");
  ball.y = 100;
  ball.speed = 3;
  ball.directionY = 2;
  ball.directionX = 1;
  
   
}


void draw()
{
  background(0);
   
  troll.update();
  troll.render();
  
  ball.update();
  ball.render();
  

  pre.targetX = ball.x;
  pre.targetY = ball.y;
    pre.update();
  pre.render();
   
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
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed = 0.5;
      
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed = 5;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 1;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 2;
    }
     
    this.y += directionY * random(4) * this.speed;
    this.x += directionX * random(4) * this.speed;
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



