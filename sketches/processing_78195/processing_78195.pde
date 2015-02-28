

PImage miImagen;
void setup()
{
  size(800,500);
  background(0); 
  miImagen=loadImage("espejo.jpg");
  image(miImagen,0,0);
  loadPixels();
  frameRate(10);
}

void draw()
{
  for(int i=0;i<400;i++)
  {
    for(int j=0;j<400;j++)
    {
      pixels[i*800+799-j]=pixels[i*800+j];
    }
  }  updatePixels();
}


