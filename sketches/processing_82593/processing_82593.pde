
//Jenny H. CP1 Mods 14/15, Bouncing Ball
Ball sam;
Ball bob;
void setup ()
{
  sam = new Ball();
  bob = new Ball();
  size (500,300);
}
void draw ()
{
  background (0,0,0);
  bob.show();
  bob.move();
  bob.bounce();
  sam.show();
  sam.move();
  sam.bounce();
}
class Ball
{
  
  int x;
  int y;
  boolean leftRight;
  boolean upDown;
  Ball ()
  {
    x = int(random(0,501));
    y = int(random(0,301));
    leftRight = true;
    upDown = true;
  }
  void show()
  {
    fill (random(0,50), random(0,156),random(0,256));
    ellipse (x,y,50,50);
  }
  void move ()
  {
    if (leftRight == true)
    {
      x=x+5;
    }else
    {
      x=x-5;
    }
    if (upDown == true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
  }
  void bounce ()
  {
    if (x<0)
    {
      leftRight = true;
    }
    else if (x>500)
    {
      leftRight = false;
    }
    if (y<0)
    {
      upDown = false;
    }
    else if (y>300)
    {
      upDown = true;
    }
  }
}
