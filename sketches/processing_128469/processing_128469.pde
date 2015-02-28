
void setup()
{
  size(800, 800);
  loadPixels();
  color c; 
  for (int i = 0; i < pixels.length; i++)
  {
    if ((i+1) % 20 == 0)  c = color(255,0,0,255);
    if ((i+1) % 70 == 0)  c = color(0,0,255,255);
    else c = color(0);
    pixels[i] = c;
  }
  updatePixels();
}
 


void draw()
{
}
