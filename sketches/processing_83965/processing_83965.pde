
//Hanson T. Cp1 16/17 Pong
Paddle paddle;
Ball ball;
int g;
void setup()
{
  size(300, 200);
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
class Paddle 
{
  void move()
  {
    if (mousePressed == true && mouseX < g)
    {
      g--;
    }
    else if (mousePressed == true && mouseX > g)
    {
      g++;
    }
  }
   void show()
  {
    fill(255,255,255);
    rect(g, 180, 60, 15);
  }
}
  class Ball
  {
    int x, y, z;
    boolean up, right;
    Ball()
    {
      x = int(random(300));
      y = int(random(150));
      z = int(random(275));
      up = true;
      right = true;
    }
    void move()
    {
      if (up == true)
      {
        y-=2;
      }
      else
      {
        y+=2;
      }
      if (right == true)
      {
        x+=2;
      }
      else
      {
        x-=2;
      }
    }
    void bounce()
    {
      if (x < 10)
      {
        right = true;
      }
      if (x > 275)
      {
        right = false;
      }
      if (y < 10)
      {
        up = false;
      }
      if (y > 170)
      {
        up = true;
      }
    }

    void show()
    {
      ellipse(x, y, 25, 25);
    }
  }
