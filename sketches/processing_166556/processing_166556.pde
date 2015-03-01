
int frames = 11;
int panel = 0;
int x = 0;
PImage theImage = new PImage[11];
 
void setup()
{
  size(500,500);
  frameRate(5);
  for(int i=1;i<theImage.length;i++)
  {
    theImage[i]=loadImage("bardock"+i+".png");
  }
}
 
void draw()
{
  panel = (panel+1) % frames;
  image(theImage[panel%frames],0,0);
}



