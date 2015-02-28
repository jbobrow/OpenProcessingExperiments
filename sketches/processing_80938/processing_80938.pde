
void setup()
{
size(400,800);
PImage miImagen;
miImagen=loadImage("lenna.jpg");
image(miImagen,0,0);
loadPixels();
}
void draw()
{
int j=0;
for(int i=159999; i>=0; i--)
{ 
  pixels[160000+j]=pixels[i];
  j++;
}
for(int i=1; i<160000; i=i+2)
{
  pixels[i]=color(0);
}
updatePixels();
}

