
//Abby Zhang mod 4,5 CP1

ball Ball;
void setup()
{
  Ball = new ball();
  size(300,300);
}
  
void draw()
{
  background(0);
  Ball.move();
  Ball.bounce();
  Ball.show();
}
  
class ball
{
  int x, y;
  boolean right,up;
  ball()
  {
    x=int(random(500));
    y=int(random(500));
    right=false;
    up=false;
  }
  
  
  void move()
  {
    if (right == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
  }
  
  void bounce()
  {
    if (x<30)
    {
      right = true;
    }
    if (x>300)
    {
      right = false;
    }
    if (y<30)
    {
      up = false;
    }
    if (y>300)
    {
      up = true;
    }
  }
  
 void show()
  {
    noStroke();
    fill(83,203,206);
    ellipse(x, y, 25, 25);
  }

}
