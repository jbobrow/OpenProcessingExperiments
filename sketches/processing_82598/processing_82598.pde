
//Andy M , CP 1, Mods 14/15

Ball oon;
void setup()
{
  size(300,350);
  oon =  new Ball();
}
void draw()
{
  background(0);
  oon.balloon();
  oon.move();
  oon.bounce();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = int(random(300));
    y = int(random(350)); 
    up = false;
    right = false;
  }
  void balloon()
{
  fill(random(255),random(255),255);
  ellipse (x,y,25,25);
}
  void move()
  {
    if (right == true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
    if (up == true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
  }
  void bounce()
  {
    if (x<5)
    {
      right = true;
    }
    if (x>295)
    {
      right = false;
    }
    if (y<5)
    {
      up = false;
    }
    if (y>345)
    {
      up = true;
    }
  }
}
