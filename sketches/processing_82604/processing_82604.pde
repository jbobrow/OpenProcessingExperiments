
Ball will;
void setup()
{
  size(500, 400);
  background(0);
  will = new Ball();
}
void draw()
{
  background(0);
  will.move();
  will.bounce();
  will.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=250;
    y=200;
    up=true;
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
    if (y>400)
    {
      up=true;
    }
    if (y<0)
    {
      up=false;
    }
    if (x>500)
    {
      right=false;
    }
    if (x<0)
    {
      right=true;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
