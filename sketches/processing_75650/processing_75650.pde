
PImage foto;
void setup()
{
   
   size(400,400);
   foto=loadImage("Lenna.jpg");
}
int posY=-400;
int posX=-400;
void draw()
{
  background(0);
  image(foto,posX,posY);
  if(posX==0&posY==0)
  {
    posX=0;
    posY=0;
  }
  else
  {
    posY++;
    posX++;
  }
}

