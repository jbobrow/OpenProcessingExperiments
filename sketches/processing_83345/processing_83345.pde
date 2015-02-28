
//Bouncing Ball, Aidan Fulkerson, 16/17 Mr. Simon Comp Prog 1 
Ball ball1= new Ball();
void setup()
{
  size(500, 500);
}
void draw()
{
  frameRate(250);
  background(0);
  ball1.show();
  ball1.bounce();
  ball1.move();
}
class Ball
{
  int x;
  int y;
  boolean up;
  boolean right;
  Ball()
  {
    x = 100;
    y = 200;
    up = false;
    right = true;
  }
  void move()
  {
    if (up == false)
    {
      y++;
    }
    else
    {
      y--;
    }
    if (right == false)
    {
      x--;
    }
    else
    {
      x++;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }
    if (x >500)
    {
      right = false;
    }
    if (y < 0)
    {
      up = false;
    }
    if (y > 500)
    {
      up = true;
    }
  }
  void show()
  {
    fill(52, 8, 255);
    ellipse(x, y, 20, 20);
  }
}
