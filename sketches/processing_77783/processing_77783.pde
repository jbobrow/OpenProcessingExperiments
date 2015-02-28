
int x = 50;
int y = 250;
int direction = RIGHT;
int compX = 450;
int compY = 250;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {
    stroke(123,123,123);
    textSize(50);
    text ("YOU LOSE", 123, 250);
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
  stroke(random(244));
 
    if (get(x, y) !=color(0, 0, 0))
    {
      gameOver = true;
      stroke(random(123),123,123);
      textSize(random(50));
      stroke(random(89),154,232);
      text ("YOU LOSE", 123, 250);
    }
    else
    {
 
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
 
void keyPressed()
{
  if (key=='g')
  {
    direction = LEFT;
  }
  else if (key == 'h')
  {
    direction = RIGHT;
  }
  else if (key == 'y')
  {
    direction = UP;
  }
  else if (key == 'b')
  {
    direction = DOWN;
  }
}
void computer()
{
  stroke(173, random(130), 120);
 
  if (get(compX, compY) !=color(0, 0, 0))
  {
     
    gameOver=true;
  }
  else
  {
 
    point(compX, compY);
 
    if (compDir == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) !=color(0, 0, 0))
      {
        compDir = DOWN;
      }
    }
    else if (compDir == LEFT)
    {
      compX--;
      if (get(compX-1, compY) !=color(0, 0, 0))
      {
        compDir = UP;
      }
    }
    else if (compDir == UP)
    {
      compY--;
      if (get(compX, compY-1) !=color(0, 0, 0))
      {
        compDir = RIGHT;
      }
    }
    else if (compDir == DOWN)
    {
      compY++;
      if (get(compX, compY+1) !=color(0, 0, 0))
      {
        compDir = LEFT;
      }
    }
  }
}
