
int xPosition=200;
int xMotion=1;
int yMotion=1;
int yPosition;
int y2Position;
int x2Position=0;
float x2;
float y2;
float easingCoeff=.2;

void setup ()
{
  size(400, 400);
  x2Position=int(random(1,6));
  y2Position=int(random(1,6));
}
void draw ()
{
  
  background (0);
  ellipse (200, 200, 25, 25);
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
 
  float x=mouseX;
  float diffX= x-x2;
  if(abs(diffX)>1) 
   {
    x2 += diffX*easingCoeff;
   }
  float y=mouseY;
  float diffY=y-y2;
  if(abs(diffY) > 1) 
   {
      y2 += diffY*easingCoeff;
   }
  
  ellipse(x2, y2, 55, 55);
  float d=dist(x2Position, y2Position, xPosition, yPosition);
  float d2=dist(x2Position, y2Position, x, y);
  float d3=dist(xPosition, yPosition, x, y);
   
    //if (x2Position+(.5)*width==xPosition+(.5)*width &&
   // y2Position+(.5)*height==yPosition+(.5)*height)
   if (d<40)
  {
    fill (255, 204, 0);
    rect (0,0, width, height);
  }
  if (d2<40)
  {
    fill (255, 204, 0);
    rect (0,0, width, height);
  }
  if(d3<40)
  {
    fill (255, 204, 0);
    rect (0,0, width, height);
  }

}






