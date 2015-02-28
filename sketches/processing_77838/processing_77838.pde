
//Lisa L, CP1 Mods 16/17, Tron

int x = 20;
int y = 250;
int cx = 480;
int cy = 250;
int dir = RIGHT;
int cdir = LEFT;
boolean gameOver = false;

void setup()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(0, 255, 163);
  rect(0, 0, 499, 499);
  frameRate(100);
}
void draw()
{
  if (get(x, y)!=color(0))
  {
    gameOver = true;
    //textSize(20);
    fill(255, 0, 251);
    textAlign(CENTER);
    text("Game Over\nYou Lose >:D", 250, 250);
  }
  else if (get(cx, cy)!=color(0))
  {
    gameOver = true;
    //textSize(20);
    fill(0, 219, 255);
    textAlign(CENTER);
    text("Game Over\nYou Win! :D", 250, 250);
  }
  else 
  {
    human();
    computer();
  }
}
void human()
{
  stroke(0, 219, 255);
  if (gameOver == false)
  {
    point(x, y);
  }
  if (dir == UP)
  {
    y--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
  else if (dir == LEFT)
  {
    x--;
  }
  else if (dir == RIGHT)
  {
    x++;
  }
}
void computer()
{
  stroke(255, 0, 251);
  {
    if (gameOver == false)
    {
      point(cx, cy);
    }
    if (cdir == UP)
    {
      cy--;
      if (get(cx, cy-1)!=color(0))
      {
        if (get(cx-1, cy)!=color(0))
        {
          cdir = RIGHT;
        }
        else if (get(cx+1, cy)!=color(0))
        {
          cdir = LEFT;
        }
        else
        {
          if (random(1) <.5)
          {
            cdir = RIGHT;
          }
          else
          {
            cdir = LEFT;
          }
        }
      }
    }
    else if (cdir == DOWN)
    {
      cy++;
      if (get(cx, cy+1)!=color(0))
      {
        if (get(cx+1, cy)!=color(0))
        {
          cdir = LEFT;
        }
        else if (get(cx-1, cy)!=color(0))
        {
          cdir = RIGHT;
        }
        else
        {
          if (random(1) <.5)
          {
            cdir = RIGHT;
          }
          else
          {
            cdir = LEFT;
          }
        }
      }
    }
    else if (cdir == LEFT)
    {
      cx--;
      if (get(cx-1, cy)!=color(0))
      {
        if (get(cx, cy+1)!=color(0))
        {
          cdir = UP;
        }
        else if (get(cx, cy-1)!=color(0))
        {
          cdir = DOWN;
        }
        else
        {
          if (random(1) <.5)
          {
            cdir = UP;
          }
          else
          {
            cdir = DOWN;
          }
        }
      }
    }
    else if (cdir == RIGHT)
    {
      cx++;
      if (get(cx+1, cy)!=color(0))
      {
        if (get(cx, cy+1)!=color(0))
        {
          cdir = UP;
        }
        else if (get(cx, cy-1)!=color(0))
        {
          cdir = DOWN;
        }
        else
        {
          if (random(1) <.5)
          {
            cdir = UP;
          }
          else
          {
            cdir = DOWN;
          }
        }
      }
    }
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    dir = UP;
  }
  if (key == 's')
  {
    dir = DOWN;
  }
  if (key == 'a')
  {
    dir = LEFT;
  }
  if (key == 'd')
  {
    dir = RIGHT;
  }
  if (key =='r') {
    gameOver=false;
    background(0);
    x=20;
    y=250;
    cx=480;
    cy=250;
    noFill();
    stroke(0, 255, 163);
    rect(0, 0, 499, 499);
    dir=RIGHT;
    cdir=LEFT;
  }
}
