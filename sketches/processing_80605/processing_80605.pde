
PImage img;
void setup() 
{
  size(200,200);
  img = loadImage("simpsonizado.jpg");
}

void draw() 
{
  loadPixels();
  img.loadPixels();
  for (int y = 0; y < height; y++ ) 
  {
      for (int x = 0; x < width; x++ ) 
      {
          int pos = x + y*width;
          float r = (red(img.pixels [pos])+green(img.pixels[pos])+blue(img.pixels[pos]))/3; 
          float g = (red(img.pixels [pos])+green(img.pixels[pos])+blue(img.pixels[pos]))/3;
          float b = (red(img.pixels [pos])+green(img.pixels[pos])+blue(img.pixels[pos]))/3;
          pixels[pos] = color(r,g,b);
      }
  }
  updatePixels();
}

