
PImage foto;
  
void setup()
{
  size(800,400);
  foto = loadImage("Lenna.jpg");
  image(foto, 0, 0);
  loadPixels();
}
  
void draw()
{
  for(int i=0; i<400; i++)
    {
       for(int j=0; j<400; j++) 
        {
             
            pixels[i*800-j+799]=pixels[i*800+j];
        }
    }
updatePixels();
}



