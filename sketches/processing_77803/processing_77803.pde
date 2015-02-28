
//William T, Tron, CP1 Mods 14-15
int x = 270;
int y = 250;
int cx = 240;
int cy = 250;
int dire = UP;
int cdire = UP;
boolean gameOver = false;
boolean cgameOver = false;
void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  frameRate(100);
  textAlign(CENTER);
  textSize(30);
}

void draw()
{
  if (gameOver == true)
  {
    fill(255, 0, 0);
    text("Game Over", 250, 220);
    text("Computer Wins", 250, 250);
    text("Better Luck Next Time", 250, 280);
  }
  else if (cgameOver == true)
  {
    fill(0, 255, 0);
    text("Game Over", 250, 220);
    fill(random(0, 256), random(0, 256), random(0, 256));
    text("You Win!", 250, 250);
  }
  else
  {
    human();
    AI();
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    dire = UP;
  }
  if (key == 'a')
  {
    dire = LEFT;
  }
  if (key == 's')
  {
    dire = DOWN;
  }
  if (key == 'd')
  {
    dire = RIGHT;
  }
}
void mousePressed()
{
  background(0);
  x = 270;
  y = 250;
  cx = 240;
  cy = 250;
  dire = UP;
  cdire = UP;
  gameOver = false;
  cgameOver = false;
}


void human()
{

  if (get(x, y) != color(0))
  {
    gameOver = true;
  }
  else
  {
    stroke(59, 218, 234);
    fill(59, 218, 234);
    point(x, y);
    if (dire == RIGHT)
    {
      x++;
    }
    else if (dire == LEFT)
    {
      x--;
    }
    else if (dire == UP)
    {
      y--;
    }
    else if (dire == DOWN)
    {
      y++;
    }
  }
}
void AI()
{

  if (get(cx, cy) != color(0))
  {
    cgameOver = true;
  }
  else
  {
    stroke(234, 147, 59);
    fill(234, 147, 59);
    point(cx, cy);
    if (cdire == RIGHT)
    {
      cx++;
      if (get(cx + 1, cy) != color(0))
      {
        cdire = DOWN;
      }
    }
    else if (cdire == LEFT)
    {
      cx--;
      if (get(cx - 1, cy) != color(0))
      {
        cdire = UP;
      }
    }
    else if (cdire == UP)
    {
      cy--;
      if (get(cx, cy - 1) != color(0))
      {
        cdire = RIGHT;
      }
    }
    else if (cdire == DOWN)
    {
      cy++;
      if (get(cx, cy + 1) != color(0))
      {
        cdire = LEFT;
      }
    }
  }
}
