
//copyright Irene Joung 2014
// ICE #13 Prototype
/*
   THIS DOES NOT COMPILE
   Finish the two methods that initialize the float and 
   color arrays.
*/

final int MAX_FIGS = 10;

float  [ ] xVals;
float  [ ] yVals;
float  [ ] dimVals;
float  [ ] deltaDimVals;

color  [ ] colorVals;

void setup( )
{
  size( 400, 400 );
  noStroke( );
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
  
  xVals        = new float[ MAX_FIGS ];
  initFloatArray( xVals, 50, width-50 );
  
  yVals        = new float[ MAX_FIGS ];
  initFloatArray( yVals, 50, height-50 );
  
  dimVals      = new float[ MAX_FIGS ];
  initFloatArray( dimVals, 1, 5 );
  
  deltaDimVals = new float[ MAX_FIGS ];
  initFloatArray( deltaDimVals, 1, 5 );
  
  colorVals    = new color[ MAX_FIGS ];
  initColorArray( colorVals ); 
}

void initFloatArray ( float [ ] anyFloatArray, int minVal, int maxVal)
{
  for (int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray[i] = int(random(minVal,maxVal));
  }
}

void initColorArray( color [ ] anyColorArray)
{
  for (color i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray[i] = color(random(255),random(255),random(255));
  }
}

void draw( )
{
   background( 0 );
   growFigures( );
   drawFigures( ); 
}

void growFigures( )
{  
  for( int i = 0; i < xVals.length; i++)
  {
    dimVals[i] += deltaDimVals[i];
    if ( dimVals[i] > width )
    {
       xVals[i] = random( width );
       yVals[i] = random( height  );
       deltaDimVals[i] = random( 3, 10 );
       dimVals[i] = 0; 
       colorVals[i] = color( random( 255 ), random( 255 ), random( 255 ) );
    }
  }
}

void drawFigures( )
{
  for( int i = 0; i < xVals.length; i++)
  {
    fill( colorVals[i] );
    if( i %2 == 0 )  // even index
    {
      ellipse( xVals[i], yVals[i], dimVals[i], dimVals[i] );
    }
    else  // odd index
    {
      rect( xVals[i], yVals[i], dimVals[i], dimVals[i] );      
    }
  }  
}



