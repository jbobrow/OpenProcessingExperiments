
//nickiecheung HW5 feb 3

//global variables
float xFir, yFir, xSec, ySec, dx, dy, wd, ht; 
color bgColor, cFir, cSec; 

void setup( ) 
{ 
  size( 400, 400 ); 
  background( 0 ); 
  wd = 40; 
  ht = 40; 
  xFir = 0 + wd/2; 
  yFir = height - ht/2; 
  xSec = width - wd/2;
  ySec = 0 + ht/2;
  dx = 10;
  dy = 10;



  bgColor = color( 0, 10, 10, 20 ); 
  cFir = color(255, 0, 0 ); 
  cSec = color(0, 255, 0);
  noStroke ( );
} 

void draw( )
{
  prepWindow( );
  drawFigure( xSec, ySec, wd, ht );
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
  fill( c );
  ellipse( x, y, wd, ht );
}

void drawFigure( float x, float y, float wd, float ht )
{
  fill( cSec);
  ellipse( x, y, wd, ht );
}

void moveFigure( )
{
  xFir = xFir + dx;
  yFir = yFir + dy;
  if ( xFir > width - wd/2 )
  {
    dx = 0;
    dy = 1;
  }
  if (yFir > height - ht/2 )
  {
    dx = -1;
    dy = 0;
  }
  if (xFir < wd/2 )
  {
    dx = 0;
    dy = -1;
  }
  if ( yFir < ht/2 )
  {
    dx = 1;
    dy = 0;
  }
}


