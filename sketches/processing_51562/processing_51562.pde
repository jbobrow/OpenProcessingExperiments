
PImage gfxImage;

void setup()
{
  size(400,400);
  frameRate(60);
  gfxImage = createImage(width,height,RGB);
  
  gfxImage.loadPixels();
  for(int x = 0; x< width; x++)
  for(int y = 0; y< height; y++)
  {
    
    float sx = sin(((float)x/(float)width)*3.14);
    float cx = cos(((float)x/(float)width)*3.14);
    float sy = sin(((float)y/(float)height)*3.14);
    float cy = cos(((float)y/(float)height)*3.14);
    
    gfxImage.pixels[y*width + x] = color( (sx * sy)  * random(255),(sx * sy) * random(255), (sx * sy) * random(255),  255);
  }
  gfxImage.updatePixels();
}

void draw()
{
  
  background(0);
 gfxImage.loadPixels();
  for(int x = 1; x< width-1; x++)
  for(int y = 1; y< height-1; y++)
  {
   gfxImage.pixels[y*width + x] =  (int)((
   gfxImage.pixels[y*width + x] + 
   gfxImage.pixels[y*width + x-1] +
   gfxImage.pixels[y*width + x+1] +
    gfxImage.pixels[(y-1)*width + x] + 
   gfxImage.pixels[(y+1)*width + x] ) / 4.996 ); 
    
  }
gfxImage.updatePixels();

  image(gfxImage,0,0);
  
  
}

