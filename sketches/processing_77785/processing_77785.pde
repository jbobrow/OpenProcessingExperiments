
//Allison Wong, Tron, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

int x = 50;
int y = 175;
int direction = RIGHT;
int compX = 250;
int compY = 175;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size(350,350);
  background(0);
}
void draw()
{
if (gameOver == false)
  {
    human ();
    computer ();
    }
  }
void human ()
{
  if(get(x,y) != color(0,0,0))
  {
      gameOver = true; 
      text("ONE MORE TRY?",150,175);
    }
    stroke(255,145,10);
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
  if(key == 'd')
  {
    direction = RIGHT;
  }
  else if(key == 'a')
  {
    direction = LEFT;
  }
  else if(key == 'w')
  {
    direction = UP;
  }
  else if(key == 's')
  {
    direction = DOWN;
  }
}
void computer ()
{
  stroke (255,23,23);
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
    gameOver = true;
    text("YOU WIN",175,175);
    }
  }
}
