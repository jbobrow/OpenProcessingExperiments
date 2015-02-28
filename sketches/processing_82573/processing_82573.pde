
ball pong=new ball();
paddle player=new paddle();
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
  player.show();
  player.player();
}
class paddle
{
  int r, z, b, c, d, x, y ;
  paddle()
  {
    z=175;
  }
  void show()
  {
    fill(b, c, d);
    rect(z, r, x, y);
  }
  void player()
  {
    x=80;
    y=20;
    c=255;

    r=385;
  }
}
class ball
{
  int a, x, y, l, m, n, lm,z;
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
    z=3;
    right=true;
    up=true;
  }
  void move()
  {
    if (ismoving==true)
    {
      if (get( x, y+10) == color(0, 255, 0))
      {
        up=true;
      }
      //      if (get( x-10, y) == color(255, 0, 0))
      //      {
      //        right=true;
      //      }
      if (up==true & a==1)
      {
        y=y-z;
      }
      if (up==false & a==1)
      {
        y=y+z;
      }
      if (right==true & a==1)
      {
        x=x+z;
      }
      if (right==false & a==1)
      {
        x=x-z;
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
void keyPressed()
{
  if (keyCode ==RIGHT)
  {
    player.z=player.z+10;
  }
  if (keyCode ==LEFT)
  {
    player.z=player.z-10;
  }
}
