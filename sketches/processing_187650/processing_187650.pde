
/* @pjs preload="dress.jpg"; */

PImage dress;
color[] palette;
float noiseSize = 200.;
int i = 0;


/*--------------------------*/


void setup()
{
  size(500, 500);
  dress = loadImage("dress.jpg");
  dress.loadPixels();
  
  palette = new color[256];
  generateColors();
  
  noLoop();
}


/*--------------------------*/


void draw()
{ 
 loadPixels();
 for (int x = 0; x < width; x++)
 {
   for (int y = 0; y < height; y++)
   {
     pixels[x + y*width] = color(255*noise(x/noiseSize, y/noiseSize));
     float p = 255*noise(pixels[x + y*width]/255.);
     pixels[x + y*width] = palette[int(p)];
   }
 }
 updatePixels();
 filter(BLUR);
}


/*--------------------------*/


void mousePressed()
{
  noiseSeed((int) random(100000));
  noiseSize = random(150, 200);
  generateColors();
  redraw();
}


/*--------------------------*/


void generateColors()
{  
  for (int y = 0; y < dress.height; y++)
  {
    int x = int(random(dress.width));    
    float r = dress.pixels[x + y*dress.width] >> 16 & 0xFF;
    float g = dress.pixels[x + y*dress.width] >>  8 & 0xFF;
    float b = dress.pixels[x + y*dress.width]       & 0xFF;    
    palette[y] = color(r, g, b);
  }
}


