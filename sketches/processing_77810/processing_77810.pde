
//Stephanie Wong mods;15-15 TRON
int x=250;
int y=250;
int direction=UP;
int compx=230;
int compy=250;
int compdirection=UP;
boolean gameOver=false;
void setup()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(255, 0, 255);
  quad(1, 1, 1, 499, 499, 499, 499, 1);
}
void draw()
{
  if (gameOver==true)
  {
    textSize(80);
    text("GAME OVER!!!", 0, 250);
  }
  else
  {
    human();
    computer();
  }
}
  void human()
  {
    if (get(x, y) !=color(0))
    {
      gameOver=true;
    }
    stroke(5, 245, 175);
    point(x, y);
    if (direction==RIGHT)
    {
      x++;
    }
    if (direction==LEFT)
    {
      x--;
    }
    if (direction==DOWN)
    {
      y++;
    }
    if (direction==UP)
    {
      y--;
    }
  }
  void keyPressed()
  {
    if (key=='a')
    {
      direction=LEFT;
    }
    if (key=='d')
    {
      direction=RIGHT;
    }
    if (key=='w')
    {
      direction=UP;
    }
    if (key=='s')
    {
      direction=DOWN;
    }
  }
  void computer()
  {
    if (get(compx, compy) !=color(0))
    {
      gameOver=true;
    }
    stroke(242, 138, 10);
    point(compx, compy);
    if (compdirection==RIGHT)
    {
      compx++;
      if (get(compx+1, compy)!= color(0))
      {
        compdirection=DOWN;
      }
    }
    else if (compdirection==LEFT)
    {
      compx--;
      if (get(compx-1, compy)!= color(0))
      {
        compdirection=UP;
      }
    }
    else if (compdirection==DOWN)
    {
      compy++;
      if (get(compx, compy+1)!= color(0))
      {
        compdirection=LEFT;
      }
    }
    else  if (compdirection==UP)
    {
      compy--;
      if (get(compx, compy-1)!= color(0))
      {
        compdirection=RIGHT;
      }
    }
  }
