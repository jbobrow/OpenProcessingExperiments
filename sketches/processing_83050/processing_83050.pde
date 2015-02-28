
Ball awxrus[];
void setup()
{
  size(600, 600);
  awxrus = new Ball[50];
  for (int i = 0; i<50; i++)
  {
    awxrus[i] = new Ball();
  }
  frameRate(60);
}
void draw()
{
  background(0);
  for (int i = 0; i<50; i++)
  {
    awxrus[i].getbig();
    awxrus[i].bounce();
    awxrus[i].appear();
    awxrus[i].move();
  }
}
class Ball
{
  float rad, x, y;
  boolean up, right;
  Ball()
  {
    x=random(width);
    y=random(height);
    rad = 10;
    up = random(1) < .5;
    right = true;
  }
  void getbig()
  {
    if (x>=width || y>=height)
    {
      rad++;
    }
    if (x<=0 || y<=0)
    {
      rad++;
    }
  }
  void appear()
  {
    fill(random(255), random(255), random(255));
    ellipse(x, y, rad, rad);
  }
  void bounce()
  {
    if (x>=width)
    {
      right = false;
    }
    if (y>=height)
    {
      up = true;
    }
    if (x<=0)
    {
      right = true;
    }
    if (y <= 0)
    {
      up = false;
    }
  }
  void move()
  {
    if (right == false)
    {
      x--;
    }
    else
    {
      x++;
    }
    if (up == false)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
}
