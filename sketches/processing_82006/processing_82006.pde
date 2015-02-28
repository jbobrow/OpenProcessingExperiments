
ball bob;
void setup ()
{
  bob = new ball ();
  size(300, 300);
  frameRate(100);
}

void draw ()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
}

class ball
{
  int x, y;
  boolean up, right;

  ball()
  {
    x = int(random(300));
    y = int(random(300));
    up = true;
    right = true;
  }

  void move ()
  {
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }

  void bounce ()
  {
    if (x == 300)
    {
      right = false;
    }
    if (x == 0)
    {
      right = true;
    }
    if (y == 300)
    {
      up = true;
    }
    if (y == 0)
    {
      up = false;
    }
  }

  void show ()
  {
    fill(255);
    ellipse(x, y, 30, 30);
  }
}
