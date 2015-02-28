
ball Ball;
void setup()
{
  Ball = new ball();
  size(500,500);
}
  
void draw()
{
  background(0);
  Ball.move();
  Ball.bounce();
  Ball.show();
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
    if (x<15)
    {
      right = true;
    }
    if (x>485)
    {
      right = false;
    }
    if (y<15)
    {
      up = false;
    }
    if (y>485)
    {
      up = true;
    }
  }
  
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 30, 30);
  }
}
