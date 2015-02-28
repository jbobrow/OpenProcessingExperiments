

//convolution de jacques maire

//inspiration outrancière de "exploratory convolution" :Bogdan Vera.

/*http://www.openprocessing.org/sketch/57300
 
 */
//Une grosse partie de ce code est de Bogdan Vera
PImage gfxImage;
int delta;
float inc;
float coeff1;
void setup()
{
     coeff1 = 1.0;
     inc=0.001;
     size(800, 800);
     frameRate(20);
     gfxImage = createImage(width, height, RGB);

     gfxImage.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {

               float sy = sin(((float)x/(float)width)*PI);
               float cy = cos(((float)x/(float)width)*PI);
               float sx = sin(((float)y/(float)height)*PI);
               float cx = sin(((float)y/(float)height)*PI);

               gfxImage.pixels[y*width + x] =
                    color( (1-(1-cy)*(1-sx))*255, (50*(3-cx*cy)*(1-2*sy*sy*cx*cy))/155.0, (1-(1-sx*cy)*sx*cy)*255.0, (1-sx*cy)/255.0  );
          }
     gfxImage.updatePixels();
}

void burst()
{

     gfxImage.loadPixels();
     for (int x = width-10; x< width; x++)
          for (int y = 0; y < height; y++)
          {
               gfxImage.pixels[x*width + y] = color(255, 255, 255);
          }

     gfxImage.updatePixels();
}

void draw()
{ 
     background(0, 0, 255);


     if (coeff1>=2.5)
          inc=-0.01f;
     if (coeff1<-2.5)
          inc=0.01f;
     coeff1+=inc;
     delta=int(coeff1);
     println(delta+"    "+coeff1);




     gfxImage.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {
               gfxImage.pixels[y*width + x] =  (int)((
               gfxImage.pixels[y*width + x+delta] +
                    gfxImage.pixels[y*width + x-1] +
                    gfxImage.pixels[y*width + x+1] +
                    gfxImage.pixels[(y-1)*width + x+ abs(delta)] +
                    gfxImage.pixels[(y+1)*width + x] ) / 5.01 );
          }
     gfxImage.updatePixels();

     image(gfxImage, 0, 0);
}


