
PImage Picture;
    
void setup()
{
  size(600,400);
  Picture = loadImage("bones.jpg");
  image(Picture, 0, 0);
  loadPixels();
}
    
void draw()
{
  for(int i=0; i<400; i++)
    {
       for(int j=0; j<400; j++) 
        {
               
            pixels[i*600-j+599]=pixels[i*600+j];
        }
    }
updatePixels();
}
