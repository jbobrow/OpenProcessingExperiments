
//Justin L., Tron, Mods 16/17, CP1 

int x = 150;
int y = 150;
int direction = UP;
int compX = 170;
int compY = 150;
int compDir = UP;
boolean gameOver = false;

void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  if (gameOver == false)
  {
    human();
    computer();
  }
}

void human()
{
  stroke(250, 40, 20);
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
    fill(250, 100, 210);
    textSize(15);
    text("GAME OVER! HUMAN LOST LOL", 150, 250);
    if (mousePressed == true)
    {
      background(0);
      x = 150;
      y = 150;
      compX = 170;
      compY = 150;
      direction = UP;
      compDir = UP;
      gameOver = false;
    }
  }
  point(x, y);
  if (direction == RIGHT)
  {
    x++;
  }
  else if (direction==LEFT)
  {
    x--;
  }
  else if ( direction == UP )
  {
    y--;
  }
  else if ( direction == DOWN )
  {
    y++;
  }
  if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
  else if ( key == 'w' )
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
  stroke(0, 250, 20);
  if (get(compX, compY) != color(0, 0, 0))
  {
    gameOver = true;
    fill(250, 100, 210);
    textSize(15);
    text("(_8(|) computer defeated", 50, 250);
  }
  point(compX, compY);
  if (compDir == RIGHT)
  {
    compX++;
  }
  else if (compDir==LEFT)
  {
    compX--;
  }
  else if ( compDir == UP )
  {
    compY--;
    if(get(compX,compY-1) != color(0,0,0))
    {
      compDir = RIGHT;
    }
  }
  else if ( compDir == DOWN )
  {
    compY++;
  }
}
