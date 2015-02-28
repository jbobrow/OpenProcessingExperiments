
ball F = new ball();
void setup()
{
  size(600, 600); 
  frameRate(100); 
}
void draw() 
{
  background(0);
  F.show();
  F.bounce();
  F.move();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=100;
    y=300;
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    if (up==false)
    {
      y++;
    }
    if (right==true)
    {
      x++;
    }
    if (right==false)
    {
      x--;
    }
  }
  void bounce()
  {
    if (y>=600)
    {
      up =true;
    }
    if (y<=27)
    {
      up=false;
    }
    if (x<=0)
    {
      right=true;
    }
    if (x>=600)
    {
      right=false;
    }
  }
  void show()
  {
    noStroke();
    smooth();
    fill(250, 0, 0);
    ellipse(x, y, 60, 60);
  }
}
