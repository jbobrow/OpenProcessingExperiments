
//Hyun Doug Kim 
//copyright 2014

final int MAX_FIGS = 10;

float  [ ] xVals;
float  [ ] yVals;
float  [ ] dimVals;
float  [ ] deltaX;
float  [ ] deltaY;

color  [ ] colorVals;

void setup( )
{
  size( 600, 400 );
  noStroke( );
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
  
  xVals        = new float[ MAX_FIGS ];
  initFloatArray( xVals, 50, width-50 );
  
  yVals        = new float[ MAX_FIGS ];
  initFloatArray( yVals, 50, height-50 );
  
  dimVals      = new float[ MAX_FIGS ];
  initFloatArray( dimVals, 10, 70 );
  
  deltaX = new float[ MAX_FIGS ];
  initFloatArray( deltaX, 1, 10 );
  
  deltaY = new float[ MAX_FIGS ];
  initFloatArray( deltaY, 1, 10 );
  
  colorVals    = new color[ MAX_FIGS ];
  initColorArray( colorVals ); 
  
}

void initFloatArray ( float [ ] anyFloatArray, int minVal, int maxVal  )
{
  for (int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray [i] = int(random (minVal, maxVal));
  }
}

void initColorArray( color [ ] anyColorArray)
{
  for (int i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray [i] = color ( random(255), random(255), random(255));
  }
}

void draw( )
{
   background( 0 );
   moveFigures( );
   //moveFigures(); YOU GET TO MAKE THIS <3
   drawFigures( ); 
}

void moveFigures( )
{  
  for( int i = 0; i < dimVals.length; i++)
  {
    xVals[i] = xVals[i]+deltaX[i];
    yVals[i] = yVals[i]+deltaY[i];
    if ( xVals[i] > width || xVals[i] < 0 )
    {
       deltaX [i] = -deltaX [i];
       colorVals[i] = color( random( 255 ), random( 255 ), random( 255 ) );
    }
    if ( yVals[i] > height || yVals[i] < 0 )
    {
       deltaY [i] = -deltaY [i];
       colorVals[i] = color( random( 255 ), random( 255 ), random( 255 ) );
    }
   
  }
}

void drawFigures( )
{
  for( int i = 0; i < dimVals.length; i++)
  {
    fill( colorVals[i] );
    if( i %2 == 0 )  // even index
    {
      arc( xVals[i], yVals[i], dimVals[i], dimVals[i], xVals[i]%2, yVals[i]%2 );
    }
    else  // odd index
    {
      arc( xVals[i], yVals[i], dimVals[i], dimVals[i], xVals [i]%5, yVals[i] %6 );      
    }
  }  
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}



