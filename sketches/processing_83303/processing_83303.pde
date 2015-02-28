
//Michelle Z, CP1 4-5, Pong

Ball A = new Ball();
Paddle B = new Paddle();

void setup()
{
  size (400, 300);
  frameRate(180);
}
void draw()
{
  background(0);
  A.show();
  B.show();
  A.move();
  A.bounce();
  B.Stop();
  if (keyPressed == true)
  {
    B.move();
    if (key == CODED)
    {
      if (keyCode == RIGHT)
      {
        B.dirRight2 = RIGHT;
      }
      else if (keyCode == LEFT)
      {
        B.dirRight2 = LEFT;
      }
    }
  }
}
class Ball
{
  int x, y, dirUp, dirRight, r, g, b, txt;
  Ball()
  {
    x = int(random(300));
    y = int(random(300));
    dirUp = UP;
    dirRight = RIGHT;
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    txt = 0;
  }
  void move()
  {
    if (dirRight == RIGHT)
    {
      x++;
    }
    else if (dirRight == LEFT)
    {
      x--;
    }
    if (dirUp == UP)
    {
      y--;
    }
    else if (dirUp == DOWN)
    {
      y++;
    }
  }
  void bounce()
  {
    if (x > 390)
    {
      dirRight = LEFT;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (x < 10)
    {
      dirRight = RIGHT;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (y < 10)
    {
      dirUp = DOWN;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
    }
    if (y == 290)
    {
      dirRight = -1;
      dirUp = -1;
      fill(255);
      rect(0, 0, 400, 300);
      fill(r,g,b);
      textSize(30);
      text("Score: " + txt,10,30);
      fill(0);
      textAlign(CENTER);
      textSize(50);
      text("GAME OVER.", 200, 150);
      noLoop();
    }
    if (y > 270 && get(x, y+10) != color(0))
    {
      dirUp = UP;
      r = int(random(255));
      g = int(random(255));
      b = int(random(255));
      txt = txt + 1;
    }
  }
  void show()
  {
    fill(r, g, b);
    noStroke();
    ellipse(x, y, 20, 20);
    textSize(30);
    text("Score: " + txt,10,30);
  }
}

class Paddle
{
  int x, y, dirRight2;
  Paddle()
  {
    x = 200;
    y = 280;
    dirRight2 = RIGHT;
  }
  void move()
  {
    if (dirRight2 == RIGHT)
    {
      x = x + 2;
    }
    else if (dirRight2 == LEFT)
    {
      x = x - 2;
    }
  }
  void Stop()
  {
    if (x <= 0)
    {
      dirRight2 = -1;
      if (keyPressed == true)
      {
        if (key == CODED)
        {
          if (keyCode == RIGHT)
          {
            dirRight2 = RIGHT;
          }
        }
      }
    }
    else if (x >= 350)
    {
      dirRight2 = -1;
      if (keyPressed == true)
      {
        if (key == CODED)
        {
          if (keyCode == LEFT)
          {
            dirRight2 = LEFT;
          }
        }
      }
    }
  }  
  void show()
  {
    fill(255);
    noStroke();
    rect(x, y, 50, 20);
  }
}


