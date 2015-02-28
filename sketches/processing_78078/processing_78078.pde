
void setup()
{
  size(800,400);
  PImage imagen;
  imagen=loadImage("ska.jpg");
  image(imagen,0,0);
  loadPixels();
}
void draw()
{
  for(int i=0;i<400;i++)
  {
    for(int j=0;j<400;j++)
    {
      pixels[i*800-j+799]=pixels[i*800+j];
    }
  }
  updatePixels();
}

