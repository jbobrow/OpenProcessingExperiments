
//Brian C, Pong, CP1 Mods 16/17

boolean gameOver = false;
ball bob;
paddle pad;
void setup()
{
  bob = new ball();
  pad = new paddle();
  size(300, 300);
  frameRate(175);
}
void draw()
{
  if (gameOver == false)
  {
    background(0);
    bob.move();
    bob.bounce();
    bob.show();
    pad.showpad();
  }
  if (bob.y >= 280 && get(bob.x, bob.y+15) != color(255, 0, 255))
  {
    background(0);
    gameOver = true;
    fill(255, 0, 0);
    text("Game Over", 130, 150);
    fill(242, 149, 7);
    ellipse(bob.x,bob.y,20,20);
    fill(255,0,255);
    rect(pad.x,290,40,10);
  }    
}
void keyPressed()
{
  if (key == 'r')
  {
    gameOver = false;
    bob.move();
    bob.bounce();
    bob.show();
    pad.showpad();
  }
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x = 10;
    y = 10;
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
      y = y + 2;
    }
  }
  void bounce()
  {
    if (x <=10)
    {
      right = true;
      background(226, 71, 234);
    }
    if (x >= 290)
    {
      right = false;
      background(70, 36, 211);
    }
    if (y >= 280)
    {
      up = true;
      background(80, 184, 247);
    }
    if (y <= 10)
    {
      up = false;
      background(49, 134, 78);
    }
  }
  void show()
  {
    noStroke();
    fill(242, 149, 7);
    ellipse(x, y, 20, 20);
  }
}
class paddle
{
  int x;
  paddle()
  {
    x = 130;
  }
  void showpad()
  {
    fill(255, 0, 255);
    rect(x, 290, 40, 10);
  }
}
void mouseMoved()
{
  if (mouseX < 263)
  {
    pad.x = mouseX;
  }
}
