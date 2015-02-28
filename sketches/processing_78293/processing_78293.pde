
//Tina L., CP1 14/15 Tron
int x = 10;
int y = 250;
int direction = RIGHT;
int compX = 490;
int compY = 250;
int compDirection = LEFT;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
  textSize(20);
}
void draw()
{
  if (gameOver == true)
  {
    textAlign(CENTER);
    text("Game over", 250, 250);
  }
  else
  {
    stroke(0,255,255);
    human();
    stroke(255,0,0);
    computer();
  }
}
void human()
{
  if (get(x, y) != color(0))
  {
    gameOver = true;
  }
  point(x,y);
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
void computer()
{
  point(compX, compY);
  if (compDirection == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0))
    {
      compDirection = DOWN;
    }
  }
  else if (compDirection == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0))
    {
      compDirection = UP;
    }
  }
  else if (compDirection == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0))
    {
      compDirection = LEFT;
    }
  }
  else if (compDirection == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0))
    {
      compDirection = RIGHT;
    }
  }
  if(get(compX,compY) != color(0))
{
    gameOver = true;
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
}
