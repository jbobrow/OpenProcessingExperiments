
int x = 10;
int y = 250;
int compx = 490;
int compy = 250;
int direction = RIGHT;
int compDirection = LEFT;
boolean gameOver1 = false;
boolean gameOver2 = false;
void setup()
{
  size(500, 500);
  background(255);
  //frameRate(1);
}
void draw()
{
  if ( gameOver1 || gameOver2 == true)
  {
    fill(0);
    direction = 0;
    compDirection = 0;
    if (gameOver1 ==true)
    {
      textSize(40);
      text("Player 1", 250, 250);
      text("Game Over", 250, 282);
    }
    if (gameOver2 == true)
    {
      textSize(40);
      text("Computor", 250, 250);
      text("Game Over", 250, 282);
    }
  }
  else 
  {
    human();
    computer();
  }
} 
void keyPressed()
{
  if (key =='a')
  {
    direction = LEFT;
  }
  else if (key == 'w')
  {
    direction = UP;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
}
void human()
{
  if (get(x, y) != color(255))
  {
    gameOver1 = true;
  } 
  stroke(47, 45, 234);
  point(x, y);

  if (direction == LEFT)
  {
    x--;
  }
  else if (direction == RIGHT)
  {
    x++;
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
  if (get(compx, compy) != color(255))
  {
    gameOver2 = true;
  } 
  stroke(224, 23, 29);
  point(compx, compy);

  if (compDirection == LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color(255))
    {
      compDirection = DOWN;
    }
  }
  else if (compDirection == RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color(255))
    {
      compDirection = UP;
    }
  }
  else if (compDirection == UP)
  {
    compy--;
    if (get(compx, compy-1) != color(255))
    {
      compDirection = LEFT;
    }
  }
  else if (compDirection == DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(255))
    {
      compDirection =RIGHT;
    }
  }
}
