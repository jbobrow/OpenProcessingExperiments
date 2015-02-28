
int x=10;
int y=250;
int direction=RIGHT;
int compx=490;
int compy=250;
int compDir=LEFT;
int v=0;
boolean gameOver=false;
void setup()
{
  size (500, 500);
  background(0);
}

void draw()
{
  if (gameOver==true)
  {
    text("GAME OVER", 250, 320);
  }
  else
  {
    human();
    computer();
  }
}
void human()
{

  {
    frameRate(19+v);
    v=v+1;
  }
  if (get(x, y) != color(0))
  {
    gameOver = true;
    {
      text("COMPUTER WINS", 250, 340);
    }
  }
  stroke (0, 255, 0);
  point (x, y);

  if (direction==RIGHT)
  {
    x++;
  }
  else if (direction==UP)
  {
    y--;
  }
  else if (direction==LEFT)
  {
    x--;
  }
  else if (direction==DOWN)
  {
    y++;
  }
}



void keyPressed()
{
  if (key=='a')
  {
    direction=LEFT;
  }
  else if (key=='d')
  {
    direction=RIGHT;
  }
  else if (key=='s')
  {
    direction=DOWN;
  }
  else if (key=='w')
  {
    direction=UP;
  }
}
void computer()
{
  if (get(compx, compy) != color(0))
  {
    gameOver = true;
    {
      text("HUMAN WINS", 250, 340);
    }
  }
  stroke (0, 255, 0);
  point (compx, compy);

  if (compDir==RIGHT)
  {
    compx++;
    if (get(compx+1, compy)!=color(0))
    {
      compDir=DOWN;
    }
  }
  else if (compDir==UP)
  {
    compy--;
    if (get(compx, compy-1)!=color(0))
    {
      compDir=RIGHT;
    }
  }
  else if (compDir==LEFT)
  {
    compx--;
    if (get(compx - 1, compy)!= color(0))
    {
      compDir=UP;
    }
  }
  else if (compDir==DOWN)
  {
    compy++;
    if (get(compx, compy+1)!=color(0))
    {
      compDir=LEFT;
    }
  }
}


