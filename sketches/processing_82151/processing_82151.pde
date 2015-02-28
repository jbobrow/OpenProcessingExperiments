
Ball Angela;
void setup()
{
  size(500, 400);
  frameRate(100);
  Angela = new Ball();
}
void draw()
{
  stroke(255);
  background(0);
  Angela.move();
  Angela.bounce();
  Angela.show();
}
class Ball
{
  int x;
  int y;
  boolean up, right;
  Ball()
  {
    x=0;
    y=100;
  }

    void move()
    {
      if (right==true)
      {
        x++;
      }
      if (right==false)
      {
        x--;
      }
      if (up==true)
      {
        y++;
      }
      if (up==false)
      {
        y--;
      }
    }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }  
    if (x > 500)
    {
      right = false;
    }
    if (y<0)
    {
      up=true;
    }
    if (y > 400)
    {
      up=false;
    }
  }
  void show()
  {
    ellipse(x, y,10,10);
  }
}
