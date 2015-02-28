
Ball circle;
void setup()
{
  size(500, 500);
  circle = new Ball();
}
void draw()
{
  background(0);
  circle.move();
  circle.bounce();
  circle.show();
}

class Ball
{
  int x, y;
  boolean up, left;
  Ball()
  {
    x = int(random(50, 450));
    y = int(random(50, 450));
    up = true;
    left = false;
  }
  void move()
  {
    if (up)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (left)
    {
      x--;
    }
    else
    {
      x++;
    }
  }
  void bounce()
  {
    if (x <= 0 || x >= 500)
    {
      left =! left;
    }
    if (y - 15 < 0 || y + 15 >= 500)
    {
      up =! up;
    }
  }
  void show()
  {
    fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
    ellipse(x, y, 15, 15);
  }
}
