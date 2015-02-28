
Ball bob;
void setup()
{
  bob=new Ball();
  size(500, 500);
}
void draw()
{ 
  background(0);
  frameRate(70);
  bob.move();
  bob.bounce();
  bob.show();
}
class Ball 
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=10;
    y=250;
    up=true;
    right=true;
  }
  void move()
  { 
    if (up==true)
    {
      y=y+2;
    }
    if (up==false)
    {
      y=y-2;
    }
    if (right==true)
    {
      x=x+2;
    }
    if (right==false)
    {
      x=x-2;
    }
  }
  void bounce()
  {
    if (y<=10)
    {
      up=true;
    }
    if (y>=495)
    {
      up=false;
    }
    if (x<=10)
    {
      right=true;
    }
    if (x>=495)
    {
      right=false;
    }
  }
  void show()

  {
   
    if (up==false)
    {
      fill(0, 255, 0);
      ellipse(x, y, 100, 100);
    }
    else if (up==true)
    { 
      fill(255, 0, 0);
      ellipse(x, y, 50, 50);
    }
  
  }
}
