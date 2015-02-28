
//Jarvis Law,Bouncing Ball,CP1 mods 16-17
Ball Jun;
void setup()
{  
  size(500, 500);
  Jun=new Ball();
  frameRate(150);
}
void draw()
{
  background(0);
  Jun.move();
  Jun.bounce();
  Jun.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=170;
    y=250;
    up=true;
    right=true;
  }
  void move()
  {
    if (right==true)
    {
      x++;
    }
    if (right==false)
    {
      x--;
    }
    if (up==true)
    {
      y++;
    }
    if (up==false)
    {
      y--;
    }
  }
  void bounce()
  {
    if (x>460)
    {
      right=false;
    }
    if (x<40)
    {
      right=true;
    }
    if (y>460)
    {
      up=false;
    }
    if (y<40)
    {
      up=true;
    }
  }
  void show()
  {
    fill(0, 255, 255);
    ellipse(x, y, 80, 80);
  }
}
