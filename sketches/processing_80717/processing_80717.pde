

PImage Picture;
    
void setup()
{
  size(600,600);
  background(#2C1A1A);
  Picture = loadImage("rostro.jpg");
  image(Picture, 80,130);
  loadPixels();
}
    
void draw()
{
  
  for(int i=0; i<600; i++)
    {
       for(int j=0; j<600; j++)
        {
               
            pixels[i*600-j+599]=pixels[i*600+j];
        }
    }
updatePixels();
}


