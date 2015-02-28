
//Benjamin Z. Computer Programming 1. 16/17 Pong
Paddle paddle;
Ball ball;
int z=0;
void setup()
{
  size(500, 500);
  paddle = new Paddle();
  ball = new Ball();
}
void draw()
{
  background(0);
  ball.move();
  ball.bounce();
  ball.show();
  paddle.move();
  paddle.show();
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {

    x=int(random(500));
    y=int(random(300));
    up=false;
    right=false;
  }

  void move()
  {
    if (right==true)
    {
      x=x+3;
    }
    if (right==false)
    {
      x=x-3;
    }
    if (up==true)
    {
      y=y-3;
    }
    if (up==false)
    {
      y=y+3;
    }
  }
  void bounce()
  {

    if (x<30)
    {
      right=true;
    }
    if (x>480)
    {
      right=false;
    }
    if (y<30)
    {
      up=false;
    }
    if (y>410)
    {
      up=true;
    }
    if (get(x, y+36)==color(0,255,0))
    {
      y=y+3;
      up=true;
    }
  }
  void show()
  {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 70, 70);
  }
}


class Paddle
{
  void move()
  {
    if (mousePressed == true && mouseX < z)
    {
      z=z-5;
    }
    else if (mousePressed == true && mouseX > z)
    {
      z=z+5;
    }
  }
  void show()
  {
    noStroke();
    fill(0,255,0);
    rect(z, 440, 100, 20);
  }
}
