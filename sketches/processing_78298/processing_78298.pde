
//Jimmy C; CP1; Block 6

int x=20;
int y=250;
int compx=480;
int compy=250;
int direction = RIGHT;
int compdirection = LEFT;
boolean gameOver=false;
void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  frameRate(60);
}

void draw()
{
  human();
  if (gameOver == false)
  {
    computer();
  }
}

void computer()
{
  stroke(255,0,0);
  point (compx,compy);
  if (compdirection==LEFT)
  {
    compx=compx-1;
    if (get(compx-1,compy) != color(0))
    {
      compdirection=UP;
    }
  }
  if (compdirection==UP)
  {
    compy=compy-1;
    if (get(compx,compy-1) != color(0))
    {
      compdirection=RIGHT;
    }
  }
  if (compdirection==RIGHT)
  {
    compx=compx+1;
    if (get(compx+1,compy) != color(0))
    {
      compdirection=DOWN;
    }
  }
  if (compdirection==DOWN)
  {
    compy=compy+1;
    if (get(compx,compy+1) != color(0))
    {
      compdirection=LEFT;
    }
  }
  if (get(compx-1,compy) != color(0))
  {
    compx = int(random(5,495));
    compy = int(random(5,495));
    compdirection=RIGHT;
  }
    
}
void human()
{
  if (get(x, y) != color(0, 0, 0))
  {
    fill(255, 0, 0);
    textSize(18);
    text("Human Lost", 250, 250);
    gameOver = true;
  }
  else
  {
    stroke(0,0,255);
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
  if (key == 's')
  {
    direction = DOWN;
  }
  if (key == 'w')
  {
    direction = UP;
  }
  if (key == 'a')
  {
    direction = LEFT;
  }
  if (key == 'd')
  {
    direction = RIGHT;
  }
}
