
//Eric Trinh, BouncingBall, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/BouncingBall.html

eric Ball;
void setup()
{
  Ball = new eric();
  size(400, 400);
}
void draw()
{
  Ball.move();
  Ball.bounce();
  background(0);
  Ball.exist();
  }
  class eric
{
  int x, y;
  boolean up, right;
  eric()
  {
    x = int(random(400));
    y = int(random(400));
    up = false;
    right = false;
  }
  void exist()
  {
    fill(int(random(255)));
    ellipse(x, y, 25, 25);
  }
  void move()
  {
    if (right == true)
    {
      x+=3;
    }
    else
    {
      x-=3;
    }
    if (up == true)
    {
      y-=3;
    }
    else
    {
      y+=3;
    }
  }
  void bounce()
  {
    if (x < 20)
    {
      right = true;
    }
    if (x > 380)
    {
      right = false;
    }
    if (y < 20)
    {
      up = false;
    }
    if (y > 380)
    {
      up = true;
    }
  }
}
