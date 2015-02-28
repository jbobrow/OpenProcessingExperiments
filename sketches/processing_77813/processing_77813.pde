
int x = 400;
int y = 300;
int compX = 390;
int compY = 300;
int asd = UP;
int compasd = DOWN ;
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
    fill(255, 0, 0);
    rect(0, 0, 600, 600);
  }
  else
  {
    human();
    computer();
  }
}

void human()
{
  if(get(x,y) != color(0))
  {
    gameOver = true;
  }
  stroke(255, 255, 0);
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

void keyPressed()
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
  if (get(compX, compY) != color (0))
  {
    gameOver = true;
  }
  stroke(255, 0, 125);
  point(compX, compY);

  if (compasd == RIGHT)
  {
    compX++;
    if (get(compX+1, compY)!= color (0))
    {
      compasd = UP;
    }
  }
  else if (compasd == LEFT)
  {
    compX--;
    if (get(compX-1, compY)!= color (0))
    {
      compasd = DOWN;
    }
  }
  else if (compasd == UP)
  {
    compY--;
    if (get(compX, compY-1)!= color (0))
    {
      compasd = LEFT;
    }
  }
  else if (compasd == DOWN)
  {
    compY++;
    if (get(compX, compY+1)!= color (0))
    {
      compasd = RIGHT;
    }
  }
}
