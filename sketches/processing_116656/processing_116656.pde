
SpriteObject lol;
float x1=20;
float y1=15;
float x2=80;
float y2=15;
float x3=160;
float y3=15;
float x4=240;
float y4=15;
float x5=320;
float y5=15;
float x6=400;
float y6=15;
float x7=450;
float y7=15;
float x8=480;
float y8=15;
float x=0;
float left=0;
float right=0;
float speed=3.0;
void setup()
{
    
  size(500,500);
  lol=new SpriteObject("lol.JPG");
  lol.x=0;
  lol.y=450;
  lol.s=0.1;
}
void draw()
{
  background(0);
  lol.x+=x;
x+=(right-left);
if(lol.x>500 || lol.x<0)
{
  lol.x=0;
}
  //float left = lol.x - (lol.w * 0.5 * lol.s);
  //float right = lol.x + (lol.w * 0.5 * lol.s);
  //float top = lol.y - (lol.h * 0.5 * lol.s);
  //float bottom = lol.y + (lol.h * 0.5 * lol.s);
ellipse(x1,y1,30,30);
  ellipse(x2,y2,30,30);
ellipse(x3,y3,30,30);
ellipse(x4,y4,30,30);
ellipse(x5,y5,30,30);
ellipse(x6,y6,30,30);
ellipse(x7,y7,30,30);
ellipse(x8,y8,30,30);
lol.render();
y1+=1;
y2+=2;
y3+=3;
y4+=4;
y5+=5;
y6+=6;
y7+=7;
y8+=8;

if(y8>500)
{
  y8=0;
}
if(y7>500)
{
  y7=0;
}
if(y6>500)
{
  y6=0;
}
if(y5>500)
{
  y5=0;
}
if(y4>500)
{
  y4=0;
}
if(y3>500)
{
  y3=0;
}
if(y2>500)
{
  y2=0;
}
if(y1>500)
{
  y1=0;
}
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
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
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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






