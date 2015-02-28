

PImage miimagen;
int x=0;
int y=0;
 
void setup()
{
  size(500,500);
  background(0);
  miimagen=loadImage("eso.jpg");
  smooth();
  frameRate(75);
}
 
void draw()
{
  if(x<=250)
  {
    x+=1;
    y+=1;
  }
  image(miimagen,(500-2*x)/2,(500-2*y)/2,2*x,2*y);
}


