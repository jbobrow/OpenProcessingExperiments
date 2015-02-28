
//Jenny H. CP1, Mods 14/15, Tron
int x = 300;
int y = 200;
int direction = LEFT;
int computerX = 100;
int computerY = 200;
int computerDirection = RIGHT;
boolean gameOver = false;
void setup ()
{
  size (400, 400);
  background (0);
  stroke (255);
  line (0, 0, 0, 400);
  line (0, 400, 400, 400);
  line (400, 400, 0, 400);
  line (0, 400, 0, 0);
  frameRate (80);
}
void draw ()
{
  if (gameOver == true)
  {
    textSize (50);
    textAlign (CENTER);
    text ("GAME OVER", 200, 200);
  }
  else
  {
    player();
    computer();
  }
}
void player ()
{
  stroke (255);
  point (x, y);
  if (direction == UP)
  {
    y--;
  }
  else if (direction == DOWN)
  {
    y++;
  }
  else if (direction == LEFT)
  {
    x--;
  }
  else if (direction == RIGHT)
  {
    x++;
  }
  if (get(x, y) != color (0))
  {
    gameOver = true;
    textSize (30);
    textAlign (CENTER);
    text ("PLAYER LOST", 200, 250);
  }
}
void computer ()
{
  stroke (255, 0, 255);
  point (computerX, computerY);
  if (computerDirection == RIGHT)
  {
    computerX++;
    if (get (computerX+1, computerY) != color (0))
    {
      computerDirection = DOWN;
    }
  }
  else if (computerDirection == DOWN)
  {
    computerY++;
    if (get(computerX, computerY+1)!= color (0))
    {
      computerDirection = LEFT;
    }
  }
  else if (computerDirection == LEFT)
  {
    computerX--;
    if (get (computerX-1, computerY) != color (0))
    {
      computerDirection = UP;
    }
  }
  else if (computerDirection == UP)
  {
    computerY--;
    if (get (computerX, computerY-1) != color (0))
    {
      computerDirection = RIGHT;
    }
  }
  if (get(computerX, computerY) != color (0))
  {
    gameOver = true;
    textSize (30);
    textAlign (CENTER);
    text ("COMPUTER LOST", 200, 250);
  }
}
void keyPressed ()
{
  if (keyCode == UP)
  {
    direction = UP;
  }
  else if (keyCode == DOWN)
  {
    direction = DOWN;
  }
  else if (keyCode == LEFT)
  {
    direction = LEFT;
  }
  else if (keyCode == RIGHT)
  {
    direction = RIGHT;
  }
}



