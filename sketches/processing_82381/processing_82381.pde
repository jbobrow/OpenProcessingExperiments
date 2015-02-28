
//brendan m computer programming 1 mods 4-5
ball Bengt;
void setup()
{

  size (600,400);
  smooth();
  frameRate(random(30,300));
  Bengt = new ball();
}
void draw()
{
  background (random(50));
  Bengt.closet();
  Bengt.stuff();
  Bengt.hunt();
}
class ball
{
  int x,y;
  boolean u,r;
  
  ball()
  {
    x=int (random (600));
    y=int (random (400));
    u= false;
    r= false;
  }
  
  void closet()
  {
    stroke(0);
    fill(255,600-x,y);
    ellipse(x, y, 50, 50);
  }

  void stuff()
  {
    if (x<10)
    {
      r = true;
    }
    if (x>590)
    {
      r = false;
    }
    if (y<10)
    {
      u = false;
    }
    if (y>390)
    {
      u = true;
    }

  }
  void hunt()
  {
    if (r == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (u == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }

  }}
