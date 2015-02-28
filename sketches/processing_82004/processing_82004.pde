
//Hayley G, CP1, 14-15

Ball one;
void setup()
{
  one = new Ball();
  size(400,300); 
}
void draw()
{
  background(0);
  one.move();
  one.bounce();
  one.show();
}
class Ball
{
  int x,y;
  boolean right, down;
  Ball()
  {
    x = int(random(400));
    y = int(random(300));
  }
  void move()
  {
    if(right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if(down == true)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
  void bounce()
  {
    if(x-15 < 0)
    {
      right = true;
    }
    if (x+15 > 400)
    {
      right = false;
    }
    if (y-15 < 0)
    {
      down = true;
    }
    if (y+15 > 300)
    {
      down = false;
    }
  }
  void show()
  {
    ellipse(x,y,30,30);
  }
}
