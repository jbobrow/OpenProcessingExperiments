
/* @pjs preload="Sunflowers.png"; */

PImage img;
float tolerance;
char mode = '1';


/*---------------------------*/


void setup()
{
  size(512, 512);  
  img = loadImage("Sunflowers.png");
  img.loadPixels(); 
  //link to the original image: http://commons.wikimedia.org/wiki/File:Sunflowers.jpg
}


/*---------------------------*/


void draw()
{  
  switch(mode)  //background change with the mode to replace the 1x1 squares
  {
    case '1':  background(img); break;  //mode 1: no stroke (image as background)
    case '2':  background(255);  break;  //mode 2: white stroke  (white background)
    case '3':  background(0);  break;  //mode 3: blackstroke and white fill (black background)
    case '4':  background(img);  break;  //mode 4: white stroke and original image (image as background)
  }
  
  tolerance = map(mouseX, 0, width, 160, 1);  //tolerance varies with mouseX
  quadtree(0, 0, width, height);
}


/*---------------------------*/


void keyPressed()
{
  if (key == '1' || key == '2' || key == '3' || key == '4')
  {
    mode = key;
  }
}

void quadtree(int x, int y, int w, int h)
{
  float[][] rgb = readPixels(x, y, w, h);  //list of red, green and blue values for each pixel on the interval
  float[] m = mean(rgb);  //mean value of each channel
  float v = variation(rgb, m);  //amount of variation on each channel
  
  
  if (v > tolerance)  //if the variation is bigger then the tolerance continue to subdivide
  {
    w /= 2;
    h /= 2;
    
    quadtree(x, y, w, h);  //top-left
    quadtree(x+w, y, w, h);  //top-right
    quadtree(x, y+h, w, h);  //bottom-left
    quadtree(x+w, y+h, w, h);  //bottom-right
  }
  else//else draw the square 
  {
    switch(mode)
    {
      case '1':  noStroke();  fill(m[0], m[1], m[2]);  break;  //mode 1: no stroke
      case '2':  stroke(255);  fill(m[0], m[1], m[2]);  break;  //mode 2: white stroke
      case '3':  stroke(0);  fill(255);  break;  //mode 3: blackstroke and white fill
      case '4':  stroke(255);  noFill();  break;  //mode 4: white stroke and original image
    }
    
    if (w > 1)  {  rect(x, y, w, h);  }  //1x1 squares are not drawn, instead the background shows the equivalent color 
    else if ( mode == '4')  {  rect(x, y, w, h);  }  //on mode 4 all of the squares are draw
    
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


