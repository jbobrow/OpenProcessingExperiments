
PImage imagen;
 
void setup()
{
  size(800,400);
  imagen = loadImage("simpsonizado.jpg");
  image(imagen, 0, 0);
  loadPixels();
}
 
void draw()
{
  for(int i=0; i<400; i++)
    {
       for(int j=0; j<400; j++)
        {
            pixels[(i*800-j+799)/2]=pixels[i*800+j];
        }
    }
updatePixels();
}

