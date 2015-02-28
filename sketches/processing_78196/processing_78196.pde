
//Jarvis Law, Tron Game, CP1 mods 16-17
int x=50;
int y=200;
int direction=RIGHT;
int compX=350;
int compY=200;
int compDir=LEFT;
boolean gameOver=false;
void setup()
{
  size(400, 400);
  background(0);
  frameRate(60);
}
void draw()
{
  stroke(56, 36, 255);
  if (gameOver==true)
  {
    text("GAME OVER", 200, 100);
  }
  else
  {
    human();
    if (gameOver==false)
    {    
      computer();
    }
  }
}
void human()
{
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver=true;
    textSize(15);
    text("You lose!", 210, 120);
    text("try again",210, 140);

  }
  stroke(27, 217, 222);
  point(x, y);

  if (direction==RIGHT)
  {
    x++;
  }
  else
  {
    if (direction==LEFT)
    {
      x--;
    }
    if (direction==UP)
    {
      y--;
    }
    if (direction==DOWN)
    {
      y++;
    }
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
  else if (key=='w')
  {
    direction=UP;
  }
  else if (key=='s')
  {
    direction=DOWN;
  }
}
void computer()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    gameOver=true;
    text("You win!", 210, 120);
  }
  stroke(224, 217, 27);
  point(compX, compY);

  if (compDir==RIGHT)
  {
    compX++;
    if (get(compX+1, compY) !=color(0, 0, 0))
    {
      compDir=UP;
    }
  }
  else
  {
    if (compDir==LEFT)
    {
      compX--;
      if (get(compX-1, compY) !=color(0, 0, 0))
      {
        compDir=DOWN;
      }
    }
    if (compDir==UP)
    {
      compY--;
      if (get(compX, compY-1) !=color(0, 0, 0))
      {
        compDir=LEFT;
      }
    }
    if (compDir==DOWN)
    {
      compY++;
      if (get(compX, compY+1) !=color(0, 0, 0))
      {
        compDir=RIGHT;
      }
    }
  }
}

void mousePressed()
{
  if (mousePressed = true)

  {
    background(0);
    x=50;
    y=200;
    direction=RIGHT;
    compX=350;
    compY=200;
    compDir=LEFT;
    gameOver=false;
  }
}
