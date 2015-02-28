
//Lisa L, CP1 Mods 16/17, Pong

Ball henry;
Paddle joe;
boolean gameOver = false;
int n = -1;
void setup()
{
  size(400, 450);
  smooth();
  frameRate(240);
  henry = new Ball();
  joe = new Paddle();
}
void draw()
{
  if (gameOver==false)
  {
    background(0);
    henry.move();
    henry.bounce();
    henry.show();
    joe.showP();
  }
  if(henry.y>435 && get(henry.x,henry.y+10)!=color(208, 115, 237))
  {
    gameOver = true;
    background(0);
    textSize(20);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER\nScore: " + n,200,225);
  }
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 200;
    y = 150;
    up = false;
    right = true;
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
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
  }
  void bounce()
  {
    if (x<10)
    {
      right = true;
    }
    else if (x>390)
    {
      right = false;
    }
    if (y<10)
    {
      up = false;
    }
    else if (y>435)
    {
      up = true;
      n++;
    }
  }
  void show()
  {
    fill(208, 115, 237);
    ellipse(x, y, 20, 20);
  }
}
class Paddle
{
  int x;
  Paddle()
  {
    x =180;
  }
  void showP()
  {
    rect(x, 444, 45, 5);
  }
}
void mouseMoved()
{
  if (mouseX < 355)
  {
    joe.x = mouseX;
  }
}
