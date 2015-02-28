
ball pong=new ball();
void setup()
{
  background(0);
  size(400, 400);
}
void draw()
{
  pong.move();
  pong.bounce();
  pong.show();
}
class ball
{
  int a, x, y, l, m, n, lm;
  boolean right, up, ismoving;
  ball()
  {
    ismoving=true;
    lm=20;
    l=255;
    m=255;
    n=255;
    a=1;
    x=50;
    y=170;
    right=true;
    up=true;
  }
  void move()
  {
    if (ismoving==true)
    {
      if (get( x+10, y) == color(0, 255, 0))
      {
        right=false;
      }
      if (get( x+10, y) == color(0, 254, 0))
      {
        a=0;
        println("green loses");
      }

      if (get( x-10, y) == color(255, 0, 0))
      {
        right=true;
      }
      if (get( x-10, y) == color(254, 0, 0))
      {
        a=0;


        println("red loses");
      }

      if (up==true & a==1)
      {
        y--;
      }
      if (up==false & a==1)
      {
        y++;
      }
      if (right==true & a==1)
      {
        x++;
      }
      if (right==false & a==1)
      {
        x--;
      }
    }
  }
  void bounce()
  {
    if (ismoving==true)
    {
      if (x<10)
      {
        right=true;
      }
      if (x>390)
      {
        right=false;
      }
      if (y<10)
      {
        up=false;
      }
      if (y>390)
      {
        up=true;
      }
    }
  }
  void show()
  {
    if (ismoving==true)
    {
      noStroke();
      background(0);
      fill(l, m, n);
      ellipse(x, y, lm, lm);
    }
  }
}
