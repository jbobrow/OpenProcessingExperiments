
//Eric T. Computer Programming 1 Mods 4-5
int x=10;
int y=150;
int direction=RIGHT;
int compx=490;
int compy=350;
int compdir=LEFT;
boolean gameOver=false;
void setup()
{
  size(500,500);
  background(0);
  strokeWeight(5);
  stroke(142,141,127);
  line(0,0,500,0);
  line(0,0,0,500);
  line(499,0,499,500);
  line(0,499,500,499);
}
void draw()
{
  if(gameOver == true)
  {
  }
  else
  {
    human();
    if(gameOver == false)
    {
      computer();
    }
  }
}
void human()
{
  if(get(x,y) !=color(0))
    {
      textAlign(CENTER);
      textSize(25);
      text("You Lose!",250,250);
      gameOver = true;
    }
    strokeWeight(1);
    stroke(219,84,86);
    point(x,y);
    if(direction == RIGHT)
    {
      x++;
    }
    else if(direction == LEFT)
    {
      x--;
    }
    else if(direction == UP)
    {
      y--;
    }
    else if(direction == DOWN)
    {
      y++;
    }
  }
void keyPressed()
{
  if(key=='d')
  {
    direction=RIGHT;
  }
  if(key=='a')
  {
    direction=LEFT;
  }
  if(key=='s')
  {
    direction=DOWN;
  }
  if(key=='w')
  {
    direction=UP;
  }
}
void computer()
{
  if(get(compx,compy) !=color(0))
    {
      textAlign(CENTER);
      textSize(25);
      text("You Win!",250,250);
      gameOver = true;
    }
    stroke(79,160,196);
    point(compx,compy);
    if(compdir == RIGHT)
    {
      compx++;
      if(get(compx+1,compy) !=color(0))
      {
        compdir=DOWN;
      }
    }
    else if(compdir == LEFT)
    {
      compx--;
      if(get(compx-1,compy) !=color(0))
      {
        compdir=UP;
      }
    }
    else if(compdir == UP)
    {
      compy--;
      if(get(compx,compy-1) !=color(0))
      {
        compdir=RIGHT;
      }
    }
    else if(compdir == DOWN)
    {
      compy++;
      if(get(compx,compy+1) !=color(0))
      {
        compdir=LEFT;
      }
    }
  }
