
//Winston L, TRON (Player vs Player), CP1, Mods 4-5
//http://www.openprocessing.org/sketch/

int u=UP;
int v=260;
int w=250;
int x=240;
int y=250;
int z=UP;
boolean youLose = false;


void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{ 
  if (youLose==true)
  {
  }
  else
  {
    player1();
    player2();
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    z=UP;
  }
  if (key == 's')
  {
    z=DOWN;
  }
  if (key == 'a')
  {
    z=LEFT;
  }
  if (key == 'd')
  {
    z=RIGHT;
  }
  if (keyCode == UP)
  {
    u=UP;
  }
  if (keyCode == DOWN)
  {
    u=DOWN;
  }
  if (keyCode == LEFT)
  {
    u=LEFT;
  }
  if (keyCode == RIGHT)
  {
    u=RIGHT;
  }
}
void player1()
{
  if (get(x, y) != color(0))
  {
    z=0;
    youLose=true;
    background(0);
    textAlign(CENTER);
    textSize(30);
    text("Game Over! Player1 loses!", 250, 250);
  }
  stroke(100, 200, 255);
  point(x, y);
  if (z == UP)
  {
    y--;
  }
  if (z == DOWN)
  {
    y++;
  }
  if (z == LEFT)
  {
    x--;
  }
  if (z == RIGHT)
  {
    x++;
  }
}
void player2()
{
  if (get(v, w) != color(0))
  {
    u=0;
    youLose=true;
    background(0);
    textAlign(CENTER);
    textSize(30);
    text("Game Over! Player2 loses!", 250, 250);
  }
  stroke(255, 0, 0);
  point(v, w);
  if (u == UP)
  {
    w--;
  }
  if (u == DOWN)
  {
    w++;
  }
  if (u == LEFT)
  {
    v--;
  }
  if (u == RIGHT)
  {
    v++;
  }
}
