
//Wayland L, Bouncing Ball, CP1,16-17
Ball me;
Ball you;
void setup()
{

  size(500, 500);
  background(0);
  me = new Ball();
  you = new Ball();
}
void draw()
{
  background(0);
  me.move();
  me.bounce();
  me.show();
  you.move();
  you.bounce();
  you.show();
}


class Ball
{
  int x, y;
  boolean right, up;
  Ball()
  {
    x = 0;
    y = int(random(250, 500));
    up = false;
    right = true;
  }
  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
    if (right==true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
  }
  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    else if (x>500)
    {
      right=false;
    }
    if (y<0)
    {
      up = false;
    }
    else if (y>500)
    {
      up = true;
    }
  }
  void show()
  {
    fill(0, 255, 0);
    ellipse(x, y, 10, 10);
  }
}
