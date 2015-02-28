
PImage Picture;
     
PImage foto;
size(582,400);
foto=loadImage("Lenna.JPG");
image(foto,0,0);
loadPixels();
for(int i=0;i<400;i++)
{
  for(int j=0;j<400;j++)
  {
  pixels[i*582+-j+581]=pixels[i*582+j];
  }
}
updatePixels();

