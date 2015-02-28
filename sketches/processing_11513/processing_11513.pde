
PImage gImage;
PGraphics gLineGraphics;
int mHeight;
int mInterval = 1;
void
setup()
{
//  gImage = loadImage("OldEnglishText.gif");
//  gImage = loadImage("the-face.jpg");
  gImage = loadImage("414D91CKFFL.jpg");
//  gImage = loadImage("kindle-dx-russian-text.gif");


  gLineGraphics = createGraphics( gImage.width, mInterval, P2D );
  size(gImage.width, gImage.height);
  
  
  mHeight = 0;//gImage.height;
  
  frameRate(60);
}

void
draw()
{
//  background(255);
  gLineGraphics.beginDraw();
  gLineGraphics.image( gImage, 0, -mHeight );
  gLineGraphics.endDraw();
    
  for( int y = height; y >= mHeight; --y )
  {
    image( gLineGraphics, 0, y );
  }
  
//  if( mousePressed && frameCount % 2 == 0 )
  {
    if( mHeight < height ) mHeight+=mInterval;
  }
}

void
mousePressed()
{
  mHeight = 0;
  background(255);
}
  

