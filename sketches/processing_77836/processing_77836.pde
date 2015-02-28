
//Cristen W, CP1 Mods 16/17, TRON

int x = 10;
int y = 250;
int compx = 490;
int compy = 250;
int direction = RIGHT;
int cdirection = LEFT;
boolean gameOver = false;

void setup()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(12,154,167);
  rect(0, 0, 500, 500);
}
void draw()
{
  if (get(x, y)!=color(0))
  {
    gameOver = true;
    textAlign(CENTER);
    text("Game Over\nYou Lose :(", 250, 250);
  }
  else if (get(compx, compy)!=color(0))
  {
    gameOver = true;
    textAlign(CENTER);
    text("Game Over\nYou Win! :)", 250, 250);
  }
  else
  {
    human();
    computer();
  }
}
void human()
{
  stroke(61,245,25);
  if (gameOver == false)
  {
    point(x, y);
  }
  if (direction == UP)
  {
    y--;
  }
  else if (direction == DOWN)
  {
    y++;
  }
  else if (direction == LEFT)
  {
    x--;
  }
  else if (direction == RIGHT)
  {
    x++;
  }
}
void computer()
{
  stroke(250,255,3);
  {
    if (gameOver == false)
    {
      point(compx, compy);
    }
    if (cdirection == UP)
    {
      compy--;
      if(get(compx,compy-1)!=color(0))
      {
        cdirection = RIGHT;
      }
    }
    else if (cdirection == DOWN)
    {
      compy++;
      if(get(compx,compy+1)!=color(0))
      {
        cdirection = LEFT;
      }
    }
    else if (cdirection == LEFT)
    {
      compx--;
      if(get(compx-1,compy)!=color(0))
      {
        cdirection = UP;
      }
    }
    else if (cdirection == RIGHT)
    {
      compx++;
      if(get(compx+1,compy)!=color(0))
      {
        cdirection = DOWN;
      }
    }
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    direction = UP;
  }
  if (key == 's')
  {
    direction = DOWN;
  }
  if (key == 'a')
  {
    direction = LEFT;
  }
  if (key == 'd')
  {
    direction = RIGHT;
  }
  if (key =='r') {
    gameOver=false;
    background(0);
    x=10;
    y=250;
    compx=490;
    compy=250;
    stroke(12,154,167);
    rect(0, 0, 500, 500);
    direction=RIGHT;
    cdirection=LEFT;
  }
}
