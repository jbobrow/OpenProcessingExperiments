
//Dan-Tran Cong-Huyen, Bouncing Ball/Pong, CP1 16/17
Ball smith;
Paddle jones;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  smith = new Ball();
  jones = new Paddle();
}
void draw()
{
  if ( gameOver == false)
  {
    background(0);
    jones.show();
    smith.show();
    smith.move();
    smith.bounce();
    if (keyPressed == true)
    {
      if (key == '4')
      {
        jones.moveLeft();
      }
      else if (key == '6')
      {
        jones.moveRight();
      }
    }
  }
  else
  {
    fill(234, 12, 198);
    textAlign(CENTER);
    text("GAME OVER", 250, 250);
  }
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(200));
    y = int(random(200));
    up = false;
    right = true;
  }
  void move()
  {
    if (right == false)
    {
      x-=2.5;
    }
    else
    {
      x+=2.5;
    }
    if (up == false)
    {
      y+=2.5;
    }
    else
    {
      y-=2.5;
    }
  }
  void show()
  {
    fill(137, 86, 180);
    ellipse(x, y, 20, 20);
  }
  void bounce()
  {
    if (x > 480)
    {
      right = false;
    }
    else if (x < 20)
    {
      right = true;
    }
    if (y < 10)
    {
      up = false;
    }
    else if (y + 10 > 498)
    {
      up = false;
      gameOver = true;
    }
    else 
    {
      if (get(x, y + 10) != color(0))
      {
        up = true;
      }
    }
  }
}
class Paddle
{
  int l;
  Paddle()
  {
    l = 30;
  }
  void show()
  {
    fill(136, 250, 156);
    noStroke();
    rect(l, 470, 40, 10);
  }
  void moveLeft()
  {
    l-=3;
  }
  void moveRight()
  {
    l+=3;
  }
}
