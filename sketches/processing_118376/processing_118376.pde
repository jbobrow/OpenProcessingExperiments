
Predator wAngel;
SpriteObject kid;
SpriteObject epic;
SpriteObject slendy;
SpriteObject troll;
SpriteObject forest;
boolean starter=false;
float timer;
void setup()
{
  size(800,650);
  forest=new SpriteObject("sforest.jpg");
  forest.x=400;
  forest.y=330;
  forest.s=3.7;
  troll=new SpriteObject("troll.jpg");
   troll.x=400;
  troll.y=300;
  troll.s=3.2;
    slendy=new SpriteObject("Slender_Man.png");
    slendy.x=400;
    slendy.y=300;
    slendy.s=.5;
  epic=new SpriteObject("epicslender.jpg");
  epic.x=400;
  epic.y=300;
  epic.s=3.5;
  wAngel=new Predator("wAngel.jpg");
  wAngel.directionX = 1;
  wAngel.directionY = 1;
  wAngel.s=.4;
  wAngel.x=80;
  wAngel.y=80;
  wAngel.easing=.07;
  kid=new SpriteObject("kid.jpg");
  kid.directionX = 1;
  kid.directionY = 1;
  kid.s=.2;
  kid.x=200;
  kid.y=200;
  kid.speed=15;
}
void draw()
{
    background(0);

    epic.render();

  if(starter==true)
  {
  background(0);
 forest.render();
  kid.update101();

   wAngel.targetX=kid.x;
  wAngel.targetY=kid.y;
  wAngel.update1();
  if(kid.speed>0)
  wAngel.render();
  else if (wAngel.y<590)
    wAngel.render();
    if(kid.speed>0)
    kid.render();
    if (kid.speed<=0)
    wAngel.s=.6;
    if(wAngel.y>700)
    {
      int picker=(int)random(1,2);
      if(picker==1)
      slendy.render();
      slendy.s+=.001;
      slendy.y+=.5;
       timer+=.01;
      println(timer);
     // else if(picker==2
    }
    if (timer>=10 && timer<=11)
    {
      background(255);
    troll.render();
    }
    if (timer>=11)
    {
      background(255);
    textSize(60);
  fill(255,0,0);
    text("YOU MAD BRO?!!",160,200);
    }
 // slendy.targetX=rake1.x;
 // slendy.targetY=rake1.y;  
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
    this.y += directionY * speed;
    this.x += directionX * speed;
    float rd= radians(this.x * speed);
    this.y = this.y + cos(rd) * 1;
  }
 void update101()
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
     speed-=.005;
     if(speed<=0)
     speed=0;
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    float rd= radians(this.x * speed);
    this.y = this.y + cos(rd) * 1;
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
class Predator extends SpriteObject
{
   float targetX;
      float targetY;
            float easing = 0.005;
           float preX;
           float preY;
 
  Predator(String filename)
  {
    super(filename);
  }
    void update1()
    {
      
       
  //     targetX = rake1.x;
  float dx = targetX - this.x;
  if(abs(dx) > 3)
   
    this.x += dx * easing;
   
  //    targetY = rake1.y;
  float dy = targetY - this.y;
  if(abs(dy) > 3)
   
    this.y += dy * easing;
   
//this.x = preX;
 ///this.y=preY;
 
   
}
}

void keyReleased()
{
  if (key == ' ')
  {
    starter=true;
  }
}


