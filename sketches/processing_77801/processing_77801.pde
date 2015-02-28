
// Justin Lee CP1 mods 14/15
//URL: http://programsofjustin.webs.com/Tron/tron.html
/*@pjs globalKeyEvents="true";
*/
int x = 50;
int y = 250;
int compx = 450;
int compy = 250;
int dir=RIGHT;
int compdir=LEFT;
boolean gameover = false;
boolean gameoverhuman=false;
boolean gameovercomp = false;
int compRandomDir = 0;

void setup ()
{
  size (500, 500);
  background (0);
  stroke(255);
}

void draw()
{

  if (get(x, y) !=color(0))
  {
    gameoverhuman = true;
  }
  else 
  {
    human();
  }
  if (get(compx, compy) !=color(0))
  {
    gameovercomp = true;
  }
  else 
  {
    computer();
  }
  if (gameoverhuman==true)
  {
    background(0);
    stroke(255, 0, 0);
    textAlign(CENTER);
    text("YOU LOSE", 250, 250);
  }
  if (gameovercomp==true)
  {
    background(0);
    stroke(255, 0, 0);
    textAlign(CENTER);
    text("YOU WIN", 250, 250);
  }
}
//controls: AWSD
void keyPressed()
{
  if (key=='w')
  {
    dir=UP;
  }
  if (key=='s')
  {
    dir=DOWN;
  }
  if (key=='a')
  {
    dir=LEFT;
  }
  if (key=='d')
  {
    dir=RIGHT;
  }
  //reset with spacebar
  if (keyCode==32)
  {
    background(0);
    gameover=false;
    gameoverhuman=false;
    gameovercomp=false;
    dir=RIGHT;
    x=50;
    y=250;
    compdir=LEFT;
    compx=450;
    compy=250;
  }
}

void human()
{
  strokeWeight(1);
  stroke(0, 255, 0);
  point (x, y);
  if (dir==UP)
  {
    y--;
  }
  if (dir==DOWN)
  {
    y++;
  }
  if (dir==LEFT)
  {
    x--;
  }
  if (dir==RIGHT)
  {
    x++;
  }
}

void computer()
{
  stroke (255, 0, 0);
  point (compx, compy);


  if (compdir==UP)
  {
    compy--;

    if (get (compx, compy-1) != color(0))
    {
      if (get(compx+1, compy) != color (0))
      {
        compdir = LEFT;
      }

      else if (get(compx-1, compy) != color(0))
      {
        compdir = RIGHT;
      }
      else
      {
        compRandomDir = int(random(2));
        if (compRandomDir == 0)
        {
          compdir=LEFT;
        }
        if (compRandomDir == 1)
        {
          compdir=RIGHT;
        }
      }
    }
  }
  if (compdir==DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(0))
    {
      if (get(compx+1, compy) != color (0))
      {
        compdir = LEFT;
      }
      else if (get(compx-1, compy) != color(0))
      {
        compdir = RIGHT;
      }
      else
      {
        compRandomDir = int(random(2));
        if (compRandomDir == 0)
        {
          compdir=LEFT;
        }
        if (compRandomDir == 1)
        {
          compdir=RIGHT;
        }
      }
    }
  }

  if (compdir==LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color(0))
    {
      if (get(compx, compy+1) != color (0))
      {
        compdir = UP;
      }
      else if (get(compx, compy-1) != color(0))
      {
        compdir = DOWN;
      }
      else
      {
        compRandomDir = int(random(2));
        if (compRandomDir == 0)
        {
          compdir=UP;
        }
        if (compRandomDir == 1)
        {
          compdir=DOWN;
        }
      }
    }
  }
  if (compdir==RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color (0))
    {
      if (get(compx, compy+1) !=color(0))
      {
        compdir = UP;
      }
      else if (get(compx, compy-1) != color(0))
      {
        compdir = DOWN;
      }
      else
      {
        compRandomDir = int(random(2));
        if (compRandomDir == 0)
        {
          compdir=UP;
        }
        if (compRandomDir == 1)
        {
          compdir=DOWN;
        }
      }
    }
  }
}



