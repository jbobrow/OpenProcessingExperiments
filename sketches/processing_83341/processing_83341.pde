
//Jonathan Huang, CP 1, Mods 16/17

Paddle paddle;
Ball ball;
void setup()
{
  size(400, 400);
  paddle = new Paddle();
  ball= new Ball();
}
void draw()
{
  background(0);
  paddle.show();
  paddle.keyPressed();
  ball.move();
  ball.bounce();
  ball.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x =200;
    y =250;
    up = true;
    right = true;
  }
  void move()
  {
    if (up == true)
    {
      y = y - 3;
    }
    if (up == false)
    {
      y = y + 3;
    }
    if (right ==true)
    {
      x = x + 3;
    }
    if (right ==false)
    {
      x = x - 3;
    }
  }
  void bounce()
  {
    if (x>400)
    {
      right = false;
    }
    if (x<0)
    {
      right = true;
    }
    if (y>400)
    {
      up = true;
    }
    if (y<0)
    {
      up= false;
    }
    if (get(x, y+12) == color(254))
    {
      up=true;
    }
  }
  void show()
  {
    ellipse (x, y, 25, 25);
  }
}
class Paddle
{
  int a;
  Paddle()
  {
    a= 200;
  }
  void keyPressed()
  {
    if (keyPressed==true & (key== 'a'||key== 'A'))
    {
      a = a - 3;
    }
    else if (keyPressed==true & (key== 'd'||key== 'D'))
    {
      a = a + 3;
    }
    if (a>400)
    {
      a=0;
    }
    if (a<0)
    {
      a=400;
    }
  }
  void show()
  {
    fill(254);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(a, 395, 75, 5);
  }
}
