
//Victor Murillo, CP1, mods 16-17, Bouncing Ball
ball bob;
void setup()
{
  bob = new ball();
  frameRate(130);
  size(500, 500);
}
void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
}

class ball
{
  int x;
  int y;
  boolean up, right;
  ball()
  {
    x = 40;
    y = 300;
    up = true;
    right = true;
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
    if (up == true)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
    void bounce()
    {
      if(x < 20)
      {
        right = true;
      }
      if(y < 20)
      {
        up = true;
      }
      if(x > 480)
      {
        right = false;
      }
      if(y > 480)
      {
        up = false;
      }
    }
    void show()
    {
      ellipse(x, y, 50, 50);
    }
  }
