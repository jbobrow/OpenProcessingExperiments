
//Amy C. Bouncing Ball, Computer Programming 4/5
Ball hi;
void setup()
{
  hi = new Ball();
  size(200,300);
}
void draw()
{
  background(0);
  hi.show();
   hi.bounce(); 
  hi.move();
}
class Ball
{
  int x,y;
  boolean up, right;
  Ball()
  {
    x=int(random(0,200));
    y=int(random(0,300));
    boolean up;
    boolean right;
  }
  void show()
  {
    fill(49,204,229);
    ellipse(x,y,30,30);
  }
  void bounce()
  {
    if(x>200)
    {
      right=false;
    }
    if(x<0)
    {
      right=true;
    }
    if(y>300)
    {
      up=true;
    }
    if(y<0)
    {
      up=false;
    }
  }
  void move()
  {
    if(up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if(right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
}
