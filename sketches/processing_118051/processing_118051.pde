
PImage dying;
PImage back;
float timer=0;
float r=255;
float b=255;
float ro=0;
float a;
float c;
float easing=0.05;
float tx=450;
float tt=50;
float sc=1;
SpriteObject sinji;
Predator icecream;
void setup()
{
  size(800,500);
  dying=requestImage("lol.JPG");
  back=requestImage("backround.jpg");
  sinji= new SpriteObject("bannana.jpg");
  sinji.directionX+=1;
  sinji.directionY+=1;
  sinji.w=100;
  sinji.h=100;
  sinji.x=100;
  sinji.y=100;
  sinji.speed=3;
  icecream=new Predator("icecream.jpg");
  icecream.w=50;
  icecream.h=50;
  icecream.x=5;
  icecream.y=5;
  icecream.speed=1;
}
void draw()
{
  if(back.width>0)
  {
  imageMode(CORNER);
  image(back,0,0,800,500);
  timer+=0.0167;
    sinji.update();

  icecream.update();
  icecream.render();
  icecream.x=a;
  icecream.y=c;
  if (icecream.isOverlapping(sinji))
  {
     tint(255, 0, 0); 
     sinji.s *= 0.95;
  }
  else
  {
    icecream.s = 1;
    sinji.s+=.001;
    tint(255);
  }
    sinji.render();
  tint(255);
  if (timer<9 && r>0 && b>0)
  {
    tt+=1;
    tx+=random(-2,2);
    r-=0.5;
    b-=0.5;
  }
  tint(r,255,b);
if(timer>9)
{
 ro+=.05;
 sc-=0.005;
 if(sc<0)
 {
   sc=0;
 }
}
imageMode(CENTER);
pushMatrix();
translate(tt,tx);
rotate(ro);
scale(sc);
  image(dying,0,0,100,100);
  popMatrix(); 
 tint(255,255,255); 

}
}
class Predator extends SpriteObject
{
  Predator(String filename)
  {
    super(filename);
  }
 void update()
{ 

  float targetX=sinji.x;
  float targetY=sinji.y;
  float dx=targetX-x;
  float dy=targetY-y;
  if(abs(dx)>1)
  {
    a+=dx*easing;
  }
  if(abs(dy)>1)
  {
    c+=dy*easing;
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
    this.y+=directionY*speed;
    this.x+=directionX*speed;
    //sine wave
    float waveSpeed=4;
    float waveHeight=4;
    float angle=this.x*waveSpeed;
    float offset= sin(radians(angle))*waveHeight;
    this.y+=offset;
    this.x+=random(2);
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




