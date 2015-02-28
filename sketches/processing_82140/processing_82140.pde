
//Sydney C. CP 1 Mods: 4/5 Bouncing Ball
ball Owen;
void setup()
{
  Owen = new ball();
  size(300,300);
}

void draw()
{
  background(0);
  Owen.move();
  Owen.bounce();
  Owen.show();
}

class ball
{
  int x, y;
  boolean up, right;
  ball()
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
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
  }

  void bounce()
  {
    if (x<25)
    {
      right = true;
    }
    if (x>275)
    {
      right = false;
    }
    if (y<25)
    {
      up = false;
    }
    if (y>275)
    {
      up = true;
    }
  }

  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 50, 50);
  }
}
