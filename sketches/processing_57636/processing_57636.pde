
//Alcys_Convolution22

//point de depart "exploratory convolution" :Bogdan Vera.

/*http://www.openprocessing.org/sketch/57300*/




PImage gfxImage;

float inc;
float perturb;
int delta;
void setup()
{
     perturb = 1.0;
     size(860, 700);
     inc=0.08;
     frameRate(60);
     gfxImage = createImage(width, height, RGB);

     gfxImage.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               float sx = sin((float)x/150.28);
               float cx = cos((float)x/150.28);
               float sy = sin((float)y/150.28);
               float cy = cos((float)y/150.28);
               gfxImage.pixels[y*width + x] =
               color( 217+38*(3-sy*cx)*(1+cy*cx), 255+ 0.88*(3-cy*cx), 20+ 22*(1.5+sy*sx)*(1+cy), 1.289*(0.1+cx*cy)*(1+sx));
          }
     gfxImage.updatePixels();
}


void draw()
{
     if (perturb>=7.25)
          inc=-0.08f;
     if (perturb<-7.25)
          inc=0.08f;
     perturb+=inc;
     delta=int(perturb);
     println(delta+"    "+perturb);

     background(255);
     gfxImage.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {
               gfxImage.pixels[y*width + x] =  (int)((
               gfxImage.pixels[y*width + x] +
                    gfxImage.pixels[y*width + x-1-delta] +
                    gfxImage.pixels[y*width + x+1+delta] +
                    gfxImage.pixels[(y-1)*width + x] +
                    gfxImage.pixels[(y+1)*width + x] ) / ((5+delta/40.0)*0.999995 ));
          }
     gfxImage.updatePixels();
     image(gfxImage, 0, 0);
}


