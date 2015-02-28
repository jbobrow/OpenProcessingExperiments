
int x=250;
int y=470;
int direction=UP;
int compX=490;
int compY=250;
int comDir=UP;
int compXy=10;
int compYy=250;
int comDiry=UP;
boolean gameOver=false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  if (gameOver==true)
  {
    textAlign(CENTER);
    textSize(30);
    text("GAME OVER", 250, 250);
  }
  else
  {
    human();
    if (gameOver==false)
    {
      computer();
      computer1();
    }
  }
}
void human()
{
  stroke(0, 255, 0);
  point(x, y);
  if (direction==RIGHT)
  {
    x++;
  }
  else if (direction==LEFT)
  {
    x--;
  }
  else if (direction==UP)
  {
    y--;
  }
  else if (direction==DOWN)
  {
    y++;
  }
  if (gameOver==true)
  {
    text("GAME OVER", 250, 250);
  }
  else
  {
    if (get(x, y) !=color(0))
    {
      gameOver=true;
    }
  }
}
void computer()
{
  stroke(255, 0, 0);
  point(compX, compY);
  if (comDir==RIGHT)
  {
    compX++;
    if (get(compX+1, compY) !=color(0, 0, 0))
    {
      comDir=UP;
    }
  }
  else if (comDir==LEFT)
  {
    compX--;
    if (get(compX-1, compY) !=color(0, 0, 0))
    {
      comDir=DOWN;
    }
  }
  else if (comDir==UP)
  {
    compY--;
    if (get(compX, compY-1) !=color(0, 0, 0))
    {
      comDir=LEFT;
    }
  }
  else if (comDir==DOWN)
  {
    compY++;
    if (get(compX, compY+1) !=color(0, 0, 0))
    {
      comDir=RIGHT;
    }
  }
  if(get(compX,compY) !=color(0,0,0))
  {
    fill(255);
    text("GAME OVER");
    gameOver=true;
    }
  }
void computer1()
{
  stroke(0, 0, 255);
  point(compXy, compYy);
  if (comDiry==RIGHT)
  {
    compXy++;
    if (get(compXy+1, compYy) !=color(0, 0, 0))
    {
      comDiry=UP;
    }
  }
  else if (comDiry==LEFT)
  {
    compXy--;
    if (get(compXy-1, compYy) !=color(0, 0, 0))
    {
      comDiry=DOWN;
    }
  }
  else if (comDiry==UP)
  {
    compYy--;
    if (get(compXy, compYy-1) !=color(0, 0, 0))
    {
      comDiry=LEFT;
    }
  }
  else if (comDiry==DOWN)
  {
    compYy++;
    if (get(compXy, compYy+1) !=color(0, 0, 0))
    {
      comDiry=RIGHT;
    }
  }
  if(get(compXy,compYy) !=color(0,0,0))
  {
    fill(255);
    text("GAME OVER");
    gameOver=true;
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


