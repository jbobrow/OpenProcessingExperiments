
//nickiecheung HW5 feb 3

//global variables
float xFir, yFir, xSec, ySec, dx, dy, dX, dY, wd, ht; 
color bgColor, cFir, cSec; 

void setup( ) 
{ 
  size( 400, 400 ); 
  background( 0 ); 
  wd = 40; 
  ht = 40; 
  xFir = 0; 
  yFir = height - ht; 
  xSec = width - wd;
  ySec = 0;
  dx = 0;
  dy = 1;
  dX = 0;
  dY = 1;
  ellipseMode(CORNER);



  bgColor = color( 60, 60, 60, 20 ); 
  cFir = color( 0, 248, 255 ); 
  cSec = color(235, 255, 0);
  noStroke ( );
} 

void draw( )
{
  prepWindow( );
  drawFigure( xSec, ySec, wd, ht, cSec );
  drawFigure( xFir, yFir, wd, ht, cFir );
  moveFigure( );
}

void prepWindow( )
{
  fill( bgColor );
  rect( 0, 0, width, height );
}


void drawFigure( float x, float y, float wd, float ht, color c )
{
  fill( c);
  ellipse( x, y, wd, ht );
}

void moveFigure( )
{
  xFir = xFir + dx;
  yFir = yFir - dy;
  if ( yFir < 0 )
  {
    dx = 2;
    dy = 0;
  }
  xFir = xFir + dx;
  yFir = yFir - dy;
  if ( xFir >= width - wd )
  {
    dx = 0;
    dy = -2;
  }
  xFir = xFir + dx;
  yFir = yFir - dy;
  if ( yFir > height - ht )
  {
    dx = -2;
    dy = 0;
  }
  xFir = xFir + dx;
  yFir = yFir - dy;
  if ( xFir < 0 )
  {
    dx = 0;
    dy = 2;
  }
  xSec = xSec + dX;
  ySec = ySec + dY;
  if ( ySec > height - ht )
  {
    dX = -1;
    dY = 0;
  }
  xSec = xSec + dX;
  ySec = ySec + dY;
  if ( xSec < 0 )
  {
    dX = 0;
    dY = -1;
  }
  xSec = xSec + dX;
  ySec = ySec + dY;
  if ( ySec < 0 )
  {
    dX = 1;
    dY = 0;
  }
  xSec = xSec + dX;
  ySec = ySec + dY;
  if ( xSec > width - wd )
  {
    dX = 0;
    dY = 1;
  }
}



