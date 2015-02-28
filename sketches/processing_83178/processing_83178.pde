
Pong ball;
Pong ball2,ball3,ball4,ball5;
int r,b,g,t;



void setup()
{
  ball = new Pong();
  ball2 = new Pong();
  ball3 = new Pong();
  ball4 = new Pong();
  ball5 = new Pong();
  size (500, 500);
  frameRate(200);
}

void draw()
{
  background (0, 0, 0);
  ball.move();
  ball.show();
  ball.bounce();
  ball2.move();
  ball2.show();
  ball2.bounce();
  ball3.move();
  ball3.show();
  ball3.bounce();
  ball4.move();
  ball4.show();
  ball4.bounce();
  ball5.move();
  ball5.show();
  ball5.bounce();
}

class Pong
{
  int xx;
  int yy;
  boolean horizontal, vertical;

  Pong()
  {
    xx = int(random(0, 500));
    yy = int(random(500));
    horizontal = true;
    vertical = true;
  }

  void move()
  {
    if (horizontal == true)
    {
      xx++;
    }
    if (horizontal == false)
    {
      xx--;
    }
    if (vertical == true)
    {
      yy++;
    }
    if (vertical == false)
    {
      yy--;
    }
  }

  void bounce()
  {
    if (xx > 500)
    {
      horizontal = false;
    }
    if (xx < 0)
    {
      horizontal = true;
    }
    if (yy > 500)
    {
      vertical = false;
    }
    if (yy < 0)
    {
      vertical = true;
    }
  }
  void show()
  {
    r = int(random(0,250));
   b = int(random(0,250));
   g = int(random(0,250));
   t = int(random(0,250));
  fill(r,b,g,t);
    ellipse(xx, yy, 50, 50);
  }
}
