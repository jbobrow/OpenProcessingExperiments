
//Montana C

ball Ball;
void setup()
{
  Ball = new ball();
  size(500, 500);
}

void draw()
{
  background(0);
  Ball.movement();
  Ball.bounce();
  Ball.ball();
}

class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=false;
    right=false;
  }

  void movement()
  {
    if (right == true)
    {
      x+=4;
    }
    else
    {
      x-=4;
    }
    if (up == true)
    {
      y-=5;
    }
    else
    {
      y+=4;
    }
  }

  void bounce()
  {
    if (x<25)
    {
      right = true;
    }
    if (x>475)
    {
      right = false;
    }
    if (y<25)
    {
      up = false;
    }
    if (y>475)
    {
      up = true;
    }
  }

  void ball()
  {
    noStroke();
    fill(mouseX, mouseY, 255);
    ellipse(x, y, 50, 50);
  }
}
