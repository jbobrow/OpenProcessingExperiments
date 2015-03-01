
/* @pjs preload="AndroidWallpaper.jpg"; */ 

/*=============================================================
Question 13  WORDING
(Optional)

    If planning on using Matlab (recommended), watch the tutorial videos provided in the corresponding section, and perform “help images” in the Matlab command line for examples of important image related commands.
    Write a computer program capable of reducing the number of intensity levels in an image from 256 to 2, in integer powers of 2. The desired number of intensity levels needs to be a variable input to your program.
    Using any programming language you feel comfortable with (it is though recommended to use the provided free Matlab), load an image and then perform a simple spatial 3x3 average of image pixels. In other words, replace the value of every pixel by the average of the values in its 3x3 neighborhood. If the pixel is located at (0,0), this means averaging the values of the pixels at the positions (-1,1), (0,1), (1,1), (-1,0), (0,0), (1,0), (-1,-1), (0,-1), and (1,-1). Be careful with pixels at the image boundaries. Repeat the process for a 10x10 neighborhood and again for a 20x20 neighborhood. Observe what happens to the image (we will discuss this in more details in the very near future, about week 3).
    Rotate the image by 45 and 90 degrees (Matlab provides simple command lines for doing this).
    For every 3×3 block of the image (without overlapping), replace all corresponding 9 pixels by their average. This operation simulates reducing the image spatial resolution. Repeat this for 5×5 blocks and 7×7 blocks. If you are using Matlab, investigate simple command lines to do this important operation.
=============================================================*/

/**
* @author Miguel Alejandro Moreno Barrientos @2015<br>
* This sketch was developed for the MOOC course <br>
* <i>"Image and video processing: From Mars to Hollywood with a stop at the hospital"</i><br>
* q13 Exercise from week 1.<br>
* <br>
* keys:<br>
* <b>0</b> - <i>Original image</i><br>
* <b>1</b> - <i>Change intensity levels</i><br>
* <b>2</b> - <i>Use average color from neighbors</i><br>
* <b>3</b> - <i>Rotate image</i><br>
* <b>4</b> - <i>Reduce resolution</i><br><br>
* <b>i</b> - <i>Show/Hide info</i><br>
* <b>q</b> - <i>Quit<br>
* <b>Left/Right</b> - <i>Change parameters</i><br>
*/


PImage img;  // original image
float ang = 0;  // rotation angle
static class State {
  final static int ORIGINAL = 0, INTENSITY_LEVELS = 1, MEAN = 2, ROTATE = 3, REDUCE_RESOLUTION = 4;  // program states
}
int state = State.ORIGINAL;  // program state
int bits = 1;  // color bits 
int meanSize = 3;  // mask size for apply average color
int blockSize = 3;  // block size for resolution
boolean info = true;  // show message info


void setup()
{
  size( 700, 700 );
  img = loadImage( "AndroidWallpaper.jpg" );
  noLoop();
}


void draw()
{
  background( 127 );
  imageMode( CENTER );
  PImage canvas = null;
  String msg = null;
  
  // select operation
  switch ( state )
  {
    case State.ORIGINAL:
      canvas = img;
      msg = "Original";
      break;
    
    case State.INTENSITY_LEVELS:
      canvas = pow2IntensityLevels( img, int( pow( 2, bits ) ), true );
      msg = "depth " + bits + " bits";
      break;
      
    case State.MEAN:
      canvas = mean( img, meanSize, meanSize );
      msg = "mean " + meanSize + "x" + meanSize;
      break;
      
    case State.ROTATE:
      canvas = rotateCenteredImage( img, ang );
      msg = "rotate " + round( ( ang % TWO_PI ) / TWO_PI * 360 ) + "º";
      break;
      
    case State.REDUCE_RESOLUTION:
      canvas = reduceImageSpatialResolution( img, blockSize, blockSize );
      msg = "block size: " + blockSize + "x" + blockSize;
      break;
  }
  
  // plot result
  image( canvas, width / 2, height / 2 );
  
  // plot message
  if ( info )
  {
    textAlign( RIGHT, TOP );
    textSize( 20 );
    fill( color( 0 ) );
    text( msg, width, 2 );
    fill( color( 255 ) );
    text( msg, width - 2, 0 );
  }
}


