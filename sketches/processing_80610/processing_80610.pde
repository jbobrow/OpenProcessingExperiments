
PImage Imagen;
void setup()
{
size(800,400);
Imagen=loadImage("lena.jpg");
image(Imagen,0,0,512,512);
loadPixels();
}
void draw()
{
  int j,i;
for(i=0;i<400;i++)
{
  for(j=0;j<400;j++)
  {
    //pixels[(i*800+j+400)]=pixels[i*800+j];  
    pixels[(i+1)*800-(j+1)]=pixels[i*800+j];
  }
}
  
 updatePixels();
  
}


