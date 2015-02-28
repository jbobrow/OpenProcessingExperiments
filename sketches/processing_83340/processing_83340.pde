
int paddledir = RIGHT;
Ball Mister;
boolean right = true;
Paddle Bob;
void setup()
{
  Mister = new Ball();
  Bob = new Paddle();
  size(400, 450);
  keyCode = RIGHT;
}

void draw()
{
  background(0);
  frameRate(200);
  Bob.show();
  Bob.move();
  Mister.move();
  Mister.bounce();
  Mister.show();
 
}

class Ball
{
  int x, y;
  boolean right, down;
  Ball()
  { 
    x = int(random(400));
    y = int(random(400));
  }
  void move()
  {
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if (down==true)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
  void bounce()
  {
    if (x-15 < 0)
    {
      right = true;
    }
    if (x+15 > 400)
    {
      right = false;
    }
    if (y-15 < 0)
    {
      down = true;
    }
    if (y+15 > 450)
    {
      down = false;
    }
    if (get(x, y+15) != color(0))
    {
      down = false;
    }
  }
    void show()
    {
      fill (112, 127,206);
      ellipse (x, y, 35, 35);
    }
  }


  class Paddle
  {
    int y = 200;
    void move()
    {
      if (keyPressed == true & key == 'l')
      {
        y++;
      }
      else if (keyPressed == true & key == 'j')
      {
        y--;
      }
    }
    void show()
    {
      rect(y, 425, 90, 30);
      fill(255);
    }
  }
