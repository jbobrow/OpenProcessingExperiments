
// Lucky Wen, Bouncing Ball, CP1 mods 16-17


ball bob;

void setup()
{
  bob= new ball();
  size(400, 400);
  frameRate(150);
}

void draw()
{
  background (0, 0, 0);
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
    x=int (random(400));
    y=int(random(400));
    up=true;
    right=true;
  }

  void move()
  {
    if (up== true)
    {

      y--;
    }
    else
    {

      y++;
    }
    if (right== true)
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
    if (x>345)
    {

      right = false;
    }
    if (x<60)
    {

      right = true;
    }
    if (y>345)
    {

      up= true;
    }
    if (y<60)
    {

      up= false;
    }
  }

  void show()
  {
    smooth();
    fill(#67D5F2);
    ellipse(x, y, 125, 125);
    fill(#FADE0A);
    ellipse(x, y, 100, 100);
    fill(255, 0, 0);
    ellipse(x, y, 75, 75);
    fill(#AF0AF7);
    ellipse(x, y, 50, 50);
    fill(#06B724);
    ellipse(x, y, 25, 25);
  }
}
