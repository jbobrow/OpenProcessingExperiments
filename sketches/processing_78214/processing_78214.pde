
int x=150;
int y=150;
int direction=RIGHT;
int compx=350;
int compy=350;
int compdirection=LEFT;
boolean gameover=false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  //frameRate(16);
    textAlign(CENTER);
  textSize(40);
  if (gameover==false)
  {
    human();
  }
  if (gameover==false)
  {
    comp();
  }

}


void keyPressed()
{
  if (key==CODED)
  {
    if (keyCode==UP)
    {
      direction=UP;
    }
    else if (keyCode==DOWN)
    {
      direction=DOWN;
    }
    else if (keyCode==RIGHT)
    {
      direction=RIGHT;
    }
    else if (keyCode==LEFT)
    {
      direction=LEFT;
    }
  }
}
void human()
{
  stroke(255);
  if (get(x, y) !=color (0, 0, 0))
  {
    text("you lose",250,250);
    gameover=true;
  }
  else
  {
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
  }
}
void comp()
{
  stroke(255, 0, 0);
  if (get(compx, compy) !=color (0, 0, 0))
  {
    text ("comp loses",250,250);
    gameover=true;
  }
  point(compx, compy);
  if (compdirection== RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color (0))
    {
      compdirection= DOWN;
    }
  }
  else if (compdirection == LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color (0))
    {
      compdirection= UP;
    }
  }
  else if (compdirection == UP)
  {
    compy--;
    if (get(compx, compy-1) != color(0))
    {
      compdirection = RIGHT;
    }
  }
  else if (compdirection == DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(0))
    {
      compdirection= LEFT;
    }
  }
}
