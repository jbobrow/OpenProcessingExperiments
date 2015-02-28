
ball Preston;
void setup()
{
  Preston= new ball();
  size(600, 600);
}
void draw()
{
  background(0);
  Preston.movement();
  Preston.bounce();
  Preston.ball();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(600));
    y=int(random(600));
    up=false;
    right=false;
  }
  void movement()
  {
    if (right==true)
    {
      x+=5;
    }
    else
    {
      x-=5;
    }
    if (up==true)
    {
      y-=5;
    }
    else
    {
      y+=5;
    }
  }
  void bounce()
  {
    if (x<25)
    {
      right=true;
    }
    if (x>575)
    {
      right=false;
    }
    if (y<25)
    {
      up=false;
    }
    if (y>575)
    {
      up=true;
    }
  }
  void ball()
  {
    noStroke();
    fill(255, 255, 255);
    ellipse(x, y, 50, 50);
  }
}



