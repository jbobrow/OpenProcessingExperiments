
//Brandan H. Comp. 1 Block 7
ball Big;
void setup()
{
  Big = new ball();
  size(750, 750);
}

void draw()
{
  background(0);
  Big.move();
  Big.bounce();
  Big.show();
}

class ball
{
  int x;
  int y;
  boolean up, right;
  ball()
  {
    x=int(random(750));
    y=int(random(750));
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
    if (up == true)
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
    if (x<50)
    {
      right = true;
    }
    if (x>700)
    {
      right = false;
    }
    if (y<50)
    {
      up = false;
    }
    if (y>700)
    {
      up = true;
    }
  }

  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 100, 100);
  }
}
