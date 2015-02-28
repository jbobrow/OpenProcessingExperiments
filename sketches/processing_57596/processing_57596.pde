

//convolution9 de jacques maire

//inspiration  de "exploratory convolution" :Bogdan Vera.

/*http://www.openprocessing.org/sketch/57300
 
 */
//Une  partie de ce code est de Bogdan Vera
PImage gfxImage;
int delta;
float inc,co,si,sx,sy;
float coeff1;
void setup()
{
     coeff1 = 2.0;
     inc=0.01;
     size(850, 700);
     frameRate(60);
     gfxImage = createImage(width, height, RGB);

     gfxImage.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {

               sx = 1-sq((float)x/(float)width);
               
                sy = 1-sq((float)y/(float)height);
              

               gfxImage.pixels[y*width + x] =
                    color(249.6,150.2*sqrt(sy*sx),100.5*(sx*sx+sy*sy) ,(sx*sx+sy*sy)*1.1 );
          }
     gfxImage.updatePixels();
}



void draw()
{ 
   


     if (coeff1>=2.25)
          inc=-0.01f;
     if (coeff1<-3.25)
          inc=0.01f;
     coeff1+=inc;
     delta=int(coeff1)*2;
     println(delta+"    "+coeff1);




     gfxImage.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {
               co=((float)x*y/(float)width)*0.005;
               si=((float)sq(y-x)/(float)height)*0.007;
               gfxImage.pixels[y*width + x] =  (int)((
               gfxImage.pixels[y*width + x+delta] +
                    (1-co)*gfxImage.pixels[y*width + x-1+ abs(delta)] +
                    (1-si)*gfxImage.pixels[y*width + x+1] +
                    (1+co)*gfxImage.pixels[(y-1)*width + x] +
                    (1+si)*gfxImage.pixels[(y+1)*width + x] ) / 5.000019 );
                
          }
     gfxImage.updatePixels();

     image(gfxImage, 0, 0);
}


