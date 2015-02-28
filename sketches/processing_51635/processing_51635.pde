
PImage gfxImage;
float coeff1;
 
float v = 1.0/9.0;
float[][] kernel = { { v, v, v },
                     { v, v, v },
                     { v, v, v } };
 
 int randomAlpha = 0;
 int randomA,randomB,randomC;

 
 void keyPressed()
{
  randomA = (int)random(2);
  randomB = (int)random(2);
  randomC = (int)random(2);
  println(randomA);
  // if the key is between 'A'(65) and 'z'(122)
  if( key == 'r')
  {
    randomAlpha = (int)random(100);
    coeff1 = (random(1000) / 1000.0) * 2.0f + 1.0f;
    gfxImage.loadPixels();
  for(int x = 0; x< width; x++)
  for(int y = 0; y< height; y++)
  {
     
    float sx = sin(((float)x/(float)width)*3.14);
    float cx = cos(((float)x/(float)width)*3.14);
    float sy = sin(((float)y/(float)height)*3.14);
    float cy = cos(((float)y/(float)height)*3.14);
     
    gfxImage.pixels[y*width + x] = color( randomA*(sx * sy)  * random(255),randomB*(sx * sy) * random(255), randomC*(sx * sy) * random(255),  randomAlpha);
  }
  gfxImage.updatePixels();
  }
    
}
 
void setup()
{
  
  size(400,400);
  frameRate(30);
  gfxImage = createImage(width,height,RGB);
   
  coeff1 = (random(1000) / 1000.0) * 2.0f + 1.0f;
   randomAlpha = (int)random(100);
   println(randomAlpha);
  gfxImage.loadPixels();
  for(int x = 0; x< width; x++)
  for(int y = 0; y< height; y++)
  {
     
    float sx = sin(((float)x/(float)width)*3.14);
    float cx = cos(((float)x/(float)width)*3.14);
    float sy = sin(((float)y/(float)height)*3.14);
    float cy = cos(((float)y/(float)height)*3.14);
     
    gfxImage.pixels[y*width + x] = color( (sx * sy)  * random(255),(sx * sy) * random(255), (sx * sy) * random(255), randomAlpha);
  }
  gfxImage.updatePixels();
}
 
 float phase = 0.0;
 
void draw()
{
  
  PImage edgeImg = createImage(gfxImage.width, gfxImage.height, RGB);
  
   phase += random(1000)/10000.0;
   if(phase>=2.0)
   phase -=2.0;
   
  background(0);
 gfxImage.loadPixels();
  for(int x = 1; x< width-1; x++)
  for(int y = 1; y< height-1; y++)
  {
   gfxImage.pixels[y*width + x] =  (int)((
   gfxImage.pixels[y*width + x] +
   gfxImage.pixels[y*width + x-1]  +
   (gfxImage.pixels[y*width + x+1])   +
  (gfxImage.pixels[(y-1)*width + x]) +
   (gfxImage.pixels[(y+1)*width + x]) ) / (5.0 + sin(phase*3.14)));
     
     
    float sumr = 0; // Kernel sum for this pixel
    float sumg = 0; // Kernel sum for this pixel
    float sumb = 0; // Kernel sum for this pixel
     
    for (int ky = -1; ky <= 1; ky++) {
      for (int kx = -1; kx <= 1; kx++) {
        // Calculate the adjacent pixel for this kernel point
        int pos = (y + ky)*width + (x + kx);
        
         
        // Multiply adjacent pixels based on the kernel values
        sumr += kernel[ky+1][kx+1] * red((gfxImage.pixels[pos]));
        sumg += kernel[ky+1][kx+1] * green((gfxImage.pixels[pos]));
        sumb += kernel[ky+1][kx+1] * blue((gfxImage.pixels[pos]));
      }
    }
    // For this pixel in the new image, set the gray value
    // based on the sum from the kernel
    edgeImg.pixels[y*gfxImage.width + x] = color(sumr,sumg,sumb);
     
     
  }
gfxImage.updatePixels();
 
  image(edgeImg,0,0);
  
  
 
   
   
}

