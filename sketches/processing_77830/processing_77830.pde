
//Dan-Tran Cong-Huyen, Tron, CP1 16/17
/* @pjs globalKeyEvents="true"; */
int x = 100;
int y = 250;
int direction = RIGHT;
int compX = 400;
int compY = 450;
int compDir = LEFT;
void setup()
{
  size(500, 500);
  background(0);
  fill(0);
  stroke(0,255,0);
  rect(0,0,500,500);
}
void draw()
{ 
  if (get(x, y) != color(0, 0, 0))
  {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER, COMPUTER WINS",250,250);
  }
  else if (get(compX, compY) != color(0, 0, 0))
  {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER, HUMAN WINS",250,250);
  }
  else
  {
    human();
    computer();
  }
}
void human()
{
  stroke(250, 78, 247);
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
void computer()
{
  stroke(153,81,250);
  point(compX, compY);
  if (compDir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0, 0, 0))
    {
      compDir = UP;
    }
  }
  else if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0, 0, 0))
    {
      compDir = DOWN;
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0, 0, 0))
    {
      compDir = LEFT;
    }
  }
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0, 0, 0))
    {
      compDir = RIGHT;
    }
  }
}
