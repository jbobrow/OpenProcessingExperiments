
//Michelle Z, CP1 4-5, Bouncing Ball

Ball A = new Ball();

void setup()
{
  size (400,300);
}
void draw()
{
  background(0);
  A.move();
  A.bounce();
  A.show();
}
class Ball
{
  int x, y;
  boolean dirUp, dirRight;
  Ball()
  {
    x = int(random(300));
    y = int(random(300));
    dirUp = true;
    dirRight = true;
  }
  void move()
  {
    if (dirRight == true)
    {
      x = x + 3;
    }
    else
    {
      x = x - 3;
    }
    if (dirUp == true)
    {
      y = y - 3;
    }
    else
    {
      y = y + 3;
    }
  }
  void bounce()
  {
    if (x > 390)
    {
      dirRight = false;
    }
    else if (x < 10)
    {
      dirRight = true;
    }
    if (y < 10)
    {
      dirUp = false;
    }
    else if (y > 290)
    {
      dirUp = true;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}

