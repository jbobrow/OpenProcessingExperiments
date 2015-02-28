
//Dan-Tran Cong-Huyen, Bouncing Ball, CP1 16/17
Ball bob;
Ball smith;
void setup()
{
  size(500, 500);
  bob = new Ball();
  smith = new Ball();
}
void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
  smith.move();
  smith.show();
  smith.bounce();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(500));
    y = int(random(500));
    up = false;
    right = false;
  }
  void move()
  {
    if (right == false)
    {
      x++;
    }
    else
    {
      x--;
    }
    if (up == false)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
  void show()
  {
    fill(random(255), random(255), random(255));
    ellipse(x, y, 35, 35);
  }
  void bounce()
  {
    if (x > 500)
    {
      right = true;
    }
    if (x < 0)
    {
      right = false;
    }
    if (y > 500)
    {
      up = true;
    }
    if ( y < 0)
    {
      up = false;
    }
  }
}
