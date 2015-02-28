
int direction = RIGHT;
int a = 50;
int n = 50;
int cdirection = LEFT;
int compD = 450;
int compY = 450;
int m = 5;
boolean gameOver = false;
void setup()
{
  size (500, 500);
  background (0);
}
void draw()
{
  stroke(0, 255, 0);
  frameRate(25);
  if (get(a, n) != color(0, 0, 0))
  {
    fill(255, 0, 0);
    ellipse(a+1, n+3, 10, 10);
    gameOver = true;
    text("GG NO RE, COMPUTER WINS!", 200, 250);
  }
  else if (get(compD, compY) != color (0))
  {
    fill(255, 0, 0);
    ellipse(compD, compY, 10, 10);
    gameOver = true;
    text("NOT BAD.jpg, YOU WIN!", 200, 250);
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
  fill(0, 255, 0);
  rect(a, n, 3, 3);
  if (direction == RIGHT)
  {
    a=a+4;
  }
  else if (direction == LEFT)
  {
    a=a-4;
  }
  else if (direction ==UP)
  {
    n=n-4;
  }
  else if (direction ==DOWN)
  {
    n=n+4;
  }
}

void computer()
{
  stroke (0, 100, 250);
  fill(0, 100, 250);
  rect(compD, compY, 3, 3);
  if (cdirection == LEFT)
  {
    compD=compD-4;
    if (get(compD-5, compY) != color (0, 0, 0))
    {
      cdirection = DOWN;
    }
  }
  else if (cdirection == RIGHT)
  {
    compD=compD+4;
    if (get(compD+5, compY) != color (0, 0, 0))
    {
      cdirection = UP;
    }
  }
  else if (cdirection == DOWN)
  {
    compY=compY+4;
    if (get(compD, compY+5) != color (0, 0, 0))
    {
      cdirection = RIGHT;
    }
  }
  else if (cdirection == UP)
  {
    compY=compY-4;
    if (get(compD, compY-5) != color (0, 0, 0))
    {
      cdirection = LEFT;
    }
  }
}
void keyPressed()
{
  if (key == 'l')
  {
    gameOver = false;
  }
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

