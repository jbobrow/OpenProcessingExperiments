
//Perry Phan, comp. prog 4/5, Bouncing Ball 
Ball perry;
void setup()
{
  perry = new Ball();
  size(500, 500);
}
void draw()
{
  background (0, 0, 0);
  perry.show();
  perry.bounce();
  perry.move();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(300));
    y=int(random(300));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
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
  void show()
  {
    ellipse(x, y, 50, 50);
  }
  void bounce()
  {
    if (x<0)
    {
      right=true;
    }
    if (x>500)
    {
      right=false;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>500)
    {
      up=true;
    }
  }
}
