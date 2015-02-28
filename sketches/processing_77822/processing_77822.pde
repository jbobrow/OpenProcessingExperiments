
//Gregory Taxerman, TRON, CP1 16-17


int x = 10;
int y = 400;
int dir = RIGHT;
int compX = 790;
int compY = 400;
int compDIR = LEFT;
boolean gameOver = false;
boolean winner = true;
void setup ()
{
  size(800, 800);
  background(0);
  frameRate(45);
}

void draw ()
{
  if (gameOver == true)
  {
    if (winner == true)
    {
      textSize(64);
      fill(0, 0, 255);
      text("HUMAN WINS", 170, 400);
    }
    else if (winner == false)
    {
      textSize(64);
      fill(255, 0, 0);
      text("COMPUTER WINS", 100, 400);
    }
  }
  else
  {
    human ();
    computer ();
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    dir = UP;
  }
  else if (key == 's')
  {
    dir = DOWN;
  }
  else if (key == 'a')
  {
    dir = LEFT;
  }
  else if (key == 'd')
  {
    dir = RIGHT;
  }
}

void human ()
{
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
    winner = false;
  }
  else
  {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(x, y, 3, 3);
    if (dir == RIGHT)
    {
      x = x + 4;
    }
    else if (dir == LEFT)
    {
      x = x - 4;
    }
    else if (dir == UP)
    {
      y = y - 4;
    }
    else if (dir == DOWN)
    {
      y = y + 4;
    }
  }
}

void computer ()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    gameOver = true;
    winner = true;
  }
  else
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(compX, compY, 3, 3);
    if (compDIR == RIGHT)
    {
      compX = compX + 4;
      if (get(compX+4, compY) != color(0, 0, 0))
      {
        compDIR = UP;
      }
    }
    else if (compDIR == LEFT)
    {
      compX = compX - 4;
      if (get(compX-4, compY) != color(0, 0, 0))
      {
        compDIR = DOWN;
      }
    }
    else if (compDIR == UP)
    {
      compY = compY - 4;
      if (get(compX, compY-4) != color(0, 0, 0))
      {
        compDIR = LEFT;
      }
    }

    else if (compDIR == DOWN)
    {
      compY = compY + 4;
      if (get(compX, compY+4) != color(0, 0, 0))
      {
        compDIR = RIGHT;
      }
    }
  }
}

void mousePressed ()
{
  if (mousePressed = true)
  {
    background(0);
    x = 10;
    y = 400;
    dir = RIGHT;
    compX = 790;
    compY = 400;
    compDIR = LEFT;
    gameOver = false;
  }
}
