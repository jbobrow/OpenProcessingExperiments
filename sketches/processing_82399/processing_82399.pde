
Ball Scott;
void setup()
{
  size(600,600);
  Scott = new Ball();
}
void draw()
{
  background(0);
  Scott.move();
  Scott.bounce();
  Scott.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x=int (random (0,600));
    y=int (random (0,600));
    up=true;
    right=true;
  }
  void move()
  {
    if(up==true)
    {
    y=y+5;
    }
    else
    {
      y=y-5;
    }
    if(right==true)
    {
    x=x+5;
    }
    else
    {
      x=x-5;
    }
  }
  void bounce()
  {
    if(x>550)
    {
      right=false;
    }
    if(x<50)
    {
      right= true;
    }
    if(y>550)
    {
      up= false;
    }
    if(y<50)
    {
      up= true;
    }
  }
  void show()
  {
    fill(int(random(0,256)),int (random (0,256)),0);
    ellipse(x,y,100,100);
  }
}


