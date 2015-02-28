
//Alvin Ha Computer Programming 4-5 Mr Simon
//Bouncing Ball

Ball bob;
void setup()
{
  size(400, 400);

  bob = new Ball();
}

void draw()
{
  background(0);
  bob.move();
  bob.show();
  bob.bounce();
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 0;
    y = 0;
    boolean up = false;
    boolean right = true;
  }
  void move()
  { 
    int q = int(random(0, 200));
    int w = int(random(0, 100));
    int e = int(random(0, 10));
    int r = int(random(0, 50));
    if ( right == true)
    {
      x = x + q;
    }
    else
    {
      x = x - w;
    }
    if (up == true)
    {
      y = y - e;
    }
    else
    {
      y= y + r;
    }
  }


  void bounce()
  {
    if (x<1)
    {
      right = true;
    }
    if (x>399)
    {
      right = false;
    }
    if (y>399)
    {
      up = true;
    }
    if (y<1)
    {
      up = false;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 30, 30);
  }
}
