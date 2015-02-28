
//Joe Liang, Mods 14/15, 12/5/12, Bouncing Ball
Ball Joe;
void setup()
{
Joe = new Ball();
  size(600,600);
 frameRate(120);
}
void draw()
{
  background(197);
  Joe.move();
  Joe.ball();
  Joe.bounce();
  

  
}
class Ball
{
  boolean up,right;
  int x;
  int y;
  Ball()
  {
    up=false;
    right=true;
    x = 10;
    y = 300;
  }
  void ball()
  {
    ellipse(x,y,40,40);
  }
  void move()
  {
    if(up==false)
    {
      y=y+1;
    }
    else
    {
      y=y-1;
    }
    if(right==true)
    {
      x=x+1;
    }
    
    else
    {
      x=x-1;
    }
    
  }
  void bounce()
  {
    if(y>600)
    {
      up=true;
    }
    if(y<0)
    {
      up=false;
    }
    if(x>600)
    {
      right=false;
    }
    if(x<0)
    {
      right=true;
    }
  }
  
  
}
