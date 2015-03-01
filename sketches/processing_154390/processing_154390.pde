
int xPosition=200;
int xMotion=1;
int yMotion=1;
int yPosition;
int y2Position;
int x2Position=0;

void setup ()
{
  size(400, 400);
  x2Position=int(random(1,6));
  y2Position=int(random(1,6));
}
void draw ()
{
  background (0);
  ellipse (xPosition, yPosition, 40, 40);
  ellipse (x2Position, y2Position, 40, 40);
  xPosition=xPosition+xMotion*(10);
  yPosition=yPosition+yMotion*(10);
  x2Position=(x2Position+10);
  y2Position=(y2Position+10);
  
  
  if (xPosition>=400 || xPosition<=0)
  {
    xMotion=-xMotion;
  }
  if (yPosition>=400 || yPosition<=0)
  {
    yMotion=-yMotion;
  }
  if (x2Position>400)
  {
    x2Position=int(random(1,6));
  }
  if (y2Position>400)
  {
    y2Position=-20;
  }
   float d=dist(x2Position, y2Position, xPosition, yPosition);
   
    //if (x2Position+(.5)*width==xPosition+(.5)*width &&
   // y2Position+(.5)*height==yPosition+(.5)*height)
   if (d<40)
  {
    fill (255, 204, 0);
    rect (0,0, width, height);
    
  }
}







