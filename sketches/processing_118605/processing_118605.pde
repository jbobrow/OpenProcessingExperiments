
SpriteObject power;
SpriteObject megazord;
SpriteObject goldar;
SpriteObject megagoldar;
SpriteObject putty1;
SpriteObject putty2;
SpriteObject angel;
float spawn = 0;

void setup()
{
  size(500,500);
  
    angel = new SpriteObject("aghs-front.jpg");
  angel.s = 1.5;
  angel.x = width/2;
  angel.y = height/2;
  
  power = new SpriteObject("powerrangerspowerrangersmmpr.jpg");
  power.x = 100;
  power.y = 100;
  power.speed = .9;
  power.s = .1;
  power.directionX = random(5);
  power.directionY = random(5);
  
  megazord = new SpriteObject("Mmpr-zd-megazord.jpg");
  megazord.x = 100;
  megazord.y = 100;
  megazord.s = .5;
  megazord.speed = .5;
  megazord.directionX = random(5);
  megazord.directionY = random(5);
  
  goldar = new SpriteObject("mmpr-vi-goldar.jpg");
  goldar.x = 350;
  goldar.y = 350;
  goldar.speed = .8;
  goldar.s = .5;
  goldar.directionX = random(10);
  goldar.directionY = random(10);
  
  megagoldar = new SpriteObject("13.jpg");
  megagoldar.x = 450;
  megagoldar.y = 450;
  megagoldar.s = .7;
  megagoldar.speed = .5;
  megagoldar.directionX = random(5);
  megagoldar.directionY = random(5);
  
  putty1 = new SpriteObject("389120.jpg");
  putty1.x = random(500);
  putty1.y = random(500);
  putty1.speed = .4;
  putty1.s = .3;
  putty1.directionX = random(5);
  putty1.directionY = random(5);
  
  putty2 = new SpriteObject("putty.jpg");
  putty2.x = random(500);
  putty2.y = random(500);
 putty2.speed = .4;
 putty2.s = .3;
  putty2.directionX = random(5);
  putty2.directionY = random(5);
  
}

void draw()
{
  spawn += 0.025;
  
  if (goldar.isOverlapping(power) == true)
  {
    power.s = -.000000000000000000001;
    goldar.s = 0;
  }
  
  if (megazord.isOverlapping(megagoldar) == true)
  {
    megagoldar.s = 0;
    megazord.speed = 5;
  }
  
  angel.render();
  power.update();
  power.render();
  goldar.update();
  goldar.render();
  putty1.update();
  putty1.render();
  putty2.update();
  putty2.render();
 if (power.s < 0)
 { megazord.update();
    megazord.render();
    megagoldar.update();
    megagoldar.render();
 }
 if (spawn > 5)
 { putty1.s = 0;
 putty2.s = 0;
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




