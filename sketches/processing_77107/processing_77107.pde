
PImage imag;
int coorx,coory;
void setup()
{
  background(0);
  size(400,400);
  coorx=400;
  coory=400;
  imag=loadImage("lenna.jpg");
}
void draw()
{
  image(imag,coorx,coory);
  if(coorx>=0)
  {
    background(0);
    coorx--;
    coory--;
  }
}

