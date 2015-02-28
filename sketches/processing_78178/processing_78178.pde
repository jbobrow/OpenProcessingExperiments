
/* @pjs globalKeyEvents="true"; */
int x = 10;
int y = 200;
int direction = RIGHT;
int compX = 390;
int compY = 200;
int compDIR = LEFT;
boolean gameOver = false;
void setup()
{
  size(400,400);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {
    fill(255, 0, 0);
    noStroke();
    ellipse(x,y,400,400);
    fill(255);
    text("GAME OVER",170,200);
  }
  else
  {
    human();
    computer();
  }
}
void human()
{
  if (get(x, y) != color(0))
  {
    gameOver = true;
  }
  stroke(232, 14, 152);
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
  if (get(compX, compY) != color(0))
  {
    gameOver = true;
  }
    stroke(62,2,247);
    point(compX,compY);
    if(compDIR == LEFT)
    {
      compX--;
      if (get(compX-1, compY) != color(0))
      {
        if (get(compX-1, compY) != color(0))
        {
          compDIR = DOWN;
        }
        else
        {
          compDIR = UP;
        }
      }
    }
    else if(compDIR == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) != color(0))
      {
        compDIR = UP;
      }
    }
    else if(compDIR == UP)
    {
      compY--;
      if(get(compX,compY-1) != color(0))
      {
        if (get(compX, Y-1) != color(0))
        {
          compDIR = LEFT;
        }
        else
        {
          compDIR = RIGHT;
        }
      }
    }
    else if(compDIR == DOWN)
    {
      compY++;
      if(get(compX, compY+1) != color(0))
      {
        compDIR= RIGHT;
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
}


