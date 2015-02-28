
int linieX=10;
int linieY=10;
int abstand=10;

void setup()
{
  size(500,500);
  background(255);
  smooth();
}
void draw()
{
  randomSeed(mouseX);
  stroke(random(0,255),random (0,255),random(0,255));
  line(linieX,linieY,linieX,height-10);
  stroke(random(0,255),random (0,255),random(0,255));
  line(linieX+abstand/2,10,linieX+abstand/2,height-linieY);
  if(linieX<=width/2-10)
  {
    linieY=linieY+abstand;
  }
  else // wenn mitte erreicht, dann soll es wieder kleiner werden
  {
    linieY=linieY-abstand;
  }
  if(linieX<=width-20) // so lange x kleiner ist als die breite -20
  {
    linieX=linieX+abstand;
  }
  else
  {
    linieX=10;
    linieY=10;
  }
  
}


