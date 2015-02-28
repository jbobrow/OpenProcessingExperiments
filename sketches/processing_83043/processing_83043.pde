
ball kite = new ball();

void setup() 
{
  size(500, 500);
}
void draw()
{
  background(50);
  kite.move();
  kite.bounce();
  kite.show();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=100;
    y=300;
    up=true;
    right=true;
  }
  void move()
  {
    if (up == true)
    {
      y--;
    }
    if (up == false)
    {
      y++;
    }
    if (right == true)
    {
      x++;
    }
    if (right == false)
    {
      x--;
    }
  }
  void bounce()
  {
    if (x >= 490)
    {
      right = false;
    }
    if (x <= 0)
    { 
      right = true;
    }
    if (y >= 490)
    {
      up = true;
    }
    if (y <= 0)
    { 
      up = false;
    }
  }
  void show()
  {
    noStroke();
    smooth();
    fill(195,125,23);
    ellipse(x, y, 50, 50);
  }
}
