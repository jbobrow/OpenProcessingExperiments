
//Julie O, CP1 Mods 4/5, Bouncing Ball

int pdirection = RIGHT;
boolean right = true;
boolean down = true;
Ball ballA = new Ball();
Paddle paddleA = new Paddle();

void setup()
{
  size(300, 300);
  smooth();
  frameRate(190);
  keyCode = RIGHT;
}

void draw()
{
  background(67, 0, 67);
  paddleA.move();
  paddleA.show();
  ballA.move();
  ballA.bounce();
  ballA.show();
}

class Ball
{
  int bx;
  int by;
  Ball()
  {
    bx = 20;
    by = 50;
  }
  void move()
  {
    if (right == true)
    {
      bx++;
    }
    else
    {
      bx--;
    }
    if (down == true)
    {
      by++;
    }
    else
    {
      by--;
    }
  }
  void bounce()
  {
    if (bx>295) //boolean
    {
      right = false;
    }
    if (bx<5)
    {
      right = true;
    }
    if (by<10)
    {
      down = true;
    }
    if(get(bx,by + 10) == color(6,206,209))
    {
      down = false;
    }
    if(by>300)
    {
      fill(255,0,0);
      ellipse(50,50,75,75);
      fill(0,0,0);
      ellipse(40,40,5,15);
      ellipse(65,40,5,15);
      rect(35,65,35,2);
    }
  }
  void show()
  {
    fill(255, 255, 255);
    ellipse(bx, by, 20, 20);
  }
}

class Paddle
{
  int px = 150;
  void move()
  {
    if (keyCode == RIGHT)
    {
      pdirection = RIGHT;
      px++;
      if(px>250)
      {
        px = 250;
      }
    }
    else if (keyCode == LEFT)
    {
      pdirection = LEFT;
      px--;
      if(px<0)
      {
        px = 0;
      }
    }
  }
  void show()
  {
    fill(6,206,209);
    rect(px,280,50,15);
  }
}
