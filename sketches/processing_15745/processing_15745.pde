
//displays a transparent, manipulated video on top of the original video input
//manipulated video compares the values of red, green and blue of each pixel and 
//sets the pixel's color to the color that is in most

import processing.video.*;
Capture video;
PImage i2,alphaimage;


void setup() 
{
  size (640,480);
  video = new Capture(this, width, height, 1);
  i2 = createImage(width, height, RGB);
  alphaimage= createImage(width,height,RGB);
}

void draw() 
{ 
  int transparency=mouseY/2;
  createAlpha(alphaimage,transparency);
  transform(video,i2); 
  video.mask(alphaimage);
  image(i2   ,0,0);
  image(video,0,0);
}

void transform(PImage original, PImage transformed)
{
  video.read();
  original.loadPixels();
  transformed.loadPixels();

  for (int mycolor=0;mycolor<original.width*original.height;mycolor++)
  {

    // getting values of red, green, blue of the pixel
    float r = red(original.pixels[mycolor]);
    float g = green(original.pixels[mycolor]);
    float b = blue(original.pixels[mycolor]);
    //compare red, green and blue values and set the pixels to the color that is most in
    if (r<=g)
    {
      i2.pixels[mycolor]=color(0,255,0);
    } //green
    if (g<=b)
    {
      i2.pixels[mycolor]=color(0,0,255);
    } //blue
    if (b<r)
    {
      i2.pixels[mycolor]=color(255,0,0);
    } //red
  }
  transformed.updatePixels();
}

void createAlpha(PImage ai,int t)
{
 for (int i=0;i<width*height;i++)
 {
   ai.pixels[i]=color(0,0,t);
 }
}                       
