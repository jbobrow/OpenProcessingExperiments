
PImage    tex;
PImage    rad;
float[][] angle_lut;
float[][] depth_lut;

void buildAngleLut(float[][] lut)
{
  for(int x=0;x<width;x++)
  {  for(int y=0;y<height;y++)
    {
      int relx = width/2 - x;
      int rely = y - height/2;
      
      lut[x][y] = atan2(relx, rely);
      
      //Translate:
      lut[x][y] = tex.width/2 + angle_lut[x][y]/TWO_PI * tex.width-1;
    }
  }
}

void buildDepthLut(float[][] lut)
{
  for(int x=0;x<width;x++) 
  {  for(int y=0;y<height;y++)
    {
      int relx = width/2 - x;
      int rely = y - height/2;
      
      lut[x][y] = 30000f*(height-mouseY) / (relx*relx + rely*rely);
    }
  }
}

void buildRadial()   
{
  rad = new PImage(width,height);
  for(int x=0;x<width;x++) 
  {  for(int y=0;y<height;y++)
    {
        rad.pixels[y*width + x] = color(255-int( 255 *
            sin(width/1.4 + (float)x/width*TWO_PI)
          * cos((float)(y-height/2)/height*PI*1.5)
        ));
    }
  }
}

void setup()
{
  size(640,400);
  tex = loadImage("tuntex.jpg");
  
  angle_lut = new float[width][height];
  depth_lut = new float[width][height];
  buildDepthLut(depth_lut);
  buildAngleLut(angle_lut);
  buildRadial();
  
//thread("depthThread");
}

/*
void depthThread()
{
  for(;;)
    { buildDepthLut(depth_lut); }
}
*/

void draw()
{
  buildAngleLut(angle_lut);
  
  loadPixels();
  for(int x=0;x<width;x++)
  {  for(int y=0;y<height;y++)
    {
      int texX = int(angle_lut[x][y] + frameCount)%tex.width;
      int texY = (int)((depth_lut[x][y]+frameCount*8)%tex.height);
      pixels[y*width +x] = tex.pixels[texY*tex.width +texX];
    }
  }
  updatePixels();

blend(rad, 0,0, width,height, 0,0, width,height, MULTIPLY );
}


