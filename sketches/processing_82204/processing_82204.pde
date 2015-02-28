
//Jonathan Huang, CP 1, Mods 16/17

Ball ball;
void setup()
{
  frameRate(2100);
  size(400, 500);
  ball= new Ball();
}
void draw()
{
  background(0);
  ball.move();
  ball.bounce();
  ball.show();
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x =200;
    y =250;
  }
  void move()
  {
    if (up == true)
    {
      y++;
    }
    if (up == false)
    {
      y--;
    }
    if (right ==true)
    {
      x++;
    }
    if (right ==false)
    {
      x--;
    }
  }
  void bounce()
  {
    if (x>400)
    {
      right = false;
    }
    if (x<0)
    {
      right = true;
    }
    if (y>500)
    {
      up = false;
    }
    if (y<0)
    {
      up= true;
    }
  }
  void show()
  {
    ellipse (x, y, 50, 50);
  }
}
