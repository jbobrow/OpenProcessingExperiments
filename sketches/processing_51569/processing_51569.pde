
PImage gfxImage;
float coeff1;

float v = 1.0/9.0;
float[][] kernel = { { v, v, v },
                     { v, v, v },
                     { v, v, v } };


void keyPressed()
{
  // if the key is between 'A'(65) and 'z'(122)
  if( key == 'r') 
  {
    coeff1 = (random(1000) / 1000.0) * 2.0f + 1.0f;
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
   
}

void setup()
{
  size(400,400);
  frameRate(30);
  gfxImage = createImage(width,height,RGB);
  
  coeff1 = (random(1000) / 1000.0) * 2.0f + 1.0f;
  
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
  
  PImage edgeImg = createImage(gfxImage.width, gfxImage.height, RGB);
  
  background(0);
 gfxImage.loadPixels();
  for(int x = 1; x< width-1; x++)
  for(int y = 1; y< height-1; y++)
  {
   gfxImage.pixels[y*width + x] =  (int)((
   gfxImage.pixels[y*width + x]* 1.2 +
   gfxImage.pixels[y*width + x-1] * 0.2 -
   green(gfxImage.pixels[y*width + x+1]) * 1.3 +
   blue(gfxImage.pixels[(y-1)*width + x]) + 
   red(gfxImage.pixels[(y+1)*width + x]) ) / coeff1 ); 
    
    
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

