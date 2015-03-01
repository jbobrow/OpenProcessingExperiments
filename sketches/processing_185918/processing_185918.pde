
/* @pjs preload="Sunflowers.png"; */

PImage img, bg, img_alpha;
PGraphics pg_alpha;
float tolerance = 80;

/*---------------------------*/


void setup()
{
  noLoop();
  size(512, 512);
    
  img = loadImage("Sunflowers.png");
  img.loadPixels(); 
  //link to the original image: http://commons.wikimedia.org/wiki/File:Sunflowers.jpg
  
  bg = createImage(width, height, RGB);
  bg.loadPixels();
  
  //create mask 
  pg_alpha = createGraphics(512, 512);
  pg_alpha.beginDraw();
  pg_alpha.background(0);
  pg_alpha.endDraw();
  quadtree(0, 0, width, height, true);  //create the circles
  
  //copy the mask to an image so it works on javaScript mode
  img_alpha = createImage(width, height, RGB);
  copyMask(pg_alpha, img_alpha);
}


/*---------------------------*/


void draw()
{    
  background(255);
   
  quadtree(0, 0, width, height, false);  //turn the subdivisions
  bg.updatePixels();

  bg.mask(img_alpha);  //masks the image background with the circles
  image(bg, 0, 0);  //load the image
}


/*---------------------------*/


void mouseClicked()
{
  redraw(); 
}





void quadtree(int x, int y, int w, int h, boolean mask)
{
  float[][] rgb = readPixels(x, y, w, h);  //list of red, green and blue values for each pixel on the interval
  float[] m = mean(rgb);  //mean value of each channel
  float v = variation(rgb, m);  //amount of variation on each channel
  
  
  if (v > tolerance)  //if the variation is bigger then the tolerance continue to subdivide
  {
    w /= 2;
    h /= 2;
    
    quadtree(x, y, w, h, mask);  //top-left
    quadtree(x+w, y, w, h, mask);  //top-right
    quadtree(x, y+h, w, h, mask);  //bottom-left
    quadtree(x+w, y+h, w, h, mask);  //bottom-right
  }
  else  //else draw the subdivision
  {      
    if (mask)  //draw circles if its the mask
    {
      pg_alpha.beginDraw();
      pg_alpha.noStroke();
      pg_alpha.fill(255);
      pg_alpha.ellipseMode(CORNER);
      pg_alpha.ellipse(x, y, w-1, h-1);
      pg_alpha.endDraw();   
    }
    else  //turn each subdivision if it's the backgrond image
    {        
      turn(x, y, w, h, rgb, int(random(4)));
    }
  }
}


/*---------------------------*/


float[][] readPixels(int x, int y, int w, int h)
{
  float[][] rgb = new float[3][w*h];
  
  
  int k = 0;
  for (int i = x; i < x+w; i++)
  {
    for (int j = y; j < y+h; j++)
    {          
      rgb[0][k] = img.pixels[i + j*width] >> 16 & 0xFF;  //red channel
      rgb[1][k] = img.pixels[i + j*width] >>  8 & 0xFF;  //green channel
      rgb[2][k] = img.pixels[i + j*width]       & 0xFF;  //blue channel
      k++;
    }
  }
  return rgb; 
}


/*---------------------------*/


float[] mean(float[][] rgb)
{
  float[] m = new float[3];
  
  for (int j = 0; j < m.length; j++)  //read each channel
  { 
   
    m[j] = 0;
    for (int i = 0; i < rgb[j].length; i++)  //for each channel read values of each pixel
    {
      m[j] += rgb[j][i];  //sum the values of each pixels
    }
    m[j] /= rgb[j].length; //divide by the number of pixels
      
  }
  
  return m;
}


/*---------------------------*/


float variation(float[][] rgb, float[] m)
{
  float[] sd = new float[3];
  
  for (int j = 0; j < sd.length; j++)   //read each channel
  { 
    
    for (int i = 0; i < rgb[j].length; i++)  //for each channel read values of each pixel and the mean
    {
      sd[j] += sq(rgb[j][i] - m[j]); 
    }    
    sd[j] /= rgb[j].length - 1;
    sd[j] = sqrt(sd[j]);  //standard deviation
    
  }
  //calculate the variation as the length of a vector where each coordinate is the standard deviation of a channel
  float v = dist(0, 0, 0, sd[0], sd[1], sd[2]);   
  return v; 
}


/*---------------------------*/


void turn(int x, int y, int w, int h, float[][] rgb, int num)
{
  //num = 0: 0 degrees
  //num = 1: 90 degrees
  //num = 2: 180 degrees
  //num = 3: 270 degrees
  
  //decide if k increase or decrease and set its initial value
  boolean decrease = false;
  if (num == 2 || num == 3) decrease = true;
  
  int k = 0;
  if (decrease) k = w*h - 1;
  
  
  if ( num == 0 || num == 2)  //write the pixels using the same order of the reading (x then y)
  {
    for (int i = x; i < x+w; i++)
    {
      for (int j = y; j < y+h; j++)
      {           
        bg.pixels[i + j*width] = color(rgb[0][k], rgb[1][k], rgb[2][k]);        
        if (decrease)  {k--;}  else  {k++;}
      }
    }
  }
  else  //write the pixels using the same opposite order to the reading (y then x)
  {  
    for (int j = y; j < y+h; j++)    
    {
      for (int i = x; i < x+w; i++)
      {           
        bg.pixels[i + j*width] = color(rgb[0][k], rgb[1][k], rgb[2][k]);        
        if (decrease)  { k--;}   else  {k++;}
      }
    }
  }
}


/*---------------------------*/


void copyMask(PGraphics a1, PImage a2)  //copy a PGraphic to a PImage
{
  a1.loadPixels();
  a2.loadPixels();
  for (int i = 0; i < a1.pixels.length; i++) {  a2.pixels[i] = a1.pixels[i];  }  //copy each pixel of a1 to a2
  a2.updatePixels();
}
