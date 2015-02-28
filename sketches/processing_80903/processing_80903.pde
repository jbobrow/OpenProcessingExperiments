
PImage imagen;
int loc;
float r,g,b;
void setup()
{
  size(400,400);
  imagen=loadImage("lenna.jpg");
  smooth();
  frameRate(30);
}
void draw()
{
  for(int i=0;i<imagen.width;i++)
  {
    for(int j=0;j<imagen.height;j++)
    {
      loc=i+j*imagen.width;
      r=red(imagen.pixels[loc]);
      g=green(imagen.pixels[loc]);
      b=blue(imagen.pixels[loc]);
      stroke((r+g+b)/3);
      line(i,j,i,j);
    }
  }
}

