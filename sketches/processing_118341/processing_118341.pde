
float timer, timer2;
SpriteObject small;
Predator med;
SpriteObject big;
boolean death, grow, shrink;

void setup()
{
  size(500,500);
  
  small = new SpriteObject("small.png");
  small.directionX = random(-5,5);
  small.directionY = random(-5,5);
  small.speed = 1;
  small.s = 0;
  
  med = new Predator("med.png");
  med.targetX = small.x;
  med.targetY = small.y;
  med.speed = 20;
  
  big = new SpriteObject("big.png");
  big.directionX = random(-5,5);
  big.directionY = random(-5,5);
  big.speed = 2;
  
}

void draw()
{
  
  println(timer);
  //background(0);
  fill(#000000, 50);
  rect(-1,-1,501,501);
  
 
  
 
  
  if(death ==false)
  {
  big.update();
  big.speed += -.005;
  if(big.speed > 1)
  {
  big.s += .005;
  }
  if(big.speed < 1)
  {
    big.s += -.005;
  }
  big.render();
  }
  if(big.speed<0)
  {
    big.speed = 0;
    big.s = 0;
    death = true;
  }
  
  if(death == true)
  {
    
    big.speed =2;
    timer += .01;
    
   
    
    if(timer > 2)
    {
      timer = 0;
      death = false;
      
  big.x = random(500);
    big.y = random(500);
    big.directionX = random(-5,5);
    big.directionY = random(-5,5);
    }
  }
  
  if(med.isOverlapping(small))
  {
    small.x = random(500);
    small.y = random(500);
    small.s = 0;
    small.directionX = random(-5,5);
    small.directionY = random(-5,5);
    grow = true;//med.s += .1;
  }
  
  if(grow ==true)
  {
      med.s += .05;
  }
  if(med.s >2)
  {
    grow = false;
  }
  if(med.s >1 && grow ==false)
  {
    med.s += -.05;
  }
  
   pushMatrix();
  small.update();
  translate(random(-3,3),random(-3,3));
  if(small.s<1)
  {
  small.s += .05;
  }
  small.render();
  popMatrix();
  
   med.targetX = small.x;
  med.targetY = small.y;
  med.update();
  med.render();
}

class Predator extends SpriteObject
{
  float targetX;
  float targetY;
    
  Predator(String filename)
  {
    super(filename);
  }
    
  void update()
  {
    float dx = targetX - x;
      
    if(abs(dx) > 2)
    {
      x += dx / speed;
    }
     
     
    float dy = targetY - y;
      
    if(abs(dy) > 2)
    {
      y += dy / speed;
    }
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
    this.y += directionY  * speed;
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



