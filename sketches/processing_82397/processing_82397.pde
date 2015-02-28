
Ball henry;
void setup()
{
  size(500,500);
  henry = new Ball();
}
void draw()
{
  background(0);
  henry.move();
  henry.bounce();
  henry.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = 170;
    y = 220;
    up = true;
    right = true;
  }
  void move()
  {
    if(up == true)
    {
       y--;
    }
    else
    {
      y++;
    }
    if( right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if(x <= 0) 
    {
      right = true;
    }
    if( x >= 500)
    {
      right = false;
    }
    if(y <= 0) 
    {
      up = false;
    }
    if( y >= 500)
    {
      up = true;
    }
  }
  void show()
  {
    ellipse(x,y,30,30);
  }
}
