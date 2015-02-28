
ball bob;
void setup()
{
  size(300, 300);
  smooth();
  bob=new ball();
}
void draw()
{
  background(0);
  bob.show();
  bob.move();
  bob.bounce();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=0;
    y=150;
    up=false;
    right=true;
  }
  void move()
  {
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
  }
  void bounce()
  {
    if (x<0)
    {
      right=true;
    }
    if (x>width)
    {
      right=false;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>height)
    {
      up=true;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}



