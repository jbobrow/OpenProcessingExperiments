
// Justin L., CP1 Mods 16/17: Bouncing Ball

Ball bob;
void setup()
{
  bob = new Ball();
  size(600, 600);
}
void draw()
{
  background(255);
  bob.move();
  bob.bounce();
  bob.show();
  fill(25,25,25);
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(600));
    y = int(random(600));
    up = true;
    right = true;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x>600)
    {
      right = false;
    }
    if (x<0)
    {
      right = true;
    }
    if (y>600)
    {
      up = true;
    }
    if (y<0)
    {
      up = false;
    }
  }
  void show()
  {
    ellipse(x, y, 40, 40);
  }
}
