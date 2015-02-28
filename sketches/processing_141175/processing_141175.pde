
void setup()
{
  size(255,255);
}

float cTime = 0.0;
void draw()
{
    background(0);

  float bx[] = new float[2], by[] = new float[2];
  bx[0] = -(float)width/2/(float)width + 0.2*cos(cTime);
  by[0] = -(float)height/2.0/(float)height + 0.2*sin(cTime);
  bx[1] = -(float)mouseX / (float)width;
  by[1] = -(float)mouseY / (float)height;
   
   loadPixels();
   for(int x=0; x<width; x++)  for(int y=0; y<height; y++)
   {
     float fx = (float)(x)/(float)width;
     float fy = (float)(y)/(float)height;
     
     float ballFunc = 
      1.0 / ( pow(bx[0]+fx,2) + pow(by[0]+fy,2) )
     +1.0 / ( pow(bx[1]+fx,2) + pow(by[1]+fy,2) );
      
     float thresh = 45.0;
     pixels[y*width + x] = (ballFunc >= thresh)? color(0xAA,0xB0,0xB4): color(0,0,0);
     
     thresh = 64.0;
     pixels[y*width + x] = (ballFunc >= thresh)? color(0xAA,0xC0,0xCF): pixels[y*width + x];
     
     thresh = 128.0;
     pixels[y*width + x] = (ballFunc >= thresh)? color(0xAC,0xE0,0xEF): pixels[y*width + x];
   }
   updatePixels();
   cTime += 0.05;
}
