
////////////////////////////////////////////////
// Simple Cloud Generation using perlin noise
///////////////////////////////////////////////
PGraphics pg;
float fInc;
float fCloudCover;
float fCloudSharpness;
float fCloudSpeed,fSpeed;
float fStartX,fStartZ;
color c1,c2,cloudCol;

void setup()
{
  size(640, 480);
  pg = createGraphics(256, 256, P2D);
  colorMode(RGB,255);
  noSmooth();
  
  fStartX=50.0;
  fStartZ=0.0;
  fInc=0.01;
  fCloudCover=0.1;
  fCloudSharpness=0.95;
  fCloudSpeed=0.0005;
  fSpeed=0.005;
  
  c2 = color(0,0,255);
  c1 = color(0,191,255);
  cloudCol = color(255,255,255);
  
  Generate();
}

void Generate()
{
  pg.beginDraw();
  pg.loadPixels();
  
  for(int x = 0; x < pg.width; x++ )
  {
    for(int y = 0; y <pg.height; y++ )
    {
       float thick = noise(fStartX+x*fInc,y*fInc,fStartZ);
       thick-=fCloudCover;
       thick=pow(thick,fCloudSharpness);
       color tempCol = lerpColor(c2,c1,(float)y/pg.height);
       pg.pixels[x+y*pg.width] = lerpColor(tempCol,cloudCol,thick);
    }
  }
  
  pg.updatePixels();
  pg.endDraw();
}

void draw()
{
  Generate();
  
  fStartX+=fSpeed;
  fStartZ+=fCloudSpeed;
  
  image(pg,0,0,width,height);
  
  //Input
   if(keyPressed) 
  { 
    if(keyCode == UP) 
    { 
      if(fCloudCover<=0.4)
        fCloudCover += 0.01;  
    } 
    if(keyCode == DOWN)  
    { 
      if(fCloudCover>0.0)
      fCloudCover -= 0.01; 
    } 
   if(keyCode == LEFT) 
   {
    fCloudSpeed += 0.001;  
   }  
   if(keyCode == RIGHT) 
   {
     fCloudSpeed -= 0.001; 
   } 
  }
}

