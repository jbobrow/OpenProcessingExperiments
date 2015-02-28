
//Tina L., CP1 14/15 BouncingBall
Ball bob;
Ball barbara;
Ball joe;
void setup()
{
  frameRate(180);
  bob = new Ball();
  barbara = new Ball();
  joe = new Ball();
  size(300,300);
}
void draw()
{
  background(0);
  fill(0,200,255);
  bob.move();
  bob.bounce();
  bob.show();
  fill(0,255,200);
  barbara.move();
  barbara.bounce();
  barbara.show();
  fill(0,172,255);
  joe.move();
  joe.bounce();
  joe.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(300));
    y = int(random(300));
    up = false;
    right = false;
  }
  void move()
  {
    if(up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if(right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if(y > 275)
    {
      up = true;
    }
    if(y < 25)
    {
      up = false;
    }
    if(x > 275)
    {
      right = false;
    }
    if(x < 25)
    {
      right = true;
    }
  }
  void show()
  {
    ellipse(x,y,50,50);
  }
}
