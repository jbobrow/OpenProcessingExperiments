
Ball joe;
void setup()
{
  joe = new Ball();
  size(400,400);
}
void draw()
{
  background(0,0,0);
  fill(random(255),random(255),random(255));
  joe.move();
  joe.bounce();
  joe.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 0;
    y = 0;
    up= false;
    right= true;
  }
  void move()
  {
    if(right == true)
    {
      x= x + 5;
    }
    else
    {
      x = x - 5;
    }
    if(up == true)
    {
      y= y - 3;
    }
    else
    {
      y = y + 3;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }
    else if (x > 400)
    {
      right = false;
    }
    if (y < 0)
    {
      up = false;
    }
    else if (y > 400)
    {
      up = true;
    }
  }
  void show()
  {
    ellipse(x,y,40,40);
  }
}

