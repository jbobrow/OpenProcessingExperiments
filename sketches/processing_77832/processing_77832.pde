
//Brian C, Tron, CP1 Mods 16/17

int x = 20;
int y = 200;
int direction = RIGHT;
int compX = 380;
int compY = 200;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size(400, 400);
  background(0);
  noFill();
  stroke(255, 0, 255);
  rect(10, 10, 380, 380);
}
void draw()
{
  stroke(255);
  if (get(x, y) != color(0))
  {
    gameOver = true;
    fill(255, 0, 0);
    noStroke();
    ellipse(200, 200, 200, 200);
    fill(0, 0, 255);
    text("GAME OVER \n YOU LOSE", 60, 210);
  }
  else if (get(compX, compY) != color(0))
  {
    gameOver = true;
    fill(255, 0, 0);
    noStroke();
    ellipse(200, 200, 200, 200);
    fill(0, 0, 255);
    text("GAME OVER \n YOU WIN", 60, 210);
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
  if (key == 'w')
  {
    direction = UP;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
  else if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
  else if (key == 'r')
  {
    gameOver = false;
    background(0);
    fill(0);
    stroke(255, 0, 255);
    rect(10, 10, 380, 380);
    x = 20;
    y = 200;
    direction = RIGHT;
    compX = 380;
    compY = 200;
    compDir = LEFT;
  }
}
void human()
{
  stroke(255);
  if (gameOver == false)
  {
    point(x, y);
  }
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
  stroke(0, 255, 0);
  if (gameOver == false)
  {
    point(compX, compY);
  }
  if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0))
    {
      if (get(compX, compY+1) != color(0))
      {
        compDir = UP;
      }
      else if (get(compX, compY-1) != color(0))
      {
        compDir = DOWN;
      }
      else 
      {
        if (random(1) < .5)
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
      if (get(compX, compY+1) != color(0))
      {
        compDir = UP;
      }
      else if (get(compX, compY-1) != color(0))
      {
        compDir = DOWN;
      }
      else 
      {
        if (random(1) < .5)
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
    if (get(compX, compY-1) != color(0))  
    {  
      if (get(compX+1, compY) != color(0))
      {
        compDir = LEFT;
      }
      else if (get(compX-1, compY) != color(0))
      {
        compDir = RIGHT;
      }
      else 
      {
        if (random(1) < .5)
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
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0))
    {
      if (get(compX+1, compY) != color(0))
      {
        compDir = LEFT;
      }
      else if (get(compX-1, compY) != color(0))
      {
        compDir = RIGHT;
      }
      else 
      {
        if (random(1) < .5)
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
}



