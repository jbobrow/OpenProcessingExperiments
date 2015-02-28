
PImage Imagen;
void setup()
{
size(1000,400);
Imagen=loadImage("lena.jpg");
image(Imagen,0,0,512,512);
loadPixels();
}
void draw()
{
  int j;
  int i;
for(i=0;i<400;i++)
{
  for(j=0;j<400;j++)
  {  
    pixels[(i+1)*1000-(j+1)]=pixels[i*1000+j];
  }
}
  
 updatePixels();
  
}


