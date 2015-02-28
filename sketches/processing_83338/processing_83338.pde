
//Simon L, Pong, CP1 Mods 14-15
Ball circle;
Paddle block;
int score = 0;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  textSize(50);
  circle = new Ball();
  block = new Paddle();

}
void draw()
{
    background(0);
    block.moves();
    block.shows();
    circle.move();
    circle.bounce();
    circle.show();
    fill(255);
    text(score, 50, 50);
}

class Ball
{
  int x, y;
  boolean up, left;
  Ball()
  {
    x = int(random(50, 251));
    y = int(random(50, 251));
    up = true;
    left = false;
    frameRate(300);
  }
  void move()
  {
    if (up)
    {
      y-=7;
    }
    else
    {
      y+=7;
    }
    if (left)
    {
      x-=7;
    }
    else
    {
      x+=7;
    }
  }
  void bounce()
  {
    if (x <= 0 || x >= 500)
    {
      left =! left;
    }
    if (y - 15 < 0)
    {
      up =! up;
    }
    if (get(x, y+18) == color(254))
    {
      score++;
      up = true;
    }
    if (y >= 500)
    {
      score = 0;
      up = false;
      x = int(random(50, 250));
      y = int(random(50, 250));
    }
  }
  void show()
  {
    noStroke();
    fill(int(random(0, 254)), int(random(0, 254)), int(random(0, 254)));
    ellipse(x, y, 35, 35);
  }
}
class Paddle
{
  int a;
  boolean right;
  Paddle()
  {
    a = 212;
  }
  void moves()
  {
    if (keyPressed)
    {
      if (a > 0 && key == 'a')
      {
        a-=7;
      }
      if (a < 425 && key == 'd')
      {
        a+=7;
      } 
    }
  }
  void shows()
  {
    stroke(254);
    strokeWeight(20);
    line(a, 460, a+75, 460);
  }
}
