
//Alex Lim, CP1 mods 4/5, Tron
//www.dizbalex.webs.com
int x = 100;
int y = 250;
int direction = RIGHT;
int compX = 400;
int compY = 250;
int compDir = LEFT;
boolean LOSE = false;
void setup()
{
  size(500,500);
  background(0);
  textSize (30); 
}
void draw()
{
if (LOSE == false)
  {
    player ();
    comp ();
    }
  }
void player ()
{
  if(get(x,y) != color(0,0,0))
  {
      LOSE = true; 
      text("YOU LOSE", 250, 250);
  }
  stroke(18, 213, 254);
  point(x,y);
  if(direction == RIGHT)
  {
    x++;
  }
  else if(direction == LEFT)
  {
    x--;
  }
  else if(direction == UP)
  {
    y--;
  }
  else if(direction == DOWN)
  {
    y++;
  }
}
void keyPressed()
{
  if(key == 'w')
  {
    direction = UP;
  }
  else if(key == 's')
  {
    direction = DOWN;
  }
  else if(key == 'a')
  {
    direction = LEFT;
  }
  else if(key == 'd')
  {
    direction = RIGHT;
  }
}
void comp ()
{
  stroke (0, 224, 65);
  point (compX, compY);
  if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color (0,0,0))
    {
      compDir = DOWN;
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1)!= color (0,0,0))
    {
      compDir = LEFT;
    }
  }
  else if (compDir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color (0,0,0))
    {
      compDir = UP;
    }
  }
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-1) != color (0,0,0))
    {
      compDir = RIGHT;
    }
    if (get(compX, compY) != color (0,0,0))
    {
    LOSE = true;
    text("YOU WIN", 250, 250);
    }
  }
}
