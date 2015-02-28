
Ball boss;
void setup()
{
  size(600,600);
  boss = new Ball();
}
void draw()
{
  boss.move();
  boss.bounce();
  boss.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = int (random(600));
    y = int (random(600));
    up = true;
    right = true;
  }
  void move()
  {
    if(up == true)
    {
      y= y-2;
    }
    if(right == true)
    {
      x=x+2;
    }
    if (up == false)
    {
      y=y+2;
    }
    if (right == false)
    {
      x=x-2;
    }
  }
  void bounce()
  {
    if( y>=600)
    {
      up = true;
    }
    if (y<=0)
    {
      up = false;
    }
    if (x>=600)
    {
      right = false;
    }
    if (x<=0)
    {
      right = true;
    }
  }
  void show()
  {
    fill(0,255,0);
     background(0);
    ellipse(x,y,50,50);
   
  }
      
}
