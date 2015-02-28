
//Alvin Ha. Computer Programming 4-5, Mr Simon
//TRON

int x = 10;
int y = 200;
int direction = RIGHT;
boolean gameOver = false;
int compX = 390;
int compY = 250;
int compDir = LEFT;


void setup()
{
  size(400, 400);
  background(0);
}

void draw()
{
  if (gameOver == true)
  {
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
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
    text("You Lose Noob", 200, 200);
  }
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

void computer()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    fill(255);
    text("Winner winner chicken dinner", 200, 200);
    gameOver = true;
  }
  stroke(255, 0, 0);
  point(compX, compY);
  if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0, 0, 0))
    {
      if (get(compX, compY+1)!= color(0))
      {
        compDir = UP;
      }
      else if (get(compX, compY-1) != color(0))
      {
        compDir = DOWN;
      }     
      else
      {
        if (random(1)<.5)
        {
          compDir = UP;
        }
        else
        {
          compDir = DOWN;
        }
      }
    }
  }

  else if (compDir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0))
    {
      if (get(compX, compY+1) != color(0, 0, 0))
      {
        compDir = UP;
      }
      else if (get(compX, compY-1) != color(0))
      {
        compDir = DOWN;
      }
      else
      {
        if (random(1) <0.5)
        {
          compDir = UP;
        }
        else
        {
          compDir = DOWN;
        }
      }
    }
  }
  
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-1) != color (0))
    {
      if (get(compX+1, compY) != color(0))
      {
        compDir = LEFT;
      }
      else if (get(compX-1, compY) != color(0))

      {
        compDir = RIGHT;
      }
    }
    else
    {
      if (random(1)<.5)
      {
        compDir = RIGHT;
      }
      else
      {
        compDir = LEFT;
      }
    }
  }

  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1)!= color(0))
    {
      if (get(compX+1, compY) !=color(0))
      {
        compDir = LEFT;
      }
      else if (get(compX-1, compY) != color(0))
      {
        compDir = RIGHT;
      }
    }
    else
    {
      if (random(1)<.5)
      {
        compDir = RIGHT;
      }
      else
      {
        compDir = LEFT;
      }
    }
  }
}


void keyPressed()
{
  if (key == 'a' && direction != RIGHT)
  {
    direction = LEFT;
  }
  else if (key == 'd'&& direction != LEFT)
  {
    direction = RIGHT;
  }
  else if (key == 'w' && direction != DOWN)
  {
    direction = UP;
  }
  else if (key == 's' && direction != UP)
  {
    direction = DOWN;
  }
}
