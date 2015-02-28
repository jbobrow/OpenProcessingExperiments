
int x = 10;
int y = 250;
int direction = RIGHT;
int compX = 490;
int compY = 250;
int compdirection = LEFT;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(100);
}
void draw()
{
  if (gameOver==true)
  {
    fill(255, 0, 0);
    textSize(35);
    textAlign(CENTER);
    text("GAME OVER", 250, 250);
  }
  else
  {
    human();
    if ( gameOver ==false)
    {
      comp();
    }
  }
}
void human()
{
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
  }
  else
  {
    stroke(255, 0, 255);
    point(x, y);
    if (direction == RIGHT)
    {
      x++;
    }
    else if (direction == LEFT)
    {
      x--;
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
void comp()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    gameOver = true;
  }
  else
  {
    stroke(0, 255, 0);
    point(compX, compY);
    if (compdirection == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) != color(0, 0, 0))
      {
        compdirection =UP;
      }
    }
    else if (compdirection == LEFT)
    {
      compX--;
      if (get(compX-1, compY) != color(0, 0, 0))
      {
        compdirection =DOWN;
      }
    }
    else if (compdirection == UP)
    {
      compY--;
      if (get(compX, compY -1) != color(0, 0, 0))
      {
        compdirection =LEFT;
      }
    }
    else if (compdirection == DOWN)
    {
      compY++;
      if (get(compX, compY +1) != color(0, 0, 0))
      {
        compdirection =RIGHT;
      }
    }
  }
}
void keyPressed()
{
  if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
  else if (key == 'w')
  {
    direction = UP;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
  else if (key == 'r')
  {
    fill(0);
    rect(0, 0, 500, 500);
    x= 10;
    y = 250;
    direction = RIGHT;
    compX = 490;
    compY = 250;
    compdirection = LEFT;
    gameOver =false;
  }
}
