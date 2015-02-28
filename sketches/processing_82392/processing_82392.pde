
//Benson L, CP1 Mods 14-15, Bouncing Ball
Ball bob;
Ball jack;
Ball phil;
Ball ant;
Ball jill;
Ball tim;
boolean mode = true;
void setup()
{
  size(400, 400);
  bob = new Ball();
  jack = new Ball();
  jack.up = false;
  phil = new Ball();
  phil.up = false;
  phil.right = false;
  ant = new Ball();
  ant.right = false;
  jill = new Ball();
  tim = new Ball();
  tim.up = false;
}
void draw()
{
  fill(0, 0, 255);
  bob.move();
  bob.bounce();
  bob.show();
  fill(0, 255, 0);
  jack.move();
  jack.bounce();
  jack.show();
  fill(255, 0, 0);
  phil.move();
  phil.bounce();
  phil.show();
  fill(255);
  ant.move();
  ant.bounce();
  ant.show();
  fill(0);
  jill.move();
  jill.bounce();
  jill.show();
  fill(54,23,65);
  tim.move();
  tim.bounce();
  tim.show();
}
class Ball
{
  float x, y;
  boolean up, right;
  Ball()
  {
    x = random(25, 376);
    y = random(25, 376);
    up = true;
    right = true;
  }
  void move()
  {
    if (right == true)
    {
      x = x + 3.1;
    }
    else if (right == false)
    {
      x = x - 3;
    }
    if (up == true)
    {
      y = y - 1.9;
    }
    else if (up == false)
    {
      y = y + 2;
    }
  }
  void bounce()
  {
    if (x > 375)
    {
      right = false;
    }
    else if (x < 25)
    {
      right = true;
    }

    if (y > 375)
    {
      up = true;
    }
    else if (y < 25)
    {
      up = false;
    }
  }
  void show()
  {
    ellipse(x, y, 50, 50);
  }
}
