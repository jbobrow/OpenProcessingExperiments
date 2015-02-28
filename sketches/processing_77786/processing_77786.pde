
int x=0;
int y=150;
int direction=RIGHT;
int compX=300;
int compY=150;
int compDir= LEFT;
void setup()
{
  background(0);
  size(300,300);
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
  else if(key == 's')
  {
    direction=DOWN;
  }
} 

void draw()
{
stroke(0,255,0);
if(get(x,y) != color (0,0,0))
{
  noStroke();
  fill(random(255),random(255), random(255));
  triangle(150,212.5,200,100,100,100);
  triangle(150,62.5,200,175,100,175);
  text("GAME OVER",150,20);
}
else
{
  human();
  computer();

}
}


void human()
{
  point(x,y);
  if(direction==RIGHT)
  {
    x++;
  }
else if(direction == LEFT)
{
  x--;
}
else if(direction == DOWN)
{
  y++;
}
else if (direction == UP)
{
  y--;
}
}


  void computer()
{
  stroke(255,0,0);
  point(compX,compY);
  if(compDir == LEFT)
{
  compX--;
  if(get(compX-1, compY) != color(0,0,0))
  {
    compDir=DOWN;
  }
}
   else if(compDir==RIGHT)
  {
    compX++;
    if(get(compX+1,compY) != color(0,0,0))
    {
      compDir=UP;
    }
  }
else if(compDir == DOWN)
{
  compY++;
  if(get(compX,compY+1) != color(0,0,0))
  {
    compDir=RIGHT;
  }
}
else if (compDir == UP)
{
  compY--;
  if(get(compX,compY-1) != color(0,0,0))
  {compDir=LEFT;
  }
}
}
