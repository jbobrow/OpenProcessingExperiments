
//Laura R., Bouncing Ball, Computer Programming 1, 14-15
Ball kylie = new Ball();
void setup()
{
  size (600, 600);
  
}
void draw()
{
  background(137, 17, 17);
  kylie.show();
  kylie.move();
  kylie.bounce();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 100;
    y = 300;
    up = true;
    right = true;
  }
  void move ()
  {
    if (up == true)
    {
      y = y - 3;
    }
    if (up == false)
    {
      y= y + 3;
    }
    if (right == true)
    {
      x= x+ 3;
    }
    if (right == false)
    {
      x = x - 3;
    }
  }
  void bounce()
  { 
    if (y >= 590)
    {
      up = true;
    }
    if ( y <= 10)
    {
      up = false;
    }
    if (x >= 590 )
    {
      right = false;
    }
    if ( x <= 10 )
    { 
      right = true;
    }
  }
  void show()
  {
    noStroke();    
    fill(250,234,177);
    ellipse(x, y, 50, 50);
  }
}



