
//convolution de jacques maire
 
//point de départ "exploratory convolution" :Bogdan Vera.
 
/*http://www.openprocessing.org/sketch/57300
  
 */

PImage gfxImage;

void setup()
{
    
     size(600, 600);
     frameRate(60);
     gfxImage = createImage(width, height, RGB);
     gfxImage.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               float sx =sin(x*x+y*y);
               float sy = log(sq(y*x+y*y));
               gfxImage.pixels[y*width + x] =
              color((sx*sy)*255 , sq(sx+sy)/15,sq(sx*sy)*0.001,(sx+sy)*sy );
          }
     gfxImage.updatePixels();
}
 

 
void draw()
{
     background(0, 0, 255);
     gfxImage.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {
               gfxImage.pixels[y*width + x] =  (int)((
               gfxImage.pixels[y*width + x] +
                    gfxImage.pixels[y*width + x-1] +
                    gfxImage.pixels[y*width + x+1] +
                    gfxImage.pixels[(y-1)*width + x] +
                    gfxImage.pixels[(y+1)*width + x] ) / 5.0017 );
          }
     gfxImage.updatePixels();
 
     image(gfxImage, 0, 0);
}


