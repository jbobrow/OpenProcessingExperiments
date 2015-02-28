
int x = 400;
int y = 300;
int compX = 390;
int compY = 300;
int compASD = DOWN;
int asd = UP;
boolean gameOver = false;

void setup()
{
  size(800, 600);
  background(0);
  stroke(0);
}
void draw()
{
  if (gameOver == true)
  {
    fill(255,0,0);
    ellipse(400, 300, 200, 200);
  }
  else 
  {
    human();
    computer();
  }
}
void human()
{
  if (get(x,y) != color(0, 0, 0))
  {   
    gameOver = true;
  }
    stroke(255);
    point(x, y);
    if (asd == RIGHT)
    {
      x++;
    }
    if (asd == LEFT)
    {
      x--;
    }
    if (asd == UP)
    {
      y--;
    }
    if (asd == DOWN)
    {
      y++;
    }
  }
void keyPressed ()
{
  if (key == 'w')
  {
    asd = UP;
  }
  else if (key == 's')
  {
    asd = DOWN;
  }
  else if (key == 'a')
  {
    asd = LEFT;
  }
  else if (key == 'd')
  {
    asd = RIGHT;
  }
}   
void computer()
{ 
  if (get(compX, compY) != color(0, 0, 0))
  {
    gameOver = true;
  }
  stroke(0, 255, 0);
  point(compX, compY);
  if (compASD == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0, 0, 0))
    {
      compASD = UP;
    }
  }
  else if (compASD == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0, 0, 0))
    {
      compASD = DOWN;
    }
  }
  else if (compASD == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0, 0, 0))
    {
      compASD = RIGHT;
    }
  }
  if (compASD == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0, 0, 0))
    {
      compASD = LEFT;
    }
  }
}
