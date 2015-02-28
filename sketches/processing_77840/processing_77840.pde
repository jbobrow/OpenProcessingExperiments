
//Brandan H. Computer Prog. 1 Bl;ock 7
int x=10;
int y=250;
int direction = RIGHT;
int compDirection = LEFT;
int compX = 490;
int compY = 250;
boolean game = false;
boolean game1 = false;
boolean gameOver = false;
void setup()
{
  size (500, 500);
  background(0);
  frameRate(50);
}
void draw()
{
  if (get(x, y) != color(0, 0, 0)) //we crashed!
  {
    textSize(50);
    text("GAME OVER", 125, 250);
    gameOver = true;
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
  stroke(255, 255, 0);
  point(x, y);
  if (direction == RIGHT)
  {
    x++;
  }
  else if (direction == LEFT)
  {
    x--;
  }
  else if (direction == DOWN)
  {
    y++;
  }
  else if (direction == UP)
  {
    y--;
  }
}
void computer()
{
  stroke(0, 255, 255);
  if (get(compX, compY) != color(0, 0, 0))
  {
    textSize(50);
    text("GAME OVER", 125, 250);
    gameOver = true;
  }
  else
  {
    if (gameOver == false)
      point(compX, compY);
    if (compDirection==UP)
    {
      compY--;
      if (get(compX, compY-1) !=color(0, 0, 0))
      {
        compDirection= RIGHT;
      }
    }
    else if (compDirection== RIGHT)
    {
      compX++;
      if (get(compX+1, compY) !=color(0, 0, 0))
      {
        compDirection=DOWN;
      }
    }
    else if (compDirection==DOWN)
    {
      compY++;
      if (get(compX, compY+1) !=color(0, 0, 0))
      {
        compDirection=LEFT;
      }
    }
    else if (compDirection== LEFT)
    {
      compX--;
      if (get(compX-1, compY) !=color(0, 0, 0))
      {
        compDirection=UP;
      }
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
  if (key == 'k')
  {
    frameRate(35000);
  }
  if (key == 'j')
  {
    frameRate(50);
  }
  if (key == ' ')
  {
    fill (0);
    rect(0, 0, 500, 500);
    x=10;
    y=250;
    compX=490;
    compY=250;
    direction = RIGHT;
    compDirection = LEFT;
    game1=false;
    game=false;
    gameOver=false;
  }
}
