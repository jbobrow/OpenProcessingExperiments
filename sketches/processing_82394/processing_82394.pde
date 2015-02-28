
//Steven G., CP1 mods 14-15, Bouncing Balls 

Ball bob[];
void setup()
{
  size(400,400);
  bob = new Ball[150];
  for(int i=0;i<150;i++)
  {
    bob[i]=new Ball();
  }
}
void draw()
{
  background(0);
  for(int i=0;i<150;i++)
  {
  bob[i].move();
  bob[i].bounce();
  bob[i].show();
  }
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x=int(random(400));
    y=int(random(400));
    up=random(1)<.5;
    right=random(1)<.5;
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
  void show()
  {
    fill(random(255),random(255),random(255));
    ellipse(x,y,10,10);
  }
  void bounce()
  {
    if(x<0)
    {
      right = true;
    }
    if(x>400)
    {
      right = false;
    }
    if(y<0)
    {
      up=false;
    }
    if(y>400)
    {
      up=true;
    }
  }
}
