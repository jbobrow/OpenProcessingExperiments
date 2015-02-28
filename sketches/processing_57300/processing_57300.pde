
//exploratory convolution
//bogdan vera

PImage gfxImage;
 
 float xIncrement;
 float coeff1;
 void setup()
{
  coeff1 = 1.0;
  xIncrement = 0.0;
  size(800,800);
  frameRate(60);
  gfxImage = createImage(width,height,RGB);
   
  gfxImage.loadPixels();
  for(int x = 0; x< width; x++)
  for(int y = 0; y< height; y++)
  {
     
    float sx = sin(((float)x/(float)width)*3.14);
    float cx = cos(((float)x/(float)width)*3.14);
    float sy = sin(((float)y/(float)height)*3.14);
    float cy = sin(((float)y/(float)height)*3.14);
     
    gfxImage.pixels[y*width + x] = color( (sx * sy*0.4)  * random(100),(sx * sx) * random(255), 100,  255);
  }
  gfxImage.updatePixels();
}
 
 void burst()
 {
   
   gfxImage.loadPixels();
   for(int x = width-20; x< width; x++)
   for(int y = 0; y < height; y++)
   {
     gfxImage.pixels[y*width + x] = color(random(255),0,random(255),255);
   }
   
   gfxImage.updatePixels();
 }
 
void draw()
{
  coeff1+=0.00001;
  
  if(coeff1>2.0)
  coeff1 -=1.0;
  
  xIncrement+= 0.1;
  
  if(xIncrement>=7.0)
  {
  xIncrement = 0.0;
  }
  
  int chance = (int)random(2000);
  
  if(chance>1990)
  burst();
  
  background(0);
 gfxImage.loadPixels();
  for(int x = 1; x< width-1; x++)
  for(int y = 1; y< height-1; y++)
  {
   gfxImage.pixels[y*width + x] =  (int)((
   gfxImage.pixels[y*width + x+(int)xIncrement+3]*coeff1 +
   gfxImage.pixels[y*width + x-1] +
   gfxImage.pixels[y*width + x+1] +
    gfxImage.pixels[(y-1)*width + x+ (int)xIncrement*2] +
   gfxImage.pixels[(y+1)*width + x] ) / 4.999999 );
     
  }
gfxImage.updatePixels();
 
  image(gfxImage,0,0);
   
   
}

