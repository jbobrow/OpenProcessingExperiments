
//Em Fong, CP1 Mods 4-5, Bouncing Ball

Ball Baozi;
void setup()
{
  Baozi = new Ball();
  size (300, 300);
}
void draw ()
{
  background (0);
  Baozi.move();
  Baozi.bounce();
  Baozi.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 150;
    y = 9;
    up = false;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x++;
    }
    else if (right !=true)
    {
      x--;
    }
    if (up == true)
    {
      y--;
    }
    else if (up != true)
    {
      y++;
    }
  }
  void bounce ()
  {
    if (x > 291)
    {
      right = false;
    }
    if (x < 9)
    {
      right = true;
    }
    if (y > 291)
    {
      up = true;
    }
    if (y < 9)
    {
      up = false;
    }
  }
  void show()
  {
    fill (255);
    ellipse (x, y, 20, 20);
  }
}
