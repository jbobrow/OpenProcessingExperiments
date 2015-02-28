
Pong ball;
Pong ball2, ball3, ball4, ball5;
Paddle bar;
int t;
int i = 0;



void setup()
{
  ball = new Pong();
  ball2 = new Pong();
  ball3 = new Pong();
  ball4 = new Pong();
  ball5 = new Pong();
  bar = new Paddle();
  size (500, 500);
}

void draw()
{
  background (0, 0, 0);
  bar.show();
  ball.bounce();
  ball.move();
  ball.show();
  ball2.move();
  ball2.bounce();
  ball2.show();
  ball3.move();
  ball3.bounce();
  ball3.show();
  ball4.move();
  ball4.bounce();
  ball4.show();
  ball5.move();
  ball5.bounce();
  ball5.show();
  score();
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
      vertical =! vertical;
    }
    if (get(xx, yy) == color(255))
    {
      vertical =! vertical;
      i++;
    }
    if (yy < 0)
    {
      vertical = true;
    }
  }
  void show()
  {
    t=150;
    fill(0, 0, 255, t);
    ellipse(xx, yy, 50, 50);
  }
}

class Paddle
{
  void show()
  {
    fill(255);
    rect(mouseX, 425, 80, 2);
    fill(200);
    rect(mouseX, 427, 80, 10);
  }
}

void score()
{
  textAlign(CENTER);
  fill(255);
  textSize(50);
  text(i, 250, 150);
}
