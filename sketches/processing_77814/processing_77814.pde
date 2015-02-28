
//Hayley G, CP1, 14-15


int x = 150;
int y = 250;
int direction = LEFT;
int compx = 490;
int compy = 150;
int compdirection = LEFT;
boolean gameOver = false;
boolean humanLost = false;
boolean computerLost = false;

void setup()
{
  size(500, 500);
  background(0, 0, 0);
}

void draw ()
{
  if (gameOver == true)
  {
    text("GAME OVER",250,150);
    if(humanLost == true)
    {
      text("Computer Wins",250,250);
    }
    else if(computerLost == true)
    {
      text("Human Wins",250,250);
    }
  }
  else
  {
    human();
    computer();
  }
}

void human()
{
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
    humanLost = true;
  }
  else
  {
    stroke(255);
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


void computer()
{
  if (get(compx, compy) != color(0))
  {
    gameOver = true;
    computerLost = true;
//    text("GAME OVER", 250, 250);
  } 
  else
  {
    stroke(255, 0, 0);
    point(compx, compy);
    if (compdirection == LEFT)
    {
      compx--;
      if (get(compx-1, compy)!= color(0))
      {
        compdirection = DOWN;
      }
    }
    else if (compdirection == RIGHT)
    {
      compx++;
      if (get(compx+1, compy)!= color(0))
      {
        compdirection = UP;
      }
    }
    else if (compdirection == UP)
    {
      compy--;
      if (get(compx, compy-1)!= color(0))
      {
        compdirection = RIGHT;
      }
    }
    else if (compdirection == DOWN)
    {
      compy++;
      if (get(compx, compy+1)!= color(0))
      {
        compdirection = LEFT;
      }
    }
    else
    {
      if (random(compx) < 250)
      {
        compdirection = RIGHT;
      }
      else
      {
        compdirection = LEFT;
      }
    }
  }
}

void keyPressed()
{
  if (key == 's')
  {
    direction = LEFT;
  }
  else if (key == 'f')
  {
    direction = RIGHT;
  }
  else if (key == 'e')
  {
    direction = UP;
  }
  else if (key == 'd')
  {
    direction = DOWN;
  }
}
