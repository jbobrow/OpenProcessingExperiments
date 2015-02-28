
// Tron Game,Laura R., CP1, 14-15

int x = 305;
int y = 300;
int compX = 295;
int compY = 300;
int compDirection = LEFT;
int direction = RIGHT;
boolean gameOver = false;

void setup()
{
  size(600, 600);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {
    textSize (100);
    fill(255, 0, 0);
    text ("GAME OVER!", 5, 320);
  }
  else
  {
    human();
    computer();
  }
}
void human()
{
  if (get(x, y) != color (0, 0, 0))
  {
    gameOver = true;
  }
  stroke(255, 0, 255);
  point (x, y);

  if (direction == RIGHT)
  {
    x++;
  }
  else 
  {
    if (direction == LEFT)
      x--;
  }
  if (direction  == DOWN)
  {
    y++;
  }
  if (direction == UP)
  {
    y--;
  }
}


void keyPressed() 
{
  if (key == 'a')
  {
    direction = LEFT;
  }
  if (key == 'd')
  {
    direction = RIGHT;
  }
  if (key == 'w')
  {
    direction = UP;
  }
  if (key == 's')
  {
    direction = DOWN;
  }
}

void computer()
{
  if (get(compX, compY) != color (0, 0, 0))
  {
    gameOver = true;
  }
  stroke(8, 252, 230);
  point (compX, compY);

  if (compDirection == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color (0, 0, 0))
    {
      compDirection = UP;
    }
  }

  else if (compDirection == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color (0, 0, 0))
    {
      compDirection = DOWN;
    }
  }

  else if (compDirection  == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color (0, 0, 0))
    {
      compDirection = RIGHT;
    }
  }
  else if (compDirection == UP)
  {
    compY--;
    if (get(compX, compY-1) != color (0, 0, 0))
    {
      compDirection = LEFT;
    }
  }
}



