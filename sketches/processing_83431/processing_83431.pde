
//Perry Phan, comp. prog 4/5, Pong
Paddle joe = new Paddle();
Ball perry = new Ball();
int a;
void setup()
{
  size(500, 500);
}
void draw()
{
  background (0, 0, 0);
  joe.move();
  joe.show();
  perry.show();
  perry.bounce();
  perry.move();
}
class Paddle
{
  void move()
  {
    if (mousePressed == true && mouseX<a)
    {
      a--;
    }
    else if (mousePressed == true && mouseX>a)
    {
      a++;
    }
  }
  void show()
  {
    fill(255);
    rect(a, 400, 100, 30);
  }
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(300));
    y=int(random(300));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
  }
  void show()
  {
    ellipse(x, y, 50, 50);
  }
  void bounce()
  {
    if (x<0)
    {
      right=true;
    }
    if (x>475)
    {
      right=false;
    }
    if (y<0)
    {
      up=false;
    }
    if (get(x, y+26) !=color(0))
    {
      up = true;
    }
  }
}
