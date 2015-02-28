
//Eric Trinh, BouncingBall, CP1 mods 16-17

eric Ball;
void setup()
{
  Ball = new eric();
  Paddle = new david();
  size(400, 400);
}
void draw()
{
  Ball.move();
  Ball.bounce();
  background(0);
  Ball.exist();
  Paddle.exist();
  Paddle.move();
  Paddle.controls();
  Paddle.borders();
}
class eric
{
  int x, y;
  boolean up, right;
  eric()
  {
    x = 200;
    y = 200;
    up = false;
    right = false;
  }
  void exist()
  {
    fill(146,242,250);
    ellipse(x, y, 25, 25);
  }
  void move()
  {
    if (right == true)
    {
      x+=3;
    }
    else
    {
      x-=3;
    }
    if (up == true)
    {
      y-=3;
    }
    else
    {
      y+=3;
    }
  }
  void bounce()
  {
    if (x < 10)
    {
      right = true;
    }
    if (x > 380)
    {
      right = false;
    }
    if (y < 10)
    {
      up = false;
    }
    if (y > 380)
    {
      up = true;
    }
    if(get(x,y+15) == color(11, 19, 157))
    {
      up = true;
    }
  }
}


david Paddle;
class david
{
  int paddleX, paddleY;
  boolean left, right;
  david()
  {
    paddleX = 170;
    paddleY = 390;
    left = false;
    right = false;
  }
  void exist()
  {
    fill(11, 19, 157);
    rect(paddleX, paddleY, 60, 7);
  }
  void move()
  {
    if (right == true)
    {
      paddleX+=4;
    }
    if (left == true)
    {
      paddleX-=4;
    }
  }
  void controls()
  {
    if (keyPressed == true && keyCode == RIGHT)
    {
      right = true;
    }
    else
    {
      right = false;
    }
    if (keyPressed == true && keyCode == LEFT)
    {
      left = true;
    }
    else
    {
      left = false;
    }
  }
  void borders()
  {
    if(paddleX >= 340)
    {
      right = false;
    }
    if(paddleX <= 0)
    {
      left = false;
    }
  }
}
