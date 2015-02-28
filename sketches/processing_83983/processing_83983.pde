
//Bryan Lee, Bouncing Ball, Computer Programming 1, Block 7
thing ball;
void setup()
{
  size(500, 500);
  ball = new thing();
}
void draw()
{
  background(0);
    ball.ball();
    ball.move();
    ball.bounce();

}
class thing
{
  int x, y;
  boolean up, right;
  thing()
  {
    int x = 500;
    int y = 500;
    boolean up = true;
    boolean right = true;
  }
    void ball()
  {
    ellipse(x, y, 50, 50);
  }
  void move()
  {
    if(right == true)
    {
      x = x + 7;
    }
    else
    {
      x = x - 5;
    }
    if(up == true)
    {
      y = y + 4;
    }
    else
    {
      y = y - 6;
    }
  }
  void bounce()
  {
    if(x < 25)
    {
      right = true;
    }
    else if(x > 475)
    {
      right = false;
    }
    if(y < 25)
    {
       up = true;
    }
    else if(y > 475)
    {
      up = false;
    }
  }

}
