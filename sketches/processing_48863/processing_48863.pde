
/*
Lenna / Processing Studies / Code 04
Author: Rafael a.k.a Ctrl
2012
*/

PImage img;
int n = 0;

void setup() 
{
  size(400,400);
  img = loadImage("l.jpg");
}

void draw() 
{background(random(10));
  ++n;
  
  if(n >58)
  {
    background(random(666));
    n=0;
  }
  loadPixels();
  
  img.loadPixels();
  for (int y = int(random(400)); y < height; y++ ) 
  {
    for (int x = int(random(400)); x < (width); x++ ) 
    {
      int loc = n + y*(height - int(random(100)));
      
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[int(random(100))]);
      
      pixels[loc] = color(r,g,b);
    }
  }
  updatePixels();
}