void keyPressed()
{
  switch ( key )
  {
    case '0':  state = State.ORIGINAL; break;
    case '1':  state = State.INTENSITY_LEVELS; break;
    case '2':  state = State.MEAN; break;
    case '3':  state = State.ROTATE; break;
    case '4':  state = State.REDUCE_RESOLUTION; break;
    case 'Q':
    case 'q':  exit(); break;
    case 'I':
    case 'i':  info = !info; break;
  }

  if ( key == CODED )
    switch ( state )
    {
      case State.INTENSITY_LEVELS:
        if ( keyCode == RIGHT && bits < 8 )
          bits++;
        else if ( keyCode == LEFT && bits > 1 )
          bits--;
        break;
      
      case State.MEAN:
        if ( keyCode == RIGHT && meanSize < 21 )
          meanSize++;
        else if ( keyCode == LEFT && meanSize > 1 )
          meanSize--;
        break;
      
      case State.ROTATE:
        if ( keyCode == RIGHT )
          ang -= QUARTER_PI;
        else if ( keyCode == LEFT )
          ang += QUARTER_PI;
        break;

      case State.REDUCE_RESOLUTION:
        if ( keyCode == RIGHT )
          blockSize++;
        else if ( keyCode == LEFT && blockSize > 1 )
          blockSize--;
        break;
    }
  
  redraw();
}




// =================================== IMAGE FUNCTIONS ==================================

PGraphics pow2IntensityLevels( PImage img, int n, boolean gray )
{
  PGraphics canvas = createGraphics( img.width, img.height );
  
  int bits = floor( log( n ) / log( 2 ) );
  int levels = int( pow( 2, bits ) );
  int factor = 256 / levels;  
  
  canvas.beginDraw();

  for ( int y = 0; y < img.height; y++ )
    for ( int x = 0; x < img.width; x++ )
    {
      color c = img.get( x, y );
      if ( gray )
      {
        int gr = floor( ( red( c ) + green( c ) + blue( c ) ) / 3 / factor ) * factor;
        canvas.set( x, y, color( gr ) );
      }
      else
      {
        int r = floor( red( c ) / factor ) * factor;
        int g = floor( green( c ) / factor ) * factor;
        int b = floor( blue( c ) / factor ) * factor;
        canvas.set( x, y, color( r, g, b ) );
      }
    }
  
  canvas.updatePixels();
  canvas.endDraw();
  
  return canvas;
}


PGraphics mean( PImage img, int maskWidth, int maskHeight )
{
  PGraphics canvas = createGraphics( img.width, img.height );
    
  canvas.beginDraw();
    
  int w = canvas.width, h = canvas.height;
  int mlx = int( ( maskWidth - 1 ) / 2 ), mrx = int( maskWidth / 2 );  // 'int' needed for JS Mode 
  int muy = int( ( maskHeight - 1 ) / 2 ), mdy = int( maskHeight / 2 );

  for ( int y = 0; y < h; y++ )
    for ( int x = 0; x < w; x++ )
    {
      int minx = max( 0, x - mlx );
      int maxx = min( w, x + mrx + 1 );
      int miny = max( 0, y - muy );
      int maxy = min( h, y + mdy + 1 );
      int size = ( maxx - minx ) * ( maxy - miny );
      int r = 0, g = 0, b = 0;
      for ( int my = miny; my < maxy; my++ )
        for ( int mx = minx; mx < maxx; mx++ )
        {
          color c = img.get( mx, my );
          r += red( c );
          g += green( c );
          b += blue( c );
        }
      canvas.set( x, y, color( r / size, g / size, b / size ) );
    }
  
  canvas.updatePixels();
  canvas.endDraw();
    
  return canvas;
}


PGraphics rotateCenteredImage( PImage img, float ang )
{
  PGraphics canvas = createGraphics( int( sqrt( img.width * img.width + img.height * img.height ) ), int( sqrt( img.width * img.width + img.height * img.height ) ) );
  
  canvas.beginDraw();
  canvas.background( 0 );
  canvas.imageMode( CENTER );
  canvas.pushMatrix();
  canvas.translate( canvas.width / 2, canvas.height / 2 );
  canvas.rotate( -ang );
  canvas.image( img, 0, 0 );
  canvas.popMatrix();
  canvas.endDraw();
  
  return canvas;
}


PGraphics reduceImageSpatialResolution( PImage img, int maskWidth, int maskHeight )
{
  PGraphics canvas = createGraphics( img.width, img.height );
    
  canvas.beginDraw();
    
  int w = canvas.width, h = canvas.height;

  for ( int y = 0; y < h; y += maskHeight )
  {
    int ly = y + maskHeight;
    if ( ly > h )
      ly = h;
      
    for ( int x = 0; x < w; x += maskWidth )
    {
      int lx = x + maskWidth;
      if ( lx > w )
        lx = w;
        
      int size = ( ly - y ) * ( lx - x );
      int r = 0, g = 0, b = 0;
        
      for ( int my = y; my < ly; my++ )
        for ( int mx = x; mx < lx; mx++ )
        {
          color c = img.get( mx, my );
          r += red( c );
          g += green( c );
          b += blue( c );
        }
        
      color mean = color( r / size, g / size, b / size );
      
      for ( int my = y; my < ly; my++ )
        for ( int mx = x; mx < lx; mx++ )
          canvas.set( mx, my, mean );
    }
  }

  canvas.updatePixels();
  canvas.endDraw();
    
  return canvas;
}



