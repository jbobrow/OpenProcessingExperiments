
//Justin J. Tron, CP1, Mods 16/17
int x=175;
int y=150;
int compx=125;
int compy=150;
int dir = UP;
int compDir = UP;
boolean GAMEOVER=false;
int PlayerScore=0;
int ComputerScore=0;
void setup()
{
  size(300, 300);
  background(0);
  fill(0);
  stroke(207, 42, 245);
  rect(0, 0, 299, 299);
}
void draw()
{
  if (GAMEOVER==true && mousePressed==true)
  {
    background(0);
    fill(0);
    stroke(207, 42, 245);
    rect(0, 0, 299, 299);
    GAMEOVER=false;
    x=175;
    y=150;
    compx=125;
    compy=150;
    dir = UP;
    compDir = UP;
  }
  Human();
  Computer();
}
void Human()
{
  if (get(x, y) != color(0))
  {
    background(0);
    fill(255, 0, 0);
    textSize(36);
    text("YOU LOSE!", 60, 150);
    if (GAMEOVER == false)
    {
      ComputerScore++;
    }
    GAMEOVER=true;
    textSize(12);
    text("Computer's Score: "+ComputerScore, 10, 275);
    text("Your Score: "+PlayerScore, 210, 275);
  }
  else if (GAMEOVER==false)
  {
    stroke(255, 0, 0);
    point (x, y);
    if (dir == RIGHT)
    {
      x++;
    }
    else if (dir == LEFT)
    {
      x--;
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
}
void keyPressed()
{
  if (key=='a')
  {
    dir = LEFT;
  }
  else if (key=='d')
  {
    dir = RIGHT;
  }
  else if (key== 'w')
  {
    dir = UP;
  }
  else if (key=='s')
  { 
    dir = DOWN;
  }
}
void Computer()
{
  if (get(compx, compy) != color(0))
  {
    background(0);
    fill(255, 0, 0);
    textSize(36);
    text("YOU WIN!", 60, 150);
    if (GAMEOVER==false)
    {
      PlayerScore++;
    }
    GAMEOVER=true;
    textSize(12);
    text("Computer's Score: "+ComputerScore, 10, 275);
    text("Your Score: "+PlayerScore, 210, 275);
  }
  if (GAMEOVER==false)
  {
    stroke(0, 255, 0);
    point(compx, compy);
    if (compDir==UP)
    {
      compy--;
      if (get(compx, compy-1) != color(0))
      {
        if (get(compx-1, compy) == color(0) && get(compx+1, compy)==color(0))
        {
          int dirChange=int(random(2));
          if (dirChange==0)
          {
            compDir=LEFT;
          }
          else  //dirChange==1
          {
            compDir=RIGHT;
          }
        }
        else
        {
          if (get(compx-1, compy) != color(0))
          {
            compDir=RIGHT;
          }
          else if (get(compx+1, compy) != color(0))
          {
            compDir=LEFT;
          }
        }
      }
    }
    else if (compDir==DOWN)
    {
      compy++;
      if (get(compx, compy+1) != color(0))
      {
        if (get(compx-1, compy) == color(0) && get(compx+1, compy)==color(0))
        {
          int dirChange=int(random(2));
          if (dirChange==0)
          {
            compDir=LEFT;
          }
          else  //dirChange==1
          {
            compDir=RIGHT;
          }
        }
        else
        {
          if (get(compx-1, compy) != color(0))
          {
            compDir=RIGHT;
          }
          else if (get(compx+1, compy) != color(0))
          {
            compDir=LEFT;
          }
        }
      }
    }
    else if (compDir==RIGHT)
    {
      compx++;
      if (get(compx+1, compy) != color(0))
      {
        if (get(compx, compy+1)== color(0) && get(compx, compy-1)==color(0))
        {
          int dirChange2=int(random(2));
          if (dirChange2==0)
          {
            compDir=UP;
          }
          else  //dirChange2==1
          {
            compDir=DOWN;
          }
        }
        else
        {
          if (get(compx, compy+1) != color(0))
          {
            compDir=UP;
          }
          else if (get(compx, compy-1) != color(0))
          {
            compDir=DOWN;
          }
        }
      }
    }
    else if (compDir==LEFT)
    {
      compx--;
      if (get(compx-1, compy) != color(0))
      {
        if (get(compx, compy+1)== color(0) && get(compx, compy-1)==color(0))
        {
          int dirChange2=int(random(2));
          if (dirChange2==0)
          {
            compDir=UP;
          }
          else  //dirChange2==1
          {
            compDir=DOWN;
          }
        }
        else
        {
          if (get(compx, compy+1) != color(0))
          {
            compDir=UP;
          }
          else if (get(compx, compy-1) != color(0))
          {
            compDir=DOWN;
          }
        }
      }
    }
  }
}
