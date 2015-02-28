
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76697*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage mi_imagen;
int x=0;
int y=0;

void setup()
{
  size(500,500);
  mi_imagen=loadImage("lenna.jpg");
  smooth();
  frameRate(15);
}

void draw()
{
  if(x<=250)
  {
    x+=1;
    y+=1;
  }
  image(mi_imagen,(500-2*x)/2,(500-2*y)/2,2*x,2*y);
}

