
int xPos=0;

void setup()
{
   size(600, 400);
   smooth();
}

void draw()
{
  background(124);
  ellipse(xPos,height/2, 20, 20);
  xPos+=1;
  if(xPos>width+10)
  {
    xPos=0;
  }
}
