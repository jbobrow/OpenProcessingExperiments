
PImage Picture;
    
void setup()
{
  size(400,400);
  Picture = loadImage("lena.jpg");
  image(Picture, 0, 0);
  loadPixels();
}
    
void draw()
{
  for(int i=0; i<400; i++)
    {
       for(int j=0; j<400; j++)
        {
               
            pixels[i*400-j+399]=pixels[i*400+j];
        }
    }
updatePixels();
}


