
Ball ball;
Paddle paddle;
AI com1;
int a = 0;
int b = 0;
int xdir = 4;
int ydir = 4;
int x = int(random(width-(width-50), width-50));
int y = int(random(height-(height-50), height-50));
int z = 200;
void setup()
{
  size(400, 400);
  ball = new Ball();
  paddle = new Paddle();
  com1 = new AI();
  frameRate(60);
}
void draw()
{
  background(0);
  paddle.show();
  paddle.move();
  com1.show();
  com1.move();
  ball.move();
  ball.bounce();
  ball.show();
  pushStyle();
  fill(100);
  textAlign(CENTER);
  textSize(15);
  text("Use a and z to move the blue paddle", width/2, height-(height-20));
  text("Use ' and / to move the red paddle", width/2, height-10);
  fill(150);
  text("Use a and z to move the blue paddle", (width/2)+1, (height-(height-20))+1);
  text("Use ' and / to move the red paddle", (width/2)+1, (height-10)+1);
  popStyle();
}
class AI
{
  void show()
  {
    fill(100);
    rect(width-20, z-25, 10, 75);
  }
  void move()
  {
    if (z < y && x > width/2 && xdir == 4)
    {
      z=z+5;
    }
    if (z > y && x > width/2 && xdir == 4)
    {
      z=z-5;
    }
  }
}
class Paddle
{
  int a = 10;
  int b = height/2-25;
  int c = 150;
  int d = height/2-25;
  void show()
  {
    noStroke();
    pushStyle();
    fill(31, 43, 88);
    rect(a, b, 10, 50);
    fill(116, 28, 30);
    rect(c, d, 10, 50);
    popStyle();
  }
  void move()
  {
    if (keyPressed == true)
    {
      if (key == 'a' || key == 'A')
      {
        b=b-5;
      }
      if (key == 'z' || key == 'Z')
      {
        b=b+5;
      }
      if (key == '\'' || key == '"')
      {
        d=d-5;
      }
      if (key == '/' || key == '?')
      {
        d=d+5;
      }
      if (b <= 0)
      {
        b=0;
      }
      if (b+50 >= height)
      {
        b=height-50;
      }
      if (d <= 0)
      {
        d=0;
      }
      if (d+50 >= height)
      {
        d=height-50;
      }
    }
  }
}
class Ball
{
  void show()
  {
    fill(255);
    ellipse(x, y, 10, 10);
  }
  void move()
  {
    x = x + xdir;
    y = y + ydir;
  }
  void bounce()
  {
    if (x <= width-(width-5) || x >= width-5 || get(x, y) != color(0))
    {
      xdir = -xdir;
    }
    if (y <= height-(height-5) || y >= height-5)
    {
      ydir = -ydir;
    }
  }
}
