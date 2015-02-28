
//Toby K  CP1 Mods 4/5 , bouncing ball
Ball horton= new Ball();
Ball notaball= new Ball();
void setup()
{
  size(300,300);
}
void draw()
{
  background(0);
  horton.move();
  horton.show();
  horton.bounce();
}
class Ball
{
  int x,y;
  boolean right,up,left,down;
    Ball()
    { right=true;
      down=true;
      left=false;
      up=false;
      x=150;
      y=25;
    }
  void show()
  {
    ellipse(x,y,25,25);
  }
  void move()
  {
    if( right==true)
    {
      x=x+2;
    }
    else if (left==true)
    {
      x=x-2;
    }
     if(down==true)
    {
      y=y+2;
    }
    else if(up==true)
    {
      y=y-2;
    }
  }
  void bounce()
  {
     if(x>290)
    {
      left=true;
      right=false;
    }
    if(x<10)
    {
      left=false;
      right=true;
    }
    if(y>290)
    {
      down=false;
      up=true;
    }
    if(y<10)
    {
      down=true;
      up=false;
    }
  }
}
