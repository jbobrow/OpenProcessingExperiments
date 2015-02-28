
int x = 50;
int y = 250;
int direction = RIGHT;
int compX = 450;
int compY = 250;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {
    textSize(30);
    text ("Game Over!", 170, 250);
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
void human()
{
  stroke(255);

    if (get(x, y) !=color(0, 0, 0))
    {
      gameOver = true;
      textSize(30);
      text ("Game Over!", 170, 250);
    }
    else
    {

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

void keyPressed()
{
  if (key=='a')
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
}
void computer()
{
  stroke(255, 0, 0);

  if (get(compX, compY) !=color(0, 0, 0))
  {
    
    gameOver=true;
  }
  else
  {

    point(compX, compY);

    if (compDir == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) !=color(0, 0, 0))
      {
        compDir = DOWN;
      }
    }
    else if (compDir == LEFT)
    {
      compX--;
      if (get(compX-1, compY) !=color(0, 0, 0))
      {
        compDir = UP;
      }
    }
    else if (compDir == UP)
    {
      compY--;
      if (get(compX, compY-1) !=color(0, 0, 0))
      {
        compDir = RIGHT;
      }
    }
    else if (compDir == DOWN)
    {
      compY++;
      if (get(compX, compY+1) !=color(0, 0, 0))
      {
        compDir = LEFT;
      }
    }
  }
}
