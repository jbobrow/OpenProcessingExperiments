
//Simon L, Tron, CP1 Mods 14-15
int x = 20;
int y = 20;
int direction = RIGHT;
int compx = 230;
int compy = 230;
int compdirection = LEFT;
boolean gameOver = false;
void setup()
{
  size(250, 250);
  background(0);
  textSize(25);
}
void draw()
{
  if (gameOver == true)
  {
    text("GAME OVER", 20, 100);
  }
  else
  {
    human();
    if (gameOver == false)
    {
      computer();
    }
  }
}
void keyPressed()
{
  if (keyCode == RIGHT)
  {
    direction = UP;
  }
  else if (keyCode == UP)
  {
    direction = DOWN;
  }
  else if (keyCode == DOWN)
  {
    direction = RIGHT;
  }
  else if (keyCode == LEFT)
  {
    direction = LEFT;
  }
}
void human()
{
  if (get(x, y) != color(0, 0, 0))
  {
    fill(255, 0, 0);
    text("GAME OVER\nHUMAN LOSE", 20, 100);
    gameOver = true;
  }
  stroke(255);
  point(x, y);
  if (direction == RIGHT)
  {
    x++;
  }
  if (direction == LEFT)
  {
    x--;
  }
  if (direction == UP)
  {
    y--;
  }
  if (direction == DOWN)
  {
    y++;
  }
}
void computer()
{
  if (get(compx, compy) != color(0, 0, 0)) 
  {
    fill(0, 0, 255);
    text("GAME OVER\nCOMPUTER LOSE", 20, 100);
    gameOver = true;
  }
  stroke(255, 0, 255);
  point(compx, compy);
  if (compdirection == RIGHT)
  {
    compx++;
    if (get(compx + 1, compy) != color(0, 0, 0))
    {
      compdirection = DOWN;
    }
  }
  if (compdirection == LEFT)
  {
    compx--;
    if (get(compx - 1, compy) != color(0, 0, 0))
    {
      compdirection = UP;
    }
  }
  if (compdirection == UP)
  {
    compy--;
    if (get(compx, compy - 1) != color(0, 0, 0))
    {
      compdirection = RIGHT;
    }
  }
  if (compdirection == DOWN)
  {
    compy++;
    if (get(compx, compy + 1) != color(0, 0, 0))
    {
      compdirection = LEFT;
    }
  }
}
