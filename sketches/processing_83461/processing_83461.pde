
//Jenny H. CP1 Mods 14/15, Bouncing Ball
Ball bob;
Paddle sam;
boolean gameOver = false;
void setup ()
{
  bob = new Ball();
  sam = new Paddle();
  size (500, 300);
}
void draw ()
{
  background (0, 0, 0);
  sam.show ();
  bob.show();
  bob.move();
  bob.bounce();

  if (keyPressed==true)
  {
    if (key=='4')
    {
      sam.moveLeft();
    }
    if (key=='6')
    {
      sam.moveRight();
    }
  }
}
class Ball
{

  int x;
  int y;
  boolean left;
  boolean up;
  
  Ball ()
  {
    x = 250;
    y = 150;
    left = false;
    up = true;
  }
  void show()
  {
    fill (0, random(0, 156), random(0, 256));
    ellipse (x, y, 50, 50);
  }
  void move ()
  {
    if (left == true)
    {
      x=x-3;
    }
    else
    {
      x=x+3;
    }
    if (up == true)
    {
      y=y-3;
    }
    else
    {
      y=y+3;
    }
  }
  void bounce ()
  {
    if (x<10)
    {
      left = false;
    }
    else if (x>490)
    {
      left = true;
    }
    if (y<10)
    {
      up = false;
    }
    else if (y > 275)
    {
      gameOver = true;
    }
    else if (get (x, y+26) != color (0))
    {
      up = true;
    }
    if (gameOver == true)
    {
      textAlign (CENTER);
      textSize (72);
      text ("Game Over", 250, 150);
    }
  }
}
class Paddle
{
  int x = 250;
  void show ()
  {
    fill (255, 255, 255);
    rect(x, 290, 50, 10);
  }
  void moveLeft ()
  {
    x=x-5;
  }
  void moveRight ()
  {
    x=x+5;
  }
}
