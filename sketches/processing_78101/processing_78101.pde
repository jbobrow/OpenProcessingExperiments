
int humandir = UP;
int x = 100;
int y = 175;

void setup()
{
  size (350, 350);
  background (0);
}

void draw()
{
  human ();
}


void keyPressed()
{ 
  if (key == 'w')
  {
    humandir = UP;
  }
  else if (key == 'a')
  {
    humandir = LEFT;
  }
  else if (key == 's')
  {
    humandir = DOWN;
  }
  else if (key == 'd')
  {
    humandir = RIGHT;
  }
}

void human()
{
  stroke (81, 222, 161);
  if (get(x, y) != color(0, 0, 0)) 
  {
    text("Game Over", 150, 175);
  }
  else
  {
    point (x, y);
    if (humandir == RIGHT)
    {
      x++;
    }
    else if (humandir == LEFT)
    {  
      x--;
    }
    else if (humandir == UP)
    {
      y--;
    }
    else if (humandir == DOWN)
    {
      y++;
    }
  }
}
