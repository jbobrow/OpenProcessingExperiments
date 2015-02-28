
//Derek King, Tron, CP1 mods 14-15
//http://dereklucca.webs.com/Tron.html

int x = 300;
int y = 250;
int compx = 200;
int compy = 250;
int dir = UP;
int compdir = UP;
void setup()
{
  stroke(255, 255, 255);
  size(500, 500);
  fill(0);
  rect(0, 0, 499, 499);
  frameRate(200);
  textSize(80);
}
void draw()
{
  if (get(compx, compy) != color(0))
  {
    fill(random(256), random(256), random(256));
    text("Eh Lucky...", 90, 275);
  }
  else if (get(x, y) != color(0))
  {
    fill(random(256),random(256),random(256));
    text("LOSER !!!", 90, 275);
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
  stroke(219, 240, 7);
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
