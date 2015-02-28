
//Amy Chen, Tron, Computer Programming 4/5
//
int x=1;
int y=300;
int direction=RIGHT;
int compx=600;
int compy=300;
int compdir=LEFT;
boolean gameOver = false;
void setup()
{
  size(600, 600);
  background(0);
}
void draw()
  if(get(x, y)!= color(0, 0, 0))
  {
    gameOver = true;
    text("Game Over COMPUTER WON", 300, 500);
  }
 if(get(compx,compy)!=color(0,0,0))
{
gameOver =true;
text("Game Over PLAYER WON", 300,500);
}
  else
  {
    human();
   if(gameOver==false)
   {
    computer();
  }
}
}
void human()
{
  stroke(255, 255, 255);
  point(x, y);
  if (direction ==RIGHT)
  {
    x++;
  }
  if (direction ==LEFT)
  {
    x--;
  }
  if (direction ==UP)
  {
    y--;
  }
  if (direction ==DOWN)
  {
    y++;
  }
}
void keyPressed()
{
  if (key=='a')
  {
    direction = LEFT;
  }
  else if (key=='d')
  {
    direction = RIGHT;
  }
  else if (key=='s')
  {
    direction = DOWN;
  }
  else if (key=='w')
  {
    direction = UP;
  }
}
void computer()
{
    stroke(255, 0, 255);
    point(compx, compy);
    if (compdir ==LEFT)
    {
      compx--;
      if (get(compx-2, compy) !=color(0, 0, 0))
      {
        compdir=DOWN;
      }
     if (compdir ==RIGHT)
    {
      compx++;
      if (get(compx+2, compy) !=color(0, 0, 0))
      {
        compdir=UP;
      }
    }
   else if(compdir ==UP)
   {
     compy--;
     if(get(compx,compy-2) !=color(0,0,0))
     { 
       compdir=LEFT;
     }
    }
   else if(compdir==DOWN)
   {
     compy++;
     if(get(compx,compy+2) !=color(0,0,0))
     {
       compdir=RIGHT;
     }
      }
   }
}
