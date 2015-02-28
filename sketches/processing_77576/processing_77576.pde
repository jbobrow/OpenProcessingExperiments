
int x = 10;
int y = 150;
int direction = RIGHT;
int compx = 150;
int compy = 290;
int compdirection = LEFT;
int twocx = 290;
int twocy = 155;
int twoc = RIGHT;
boolean GameOver = false;

void setup()
{
  size(300, 300);
  background(0);
}

void draw()
{
  if (GameOver == true)
  {
    textSize(30); 
    text("Game Over", 70, 140);
  }
  else 
  {
    human();
    if (GameOver== false)
    {
      computer();
      computerTwo();   
    }
  }
}

void human()
{
  if (get(x, y) != color(0))
  {
    fill(255,0,0);
    textSize(25);
    text("You Lose!", 100,160);
    GameOver = true;
  }
  else
  {
    stroke(255);
    point(x, y);
    if (direction == RIGHT)
    {
      x++;
    }
    else if (direction == LEFT)
    {
      x--;
    }
    else if (direction == UP)
    {
      y--;
    }
    else if (direction == DOWN)
    {
      y++;
    }
  }
}
void computer()
{
  if (get(compx, compy) != color(0))
  {
    textSize(25);
    fill(255,0,0);
    text("Computer One Loses",30,160);
    GameOver = true;
  }
  else
  {
    stroke(0, 255, 255);
    point(compx, compy);
    if (compdirection == RIGHT)
    {
      compx++;
      if (get(compx +1, compy) != color(0, 0, 0))
      {
        compdirection = UP;
      }
    }
    else if (compdirection == LEFT)
    {
      compx--;
      if (get(compx -1, compy) != color(0, 0, 0))
      {
        compdirection = DOWN;
      }
    }
    else if (compdirection == UP)
    {
      compy--;
      if (get(compx, compy-1) != color(0, 0, 0))
      {
        compdirection = LEFT;
      }
    }
    else if (compdirection == DOWN)
    {
      compy++;
      if (get(compx, compy+1) != color(0, 0, 0))
      {
        compdirection = RIGHT;
      }
    }
  }
}
void computerTwo()
{
  if (get(twocx, twocy) != color(0))
  {
    textSize(25);
    fill(255,0,0);
    text("Computer Two Loses", 30,160);
    GameOver = true;
  }
  else
  {
    stroke(0, 255, 0);
    point(twocx, twocy);
    if (twoc == RIGHT)
    {
      twocx++;
      if (get(twocx +1, twocy) != color(0, 0, 0))
      {
        twoc = UP;
      }
    }
    else if (twoc == LEFT)
    {
      twocx--;
      if (get(twocx -1, twocy) != color(0, 0, 0))
      {
        twoc = DOWN;
      }
    }
    else if (twoc == UP)
    {
      twocy--;
      if (get(twocx, twocy-1) != color(0, 0, 0))
      {
        twoc = LEFT;
      }
    }
    else if (twoc == DOWN)
    {
      twocy++;
      if (get(twocx, twocy+1) != color(0, 0, 0))
      {
        twoc = RIGHT;
      }
    }
  }
}
void keyPressed()
{
  if (key == 't')
  {
    direction = UP;
  }
  else if (key == 'g')
  {
    direction = DOWN;
  }
  else if (key == 'f')
  {
    direction = LEFT;
  }
  else if (key == 'h')
  {
    direction = RIGHT;
  }
}



