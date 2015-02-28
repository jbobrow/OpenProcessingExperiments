
int x = 250;
int y = 200;
int compx = 300;
int compy = 200;
int compdirection = DOWN;
int direction = UP;

void setup()
{
  size (500, 500);
  background (0);
  stroke(255);
}

void draw()
{
  stroke(255);
  if (get(x, y) !=color(0))
  {
    background(255, 0, 0);
  }
  else
  {
    human();
    computer();
  }
}

void human()
{
  point (x, y);

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
  if (key =='a')
  {
    direction = LEFT;
  }
  else if (key =='d')
  {
    direction = RIGHT;
  }
  else if (key =='w')
  {
    direction = UP;
  }
  else if (key =='s')
  {
    direction = DOWN;
  }
}

void computer()
{
   
  if (get(compx, compy) !=color(0))
  {
    background(255, 0, 0);
  }   
  point (compx, compy);
  if (compdirection == RIGHT)
  {
    compx++;
    if (get(compx+1, compy) !=color(0))
    {
      compdirection = UP;
    }
  }
  else if (compdirection == LEFT)
  {
    compx--;
    if (get(compx-1, compy) !=color(0))
    {
      compdirection = DOWN;
    }
  }
  else if (compdirection == UP)
  {
    compy--;
    if (get(compx, compy-1) !=color(0))
    {
      compdirection = LEFT;
    }
  }
  else if (compdirection == DOWN)
  {
    compy++;
    if (get(compx, compy+1) !=color(0))
    {
      compdirection = RIGHT;
    }
  }
}
