
/* @pjs globalKeyEvents="true";*/
//Sydney C. CP 1, 4/5 Tron
int x = 10;
int y = 300;
int direction = RIGHT;
int cx = 250;
int cy = 10;
int cdirection = DOWN;
boolean gameover = false;
boolean youwin = false;
int dotSize = 3;
int c2x = 490;
int c2y = 310;
int c2direction = LEFT;

void setup()
{
  size(500, 500);
  stroke(0,255,0);
  fill(0);
  rect(0,0,500,500);
  frameRate(25);
}

void draw()
{
  fill(255);
  if (gameover == true)
  {
    textSize(45);
    textAlign(CENTER);
    text("GAME OVER\nBetter luck next time!", 250, 200);
  }
  else
  {
    if (youwin == true)
    {
      textSize(50);
      text("YOU WIN!", 150,250);
    }
    else
    {
     if(gameover == false)
     {
       computer();
       comp2();
     }
     if (youwin == false)
     {
        human();
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
  else if (key == 's')
  {
    direction = DOWN;
  }
  else if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
}

void human()
{
   if (get(x, y) != color(0))
    {
      gameover = true;
    }
    stroke(0,0,255);
    rect(x, y, dotSize-1, dotSize-1);
    if (direction == UP)
    {
      y-=dotSize;
    }
    else if (direction == DOWN)
    {
      y+=dotSize;
    }
    else if (direction == LEFT)
    {
      x-=dotSize;
    }
    else if (direction == RIGHT)
    {
      x+=dotSize;
    }
}

void computer()
{
   if (get(cx, cy) != color(0))
    {
      youwin = true;
    }
    stroke(255,0,0);
    rect(cx, cy, dotSize-1,dotSize-1);
    if (cdirection == UP)
    {
      cy-=dotSize;
      if(get(cx,cy-dotSize) != color(0))
      {
        if(get(cx-dotSize,cy) != color(0))
        {
          cdirection = RIGHT;
        }
        else if (get(cx+dotSize, cy) != color(0))
        {
          cdirection = LEFT;
        }
        else
        {
          if(random(1) < .5)
          {
            cdirection = LEFT;
          }
          else
          {
            cdirection = RIGHT;
          }
        }
      }
    }
    else if (cdirection == DOWN)
    {
      cy+=dotSize;
      if(get(cx,cy+dotSize) != color(0))
      {
        if(get(cx-dotSize,cy) != color(0))
        {
          cdirection = RIGHT;
        }
        else if (get(cx+dotSize, cy) != color(0))
        {
          cdirection = LEFT;
        }
        else
        {
          if(random(1) < .5)
          {
            cdirection = LEFT;
          }
          else
          {
            cdirection = RIGHT;
          }
        }
      }
    }
    else if (cdirection == LEFT)
    {
      cx-=dotSize;
      if(get(cx-dotSize,cy) != color(0))
      {
        if(get(cx,cy+dotSize) != color(0))
        {
          cdirection = UP;
        }
        else if (get(cx,cy-dotSize) != color(0))
        {
          cdirection = DOWN;
        }
        else
        {
          if(random(1)< .5)
          {
            cdirection = UP;
          }
          else
          {
            cdirection = DOWN;
          }
        }
      }
    }
    else if (cdirection == RIGHT)
    {
      cx+=dotSize;
      if(get(cx+dotSize,cy) != color(0))
      {
        if(get(cx,cy+dotSize) != color(0))
        {
          cdirection = UP;
        }
        else if (get(cx,cy-dotSize) != color(0))
        {
          cdirection = DOWN;
        }
        else
        {
          if(random(1)< .5)
          {
            cdirection = UP;
          }
          else
          {
            cdirection = DOWN;
          }
        }
      }
    }
}

void comp2()
{
  if (get(c2x, c2y) != color(0))
    {
      youwin = true;
    }
    stroke(25,54,52);
    rect(c2x, c2y, dotSize-1,dotSize-1);
    if (c2direction == UP)
    {
      c2y-=dotSize;
      if(get(c2x,c2y-dotSize) != color(0))
      {
        if(get(c2x-dotSize,c2y) != color(0))
        {
          c2direction = RIGHT;
        }
        else if (get(c2x+dotSize, c2y) != color(0))
        {
          c2direction = LEFT;
        }
        else
        {
          if(random(1) < .5)
          {
            c2direction = LEFT;
          }
          else
          {
            c2direction = RIGHT;
          }
        }
      }
    }
    else if (c2direction == DOWN)
    {
      c2y+=dotSize;
      if(get(c2x,c2y+dotSize) != color(0))
      {
        if(get(c2x-dotSize,c2y) != color(0))
        {
          c2direction = RIGHT;
        }
        else if (get(c2x+dotSize, c2y) != color(0))
        {
          c2direction = LEFT;
        }
        else
        {
          if(random(1) < .5)
          {
            c2direction = LEFT;
          }
          else
          {
            c2direction = RIGHT;
          }
        }
      }
    }
    else if (c2direction == LEFT)
    {
      c2x-=dotSize;
      if(get(c2x-dotSize,c2y) != color(0))
      {
        if(get(c2x,c2y+dotSize) != color(0))
        {
          c2direction = UP;
        }
        else if (get(c2x,c2y-dotSize) != color(0))
        {
          c2direction = DOWN;
        }
        else
        {
          if(random(1)< .5)
          {
            c2direction = UP;
          }
          else
          {
            c2direction = DOWN;
          }
        }
      }
    }
    else if (c2direction == RIGHT)
    {
      c2x+=dotSize;
      if(get(c2x+dotSize,c2y) != color(0))
      {
        if(get(c2x,c2y+dotSize) != color(0))
        {
          c2direction = UP;
        }
        else if (get(c2x,c2y-dotSize) != color(0))
        {
          c2direction = DOWN;
        }
        else
        {
          if(random(1)< .5)
          {
            c2direction = UP;
          }
          else
          {
            c2direction = DOWN;
          }
        }
      }
    }
}
