
int x = 5;
int y = 250;
int direction = RIGHT;
boolean gameOver = false;
int compX = 495;
int compY = 250;
int compDirection = LEFT;
void setup()
{
  size(500, 500);
  background(0);
  textSize(50);
  frameRate(100);
}
void draw()
{
  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  rect(0, 0, 500, 500);
  strokeWeight(1);
  textAlign(CENTER);
  if (gameOver == true)
  {
    text("GAME OVER", 250, 250);
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
void human()
{
  if (get(x, y) != color (0))
  {
    gameOver = true;
    text("You lose!", 250, 310);
  }
  else
  {
    if (get(x, y) != color (0))
    {
      gameOver = true;
    }
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
  if (get(compX, compY) != color (0))
  {
    gameOver = true;
    text("You win!", 250, 310);
  }
  else
  {
    if (get(compX, compY) != color (0))
    {
      gameOver = true;
    }
    stroke(0, 255, 0);
    point(compX, compY);
    if (compDirection == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) != color(0))
      {
        if (get(compX, compY+1) != color(0))
        {
          compDirection = UP;
        }
        else if (get(compX, compY-1) != color(0))
        {
          compDirection = DOWN;
        }
        else
        {
          if (random(1)<.5)
          {
            compDirection = UP;
          }
          else
          {
            compDirection = DOWN;
          }
        }
      }
    }
    else if (compDirection == LEFT)
    {
      compX--;
      if (get(compX-1, compY) != color(0))
      {
        if (get(compX, compY+1) != color(0))
        {
          compDirection = UP;
        }
        else if (get(compX, compY-1) != color(0))
        {
          compDirection = DOWN;
        }
        else
        {
          if (random(1)<.5)
          {
            compDirection = UP;
          }
          else
          {
            compDirection = DOWN;
          }
        }
      }
    }
    else if (compDirection == UP)
    {
      compY--;
      if (get(compX, compY-1) != color(0))
      {
        if (get(compX-1, compY) != color(0))
        {
          compDirection = RIGHT;
        }
        else if (get(compX+1, compY) != color(0))
        {
          compDirection = LEFT;
        }
        else
        {
          if (random(1)<.5)
          {
            compDirection = RIGHT;
          }
          else
          {
            compDirection = LEFT;
          }
        }
      }
    }
    else if (compDirection == DOWN)
    {
      compY++;
      if (get(compX, compY+1) != color(0))
      {
        if (get(compX-1, compY) != color(0))
        {
          compDirection = RIGHT;
        }
        else if (get(compX+1, compY) != color(0))
        {
          compDirection = LEFT;
        }
        else
        {
          if (random(1)<.5)
          {
            compDirection = RIGHT;
          }
          else
          {
            compDirection = LEFT;
          }
        }
      }
    }
  }
}
