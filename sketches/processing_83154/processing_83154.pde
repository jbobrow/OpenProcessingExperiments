
//Jeffrey C.  CP1 4-5 Bouncing Ball 12/14/12
//URL: http://www.openprocessing.org/user/21148
ball One;
void setup()
{
  One = new ball();
  size(500, 500);
}

void draw()
{
  background(0);
  One.move();
  One.bounce();
  One.show();
}
 
class ball
{
  int x;
  int y;
  boolean up, right;
  ball()
  {
    x=int(random(750));
    y=int(random(750));
    up=false;
    right=false;
  }
 
 
  void move()
  {
    if (right == true)
    {
      x+=4;
    }
    else
    {
      x-=3;
    }
    if (up == true)
    {
      y-=6;
    }
    else
    {
      y+=4;
    }
  }
 
  void bounce()
  {
    if (x<50)
    {
      right = true;
    }
    if (x>450)
    {
      right = false;
    }
    if (y<50)
    {
      up = false;
    }
    if (y>450)
    {
      up = true;
    }
  }
 
  void show()
  {
    noStroke();
    fill(0,0,255);
    ellipse(x, y, 100, 100);
  }
}


