
Ball bob;
void setup()
{
  size(500,500);
  bob = new Ball();
}
void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x= int(random(500));
    y= int(random(500));
    up=false;
    right=false;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    if(up==false)
    {
      y++;
    }
    if(right==true)
    {
      x++;
    }
    if(right==false)
    {
      x--;
    }
  }
  void bounce()
  {
    if(x<1)
    {
      right=true;
    }
    if(x>499)
    {
      right=false;
    }
    if(y<1)
    {
      up=false;
    }
    if(y>499)
    {
      up=true;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x,y,10,10);
  }
}


