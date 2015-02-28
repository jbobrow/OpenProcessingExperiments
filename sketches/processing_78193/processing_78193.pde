
//Tron Game Project, computer programming 1
//Iam B.

int x=50;
int y=250;
int compx=450;
int compy=250;
int compdir=LEFT;
int dir=RIGHT;
boolean gameOver=false;
int b=0;
int r=0;

void setup()
{
  size(500, 500);
  background(0);
  frameRate(40);
}

void draw()
{
  noFill();
  stroke(0, 0, 1);
  rect(0, 0, 500, 500);
  if (gameOver==true)
  {
  }
else
{
  comp();
  human();
}
}
void keyPressed()
{
  if (key=='a')
  {
    dir=LEFT;
  }
  else if (key=='d')
  {
    dir=RIGHT;
  }
  else if (key=='w')
  {
    dir=UP;
  }
  else if (key=='s')
  {
    dir=DOWN;
  }
}
void human()
{
  if (get(x, y) !=color(0, 0, 0))
  {
    gameOver=true;
    fill(255, 0, 0);
    text("GAME OVER YOU LOSE",50,50);
  }
  else
  {
    fill(200, 230, b);
    stroke(160, 200, b);
    rect(x, y, 3, 3);
    if (dir==RIGHT)
    {
      x=x+4;
    }
    else if (dir==LEFT)
    {
      x=x-4;
    }
    else if (dir==UP)
    {
      y=y-4;
    }
    else if (dir==DOWN)
    {
      y=y+4;
      ;
    }
    b=b+2;
    if (b>255)
    {
      b=0;
    }
  }
}
void comp()
{
  if (get(compx, compy) !=color(0, 0, 0))
  {
    gameOver=true;
    fill(255, 0, 0);
    text("YOU WIN",50,50);
  }
  else
  {
    fill(r, 150, 200);
    stroke(r, 220, 160);
    rect(compx, compy, 3, 3);
    if (compdir==RIGHT)
    {
      compx=compx+4;
      if (get(compx+4, compy)!=color(0, 0, 0))
      {
        compdir=DOWN;
      }
    }
    else if (compdir==LEFT)
    {
      compx=compx-4;
      if (get(compx-4, compy)!=color(0, 0, 0))
      {
        compdir=UP;
      }
    }
    else if (compdir==UP)
    {
      compy=compy-4;
      if (get(compx, compy-4)!=color(0, 0, 0))
      {
        compdir=RIGHT;
      }
    }
    else if (compdir==DOWN)
    {
      compy=compy+4;
      if (get(compx, compy+4)!=color(0, 0, 0))
      {
        compdir=LEFT;
      }
    }
    r=r+2;
    if (r>255)
    {
      r=0;
    }
  }
}



