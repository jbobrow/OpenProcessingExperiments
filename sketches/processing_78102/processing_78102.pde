
//Verna Chan, Tron, CP1, mods 16/17
/*@pjs globalKeyEvents="true"; */
int x=10;
int y=250;
int direction=RIGHT;
int compX=290;
int compY=150;
int compDir=LEFT;
void setup()
{
  size(300,300);
  rect(0,0,300,300);
  noFill();
  stroke(255);
  background(0);
}
void draw()
{
   if(get(x,y) !=color(0,0,0)||get(compX,compY) !=color(0,0,0))
  {
    text("GAME OVER",200,200);
  }
  else
  {
   human();
   computer();
  }
}
void human()
{
 if(get(x,y) !=color(0,0,0))
  {
    text("GAME OVER",200,200);
  }
  else
  {
    stroke(0,255,255);
    point(x,y);
    if(direction==RIGHT)
    {
      x++;
    }
    else if(direction==LEFT)
    {
      x--;
    }  
    else if(direction==UP)
    {
      y--;
    }
    else if(direction==DOWN)
    {
      y++;
    }
  }
}
void keyPressed()
  {
    if(key=='a')
    {
      direction=LEFT;
    }
    else if(key=='d')
    {
      direction=RIGHT;
    }
    else if(key=='w')
    {
      direction=UP;
    }
    else if(key=='s')
    {
      direction=DOWN;
    }
}
void computer()
{
  if(get(compX,compY) !=color(0,0,0))
  {
    text("GAME OVER",200,200);
  }
  else
  {
    stroke(124,252,0);
    point(compX,compY);
    if(compDir==RIGHT)
    {
      compX++;
      if(get(compX+1,compY)!=color(0,0,0))
      {
        compDir=DOWN;
      }
    }
    else if(compDir==LEFT)
    {
      compX--;
      if(get(compX-1,compY) !=color(0))
      {
        compDir=UP;
      }
    }  
    else if(compDir==UP)
    {
      compY--;
      if(get(compX,compY-1) !=color(0))
      {
       compDir=RIGHT; 
      }
    }
    else if(compDir==DOWN)
    {
      compY++;
      if(get(compX,compY+1) !=color(0))
      {
       compDir=LEFT; 
      }
    }
  }
}
