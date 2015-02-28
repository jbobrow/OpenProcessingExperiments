
//Jun Min Zhong, Mods 16-17, CP1, Tron

int x=100;
int y=500;
int direction=RIGHT;
int compx=900;
int compy=500;
int compdir=LEFT;
boolean GG=false;

void setup()
{
  size(1000, 1000);
  background(0);
}

void draw()
{
  if (GG==true)
  {
    fill(255, 0, 0);
    textSize(200);
    text("HAHA!!", 150, 400);
  }
  else
  {
    human();
    comp();
  }
}

void human()
{
  stroke(255);

  if (get(x, y)!=color(0, 0, 0))
  {
    GG=true;
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
    stroke(255);

  if (get(compx, compy)!=color(0, 0, 0))
  {
    GG=true;
  }

  else
  {
    point(compx, compy);
    if (compdir==RIGHT)
    {
      compx++;
      if(get(compx+1,compy) != color(0))
      {
        compdir=UP;
      }

    }
    else if (compdir==LEFT)
    {
      compx--;
      if(get(compx-1,compy) != color(0))
      {
        compdir=DOWN;
      }
      
    }
    else if (compdir==UP)
    {
      compy--;
      if(get(compx,compy-1) != color(0))
      {
        compdir=LEFT;
      }
    }
    else if (compdir==DOWN)
    {
      compy++;
      if(get(compx,compy+1) != color(0))
      {
        compdir=RIGHT;
      }
    }
  }
}


void keyPressed()
{
  if (key == 'a')
  {
    direction=LEFT;
  }
  else if (key == 'd')
  {
    direction=RIGHT;
  }
  else if (key == 'w')
  {
    direction=UP;
  }
  else if (key == 's')
  {
    direction=DOWN;
  }
}
