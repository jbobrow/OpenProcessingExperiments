
//Shela H. CP1, mods 16-17. Tron

int x = 100;
int y = 350;
int direction = RIGHT;

int compX = 500;
int compY = 250;
int compdir = LEFT;
boolean gameOver = false;

void setup()
{
  size(600, 600);
  background(0);
  fill(223,237,74);
  textSize(40);
}

void draw()
{
  if (gameOver == true)
  {
    textAlign(CENTER);
    text("GAME OVER", 300, 300);
  }

  else
  { 
    human();
    computer();
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
  if (get(x, y) != color(0))
  {
    gameOver = true;
  }
  stroke(74,209,95);
  
  point(x,y);
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
  stroke(216,113,15);
   if(get(compX,compY) != color(0))
{
    gameOver = true;
}
  point(compX, compY);
  if (compdir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0))
    {
      compdir = DOWN;
    }
  }
  else if (compdir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0))
    {
      compdir = UP;
    }
  }
  else if (compdir == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0))
    {
      compdir = LEFT;
    }
  }
  else if (compdir == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0))
    {
      compdir = RIGHT;
    }
  }

}
