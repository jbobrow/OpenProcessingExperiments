
SpriteObject rake1;
Predator slendy;

void setup()
{
  size(500,500);
  rake1=new SpriteObject("rake.jpg");

  rake1.directionX = 1;
  rake1.directionY = 1;
  rake1.speed = 5;
  rake1.s=.3;
  rake1.x=30;
  rake1.y=30;
  
  slendy=new Predator("slendyclaw.jpg");
  slendy.directionX = 1;
  slendy.directionY = 1;
  slendy.x= 30;
  slendy.y = 30;
  slendy.speed = 1;
  slendy.s=.5;
}
void draw()
{
  background(255);
  rake1.update();
  rake1.render();
  
 // slendy.targetX=rake1.x;
 // slendy.targetY=rake1.y;
  slendy.update1();
  slendy.render();

 

}


class Predator extends SpriteObject 
{
   float targetX;
      float targetY;
            float easing = 0.05;
           float preX;
           float preY;

  Predator(String filename)
  {
    super(filename); 
  }
    void update1()
    {
     
      
       targetX = rake1.x;
  float dx = targetX - this.x;
  if(abs(dx) > 3) 
  
    this.x += dx * easing;
  
      targetY = rake1.y;
  float dy = targetY - this.y;
  if(abs(dy) > 3) 
  
    this.y += dy * easing;
  
//this.x = preX;
 ///this.y=preY;

  
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
  boolean grower=true;
  boolean speeder=false;
  boolean sspeed1;
boolean sspeed2;
boolean ggrow1;
boolean ggrow2;

     
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
      speeder=true;
      sspeed1=true;
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      speeder=false;
      sspeed2=true;
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    //  this.s-=.5;
      grower=false;
      ggrow1=false;
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
     // this.s+=.5;
      grower=true;
      ggrow2=false;
      
    }
     
    // Move the sprite
    this.y += this.directionY * speed;
    this.x += this.directionX * speed;
  
    float rd= radians(this.x * speed);
    this.y = this.y + cos(rd) * 2;
    if(grower==true)
    this.s+=.001;
  else if (grower==false)
  this.s-=.001;
 /* if(grower==true&&ggrow2==false)
  {
    this.s=.3;
    ggrow2=true;
  }
  else if (grower==false&&ggrow1==false)
  {
  this.s=.8;
  ggrow1=true;
  }
  */
  if(speeder==true)
    this.speed-=.03;
  else if (speeder==false)
  this.speed+=.03;
/*  if(speeder==true&&sspeed1==true)
  {
    this.speed=1;
    sspeed1=false;
  }
  else if (speeder==false&&sspeed2==true)
  {
  this.speed=5;
  sspeed2=false;
  }*/
  }
 void update2()
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




