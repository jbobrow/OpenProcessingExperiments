
//Em F, CP1 Mods 4-5, Tron

int x = 75;
int y = 75;
int direction = RIGHT ;
int compx = 425;
int compy = 425;
int compDirection = LEFT;
boolean gameOver = false;
void setup()
{
  size (500, 500);
  strokeWeight(5);
  stroke (#6F4472);
  rect (0, 0, 499, 499);
  stroke(0);
  fill(0);
  rect (5, 5, 489, 489);
}
void draw()
{
  if (gameOver == true)
  {
    fill (255);
    textSize (30);
    text ("GAME OVER", 160, 240);
  }
  else
  {
    human ();
    computer ();
  }
}
void human()
{
  if (get(x, y) !=color(0, 0, 0))
  {
    gameOver = true;
  }
  else
  {
    strokeWeight(1);
    stroke (158, 123, 255);
    point (x, y);
    if (direction == LEFT)
    {
      x--;
    }
    else if (direction == RIGHT)
    {
      x++;
    }
    else if (direction == UP)
    {
      y--;
    }
    else if (direction == DOWN)
    {
      y++;
    }
  }
}
void computer ()
{
  if (get(compx, compy) !=color(0, 0, 0))
  {
    gameOver = true;
  }
  else
  {
    strokeWeight(1);
    stroke (100, 255, 200);
    point (compx, compy);
    if (compDirection == LEFT)
    {
      compx--;
      if (get(compx-1, compy) !=color(0))
      {
        compDirection = UP;
      }
      else if (get(compx-1, compy) != color (0))
      {
        compDirection = DOWN;
      }
    }
    else if (compDirection == RIGHT)
    {
      compx++;
      if (get(compx+1, compy) !=color(0))
      {
        compDirection = UP;
      }
      else if (get(compx+1, compy) != color (0))
      {
        compDirection = DOWN;
      }
    }
    else if (compDirection == UP)
    {
      compy--;
      if (get(compx, compy-1) !=color(0))
      {
        compDirection = RIGHT;
      }
      else if (get(compx, compy-1) != color (0))
      {
        compDirection = LEFT;
      }
    }
    else if (compDirection == DOWN)
    {
      compy++;
      if (get(compx, compy+1) !=color(0))
      {
        compDirection = RIGHT;
      }
      else if (get(compx, compy+1) != color (0))
      {
        compDirection = LEFT;
      }
    }
  }
}
void keyPressed()
{
  if (key=='a')
  {
    direction = LEFT;
  }
  else if (key=='s')
  {
    direction = DOWN;
  } 
  else if (key=='d')
  {
    direction = RIGHT;
  }
  else if (key=='w')
  {
    direction = UP;
  }
}

