
rint z=0;
int randx=0;
int y=150;
int dir=RIGHT;
int comY=150;
int comX=400;
int compDir=LEFT;
int x=100;
int f=75;
int n=0;
int shapeX=10;
int shapeY=10;
int sizeX=10;
int sizeY=10;
boolean shapes=false;
boolean turn=true;
boolean gameover=true;
boolean pwin=false;
void setup ()
{
  size(400, 400);
  background(0);
  frameRate(f);
}
void draw()
{
  if (gameover==false)
  {
    human();
    cpu();
    if (shapes==true)
    {
      if (n<50)
      {
        shapeX=int(random(100, 400));
        shapeY=int(random(10, 500));
        sizeX=int(random(10, 25));
        sizeY=int(random(10, 25));
        fill(shapeY, shapeX, 0, 150);
        rect(shapeX, shapeY, sizeX, sizeY);
      }
      n=n+1;
    }
    z=1;
  }
  else if (z==1)
  {
    fill(255, 0, 0);
    ellipse(200, 150, 100, 100);
    fill(255);
    text("Game Over",170,150);
    if(pwin==true)
    {
    text("player wins",170,180);    
    }
    else
    {
    text("computer wins",170,180);
    }
  }
  else if (z==0)
  {
    background(0);
    text("Press R to start", 150, 150);
    text("press O for obstacles", 150, 200);
    text("F and G to change speed", 150, 250);
    text("speed is " + f +"fps", 250, 350);
  }
}
void human()
{
  stroke(200, x, y);
  point(x, y);
  if (dir == RIGHT)
  {
    x=x+1;
  }
  else if (dir == LEFT)
  {
    x=x-1;
  }
  else if (dir == UP)
  {
    y=y-1;
  }
  else if (dir == DOWN)
  {
    y=y+1;
  }
  if (get(x, y) !=color(0, 0, 0))
  {
    gameover=true;
    pwin=false;
  }
} 
void cpu ()
{
  stroke(75, 250, 150);
  point(comX, comY);
  if (compDir==LEFT)
  {
    comX=comX-1;
    if (get(comX-2, comY) !=color(0, 0, 0))
    {
      if (get(comX, comY-2) !=color(0))
      {
        compDir=DOWN;
      }
      else if (get(comX,comY+2) !=color(0))
      {
        compDir=UP;
      }
      else
      {
        if (random(1) < .5)
        {
          compDir =UP;
        }
        else
        {
          compDir =DOWN;
        }
      }
    }
  }
  else if (compDir==UP)
  { 
    comY=comY-1;
    if (get(comX, comY-2) !=color(0))
    {
      if (get(comX-2, comY) !=color(0))
      {
        compDir=RIGHT;
      }
      else if(get(comX+2, comY) !=color(0))
      {
        compDir=LEFT;
      }
      else
      {
        if (random(1) < .5)
        {
          compDir =RIGHT;
        }
        else
        {
          compDir =LEFT;
        }
      }
    }
  }
  else if (compDir==RIGHT)
  {
    comX=comX+1;
    if (get(comX+2, comY) !=color(0))
    { 
      if (get(comX, comY+2) !=color(0))
      {
        compDir=UP;
      }
      else if(get(comX,comY-2) !=color(0))
      {
        compDir=DOWN;
      }
      else
      {
        if (random(1) < .5)
        {
          compDir = DOWN;
        }
        else
        {
          compDir = UP;
        }
      }
    }
  }
  else if (compDir==DOWN)
  {
    comY=comY+1;
    if (get(comX, comY+2) !=color(0))
    { 
      if (get(comX+2, comY) !=color(0))
      {
        compDir=LEFT;
      }
      else if(get(comX-2,comY) !=color(0))
      {
        compDir=RIGHT;
      }
      else
      {
        if (random(1) < .5)
        {
          compDir =LEFT;
        }
        else
        {
          compDir =RIGHT;
        }
      }
    }
  }
  if (get(comX, comY) !=color(0, 0, 0))
  {
    gameover=true;
    pwin=true;
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
  if (key=='r' && gameover==true)
  {
    restart();
    n=0;
  }
  if (key=='o' && gameover==true)
  {
    shapes=true;
  }
  if (key=='f' && f<1500)
  {
    f=f+5;
  }
  if (key=='g' && f>10)
  {
  f=f-5
  }
}
void restart ()
{
  gameover=false;
  background(0);
  x=25;
  y=150;
  dir=RIGHT;
  comY=150;
  comX=225;
  compDir=LEFT;
}
