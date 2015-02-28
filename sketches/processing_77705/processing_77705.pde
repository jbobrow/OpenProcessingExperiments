
//Steven G., mods 14-15 CP1, tron

int x = 300;
int y = 250;
int compx = 200;
int compy = 250;
int dir = UP;
int compdir = UP;
void setup()
{
  stroke(0, 0, 255);
  size(500, 500);
  fill(0);
  rect(0, 0, 499, 499);
  frameRate(250);
  textSize(75);
}
void draw()
{
  if (get(compx, compy) != color(0))
  {
    fill(random(256), random(256), random(256));
    text("You win", 87, 275);
  }
  else if (get(x, y) != color(0))
  {
    fill(random(256), random(256), random(256));
    text("You Lose", 85, 275);
  }
  else
  {
    human();
    comp();
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    dir = UP;
  }
  else if (key == 'd')
  {
    dir = RIGHT;
  }
  else if (key == 'a')
  {
    dir = LEFT;
  }
  else if (key == 's')
  {
    dir = DOWN;
  }
  if (key == 'r')
  {   
    x = 300;
    y = 250;
    compx = 200;
    compy = 250;
    dir = UP;
    compdir = UP;
    fill(0);
    rect(0, 0, 499, 499);
  }
}
void human()
{
  stroke(255);
  point(x, y);
  if (dir == RIGHT)
  {
    x++;
  }
  else if (dir == LEFT)
  {
    x--;
  }
  else if (dir == UP)
  {
    y--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
}
void comp()
{
  stroke(0, 255, 0);
  point(compx, compy);
  if (compdir == RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color(0))
    {
      compdir = DOWN;
    }
  }
  else if (compdir == LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color(0))
    {
      compdir = UP;
    }
  }
  else if (compdir == UP)
  {
    compy--;
    if (get(compx, compy-1) != color(0))
    {
      compdir = RIGHT;
    }
  }
  else if (compdir == DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(0))
    {
      compdir = LEFT;
    }
  }
}



