
//Aaron L. Mods 4-5 CP1 
int x = 100;
int y = 250;
int dir = RIGHT;
int compx = 400;
int compy = 250;
int compdir = LEFT;
boolean Win = false;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
  textAlign(CENTER);
  textSize(50);
}
void draw()
{
  if (gameOver == true)
  {
    text("YOU LOSE", 250, 250);
  }
  if (Win == true)
  {
    text("YOU WIN", 250, 250);
  }
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
  }
  else if (get(compx, compy) != color(0))
  {
    Win = true;
  }
  else
  {
    human();
    computer();
  }
}
void keyPressed()
{
  if (key == 'd')
  {
    dir = RIGHT;
  }
  else if (key == 'a')
  {
    dir = LEFT;
  }
  else if (key == 'w')
  {
    dir = UP;
  }
  else if (key == 's')
  {
    dir = DOWN;
  }
}  
void mouseClicked()
{
  gameOver = false;
  youWin = false;
  background(0);
  x = 30;
  y = 250;
  dir = RIGHT;
  compx = 400;
  compy = 200;
  compdir = LEFT;
}
void human()
{
  stroke(255, 0, 0);
  point(x, y);
  if (dir == RIGHT)
  {
    x++;
  }
  else if (dir == LEFT)
  {
    x--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
  else if (dir == UP)
  {
    y--;
  }
} 
void computer()
{
  stroke(0, 255, 0);
  point(compx, compy);
  if (compdir == LEFT)
  {
    compx--;
    if (get(compx - 1, compy) != color(0))
    {
      compdir = DOWN;
    }
  }
  else if (compdir == RIGHT)
  {
    compx++;
    if (get(compx + 1, compy) != color(0))
    {
      compdir = UP;
    }
  }

  else if (compdir == DOWN)
  {
    compy++;
    if (get(compx, compy + 1) != color(0))
    {
      compdir = RIGHT;
    }
  }
  else if (compdir == UP)
  {
    compy--;
    if (get(compx, compy - 1) != color(0))
    {
      compdir = LEFT;
    }
  }
}

