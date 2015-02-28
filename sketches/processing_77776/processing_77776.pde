
//Michelle Z, CP1 4-5, Tron
/* @pjs globalKeyEvents="true"; */

int x = 20;
int y = 20;
int x2 = 580;
int y2 = 20;
int x3 = 20;
int y3 = 560;
int dir = RIGHT;
int dir2 = LEFT;
int dir3 = UP;

void setup()
{
  size(600, 600);
  background(0);
  noFill();
  frameRate(180);
}

void draw()
{   
  human();
  computer();
  computer2();
  if (get(x, y) != color(0, 0, 0) && get(x2,y2) == color(0,0,0) && get(x3,y3) == color(0,0,0))
  {
    noStroke();
    fill(0,150);
    rect(0, 0, 600, 600);
    fill(255);
    textSize(70);
    textAlign(CENTER);
    text("Game Over.", 300, 300);
    dir = -1;
    dir2 = -1;
    dir3 = -1;
  }
  if (get(x2, y2) != color(0, 0, 0) && get(x3, y3) != color(0, 0, 0) && get(x,y) == color(0,0,0))
  {
    noStroke();
    fill(0,150);
    rect(0, 0, 600, 600);
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("WINNER!", 300, 300);
    dir = -1;
    dir2 = -1;
    dir3 = -1;
  }
}

void human()
{
  stroke(255, 255, 255);
  point(x, y);
  if (dir == LEFT)
  {
    x--;
  }
  else if (dir == RIGHT)
  {
    x++;
  }
  else if (dir == UP)
  {
    y--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      dir = LEFT;
    }
    else if (keyCode == RIGHT)
    {
      dir = RIGHT;
    }
    else if (keyCode == UP)
    {
      dir = UP;
    }
    else if (keyCode == DOWN)
    {
      dir = DOWN;
    }
  }
}

void computer()
{
  stroke(0, 255, 255);
  point(x2, y2);
  if (dir2 == LEFT)
  {
    x2--;
    if (get(x2-1, y2) != color(0, 0, 0))
    {
      dir2 = DOWN;
    }
  }
  else if (dir2 == RIGHT)
  {
    x2++;
    if (get (x2+1, y2) != color(0, 0, 0))
    {
      dir2 = UP;
    }
  }
  else if (dir2 == UP)
  {
    y2--;
    if (get(x2, y2-1) != color(0, 0, 0))
    {
      dir2 = LEFT;
    }
  }
  else if (dir2 == DOWN)
  {
    y2++;
    if (get(x2, y2+1) != color(0, 0, 0))
    {
      dir2 = RIGHT;
    }
  }
}

void computer2()
{
  stroke(255, 255, 0);
  point(x3, y3);
  if (dir3 == LEFT)
  {
    x3--;
    if (get(x3-1, y3) != color(0, 0, 0))
    {
      dir3 = UP;
    }
  }
  else if (dir3 == RIGHT)
  {
    x3++;
    if (get(x3+1, y3) != color(0, 0, 0))
    {
      dir3 = DOWN;
    }
  }
  else if (dir3 == UP)
  {
    y3--;
    if (get(x3, y3-1) != color(0, 0, 0))
    {
      dir3 = RIGHT;
    }
  }
  else if (dir3 == DOWN)
  {
    y3++;
    if (get(x3, y3+1) != color(0, 0, 0))
    {
      dir3 = LEFT;
    }
  }
}


