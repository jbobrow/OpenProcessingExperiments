
Ball bob;
void setup()
{ 
  size(600, 600);
  fill(random(255), random(255), random(255));
  bob = new Ball();
}
void draw()
{
  background(0);
  bob.show();
  bob.move();
  bob.bounce();
}

class Ball
{
  int x, y;
  boolean up, left;
  Ball()
  {
    x=int(random(600));
    y=int(random(600));
    up=random(1)<.5;
    left=random(1)<.5;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (left==true)
    {
      x--;
    }
    else
    {
      x++;
    }
  }
  void bounce()
  {
    if (x<0)
    {
      left=false;
    }
    if (x>600)
    {
      left=true;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>600)
    {
      up=true;
    }
  }
  void show()
  {

    ellipse(x, y, 10, 10);
  }
}



