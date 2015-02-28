
float predX;
float predY;
float targetX;
float targetY;

float timer;
float rate = 0;
SpriteObject nero;
SpriteObject neroSprite;
SpriteObject BK;
SpriteObject BK1;
SpriteObject BK2;
SpriteObject BK3;
SpriteObject BK4;
Predator ciel;
PImage WallachiaBG;
PImage CielBG;
boolean collision;

float easing = 0.02;

void setup()
{
  size(900, 600);
  
  WallachiaBG = loadImage("BG.png");
 CielBG = loadImage("CielBG.png");
   
   nero= new SpriteObject("nero.png");
  nero.y = 200;
  nero.directionX = 1;
  nero.directionY = 1;
  nero.speed = 5;
  nero.s = 0.7;
  
  BK = new SpriteObject("BKc.png");
  BK.y = 0;
  BK.x = 100;
  BK.directionX = 1;
  BK.directionY = 0.1;
  BK.speed = 30;
  BK.s = 0.05;
  
  BK1 = new SpriteObject("BK.png");
  BK1.y = 150;
  BK1.x = 100;
  BK1.directionX = 1;
  BK1.directionY = 0.1;
  BK1.speed = 30;
  BK1.s = 0.05;
  
   BK2 = new SpriteObject("BK.png");
  BK2.y = 250;
  BK2.x = 100;
  BK2.directionX = 1;
  BK2.directionY = 0.1;
  BK2.speed = 30;
  BK2.s = 0.05;
  
   BK3 = new SpriteObject("BK.png");
  BK3.y = 350;
  BK3.x = 100;
  BK3.directionX = 1;
  BK3.directionY = 0.1;
  BK3.speed = 30;
  BK3.s = 0.05;
  
   BK4 = new SpriteObject("BK.png");
  BK4.y = 450;
  BK4.x = 100;
  BK4.directionX = 1;
  BK4.directionY = 0.1;
  BK4.speed = 30;
  BK4.s = 0.05;
  
  
  ciel = new Predator("Ciel.png");
  ciel.y = 200;
  ciel.x = 300;
  ciel.directionX = 2;
  ciel.directionY= 3;
  ciel.s = 0.7;
  ciel.speed = 2;
}
   
 
 
void draw()
{
 
  image(WallachiaBG, 450,300,900,600);
  nero.update();
  nero.render();
  BK.update();
  BK.render();
  BK1.update();
  BK1.render();
  BK2.update();
  BK2.render();
  BK3.update();
  BK3.render();
  BK4.update();
  BK4.render();

  ciel.render();
  ciel.update();
  
  ciel.targetX = nero.x;
  ciel.targetY = nero.y;
   
   if(BK.isOverlapping(nero) && BK.destroyed == false)
   {
     collision = true;
     fill(255,0,0,100);
     rect(0,0,900,600);
     //nero.s -= 0.15;
     BK.destroyed = true;
     nero.destroyed = true;
    
   }
   
    if(BK1.isOverlapping(nero) && BK1.destroyed == false)
   {
     collision = true;
     fill(255,0,0,100);
     rect(0,0,900,600);
     nero.s -= 0.15;
     BK1.destroyed = true;
   
   } 
   
   
     if(BK2.isOverlapping(nero) && BK2.destroyed == false)
   {
     collision = true;
     fill(255,0,0,100);
     rect(0,0,900,600);
     nero.s -= 0.15;
     BK2.destroyed = true;
   }
   
     if(BK3.isOverlapping(nero) && BK3.destroyed == false)
   {
     collision = true;
     fill(255,0,0,100);
     rect(0,0,900,600);
     nero.s -= 0.15;
     BK3.destroyed = true;
   }
   
     if(BK4.isOverlapping(nero) && BK4.destroyed == false)
   {
     collision = true;
     fill(255,0,0,100);
     rect(0,0,900,600);
     nero.s -= 0.15;
     BK4.destroyed = true;
   }
   
if (timer > 4)
{
  ciel.s -= 0.012;
  }

if (timer > 5)
{
  image(CielBG, 450, 300, 900, 600);
  fill(255);
  textSize(25);
  text("GG Ciel wins again.", 25, 300);
  text("Black Keys OP. Pls nerf.", 25, 400);
}
  
timer += 0.0167;
 

}


class Predator extends SpriteObject
{
  
 float targetX;
 float targetY;
 float easing = 0.02;
  Predator(String filename)
  {
    super(filename);
  }
   
  void update()
  {
     
    float dx = targetX - x;
  if(abs(dx) > .01) {
    x += dx * easing;
  }
    
  float dy = targetY - y;
  if(abs(dy) > .01) {
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
  boolean destroyed = false;
     
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
      this.directionY =  -this.directionY;
     
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
    float waveSpeed = 4;
    float waveHeight = 4;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += offset;
    
    this.x += random(-4,4);
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
       
    if (loaded && destroyed == false)
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



