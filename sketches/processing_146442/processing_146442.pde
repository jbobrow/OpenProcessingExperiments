
// copyright 2014 Jacklynn Pham
// ICE #22
/*
   THIS DOES NOT COMPILE
 Finish the two methods that initialize the float and
 color arrays.
 */
 
final int MAX_FIGS = 7;
 
float  [ ] xVals;
float  [ ] yVals;
//float  [ ] dimVals;
float  [ ] deltaDimVals;
float dimVals;
 
color  [ ] colorVals;
 
void setup( )
{
  size( 400, 400 );
  noStroke( );
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
  
  dimVals = 1;
 
  xVals        = new float[ MAX_FIGS ];
  initFloatArray( xVals, 50, width-50 );
 
  yVals        = new float[ MAX_FIGS ];
  initFloatArray( yVals, 50, height-50 );
 
 // dimVals      = new float[ MAX_FIGS ];
 // initFloatArray( dimVals, 1, 5 );
 
  deltaDimVals = new float[ MAX_FIGS ];
  initFloatArray( deltaDimVals, 1, 5 );
 
  colorVals    = new color[ MAX_FIGS ];
  initColorArray( colorVals );
}
 
void initFloatArray ( float [ ] anyIntArray, int minVal, int maxVal )
{
  for ( int i = 0; i < anyIntArray.length; i++)
  {
    anyIntArray[ i ] = int( random( minVal, maxVal) );
  }
}
 
 
void initColorArray( color [] colorVals )
{
  for (int i = 0; i < colorVals.length; i++)
  colorVals [i] = color( random( 255 ), random( 255 ), random( 255 ) );
}
 
void draw( )
{
  //background( 0 );
  growFigures( );
  drawFigures( );
}
 
void growFigures( )
{ 
  for ( int i = 0; i < xVals.length; i++)
  {
   // dimVals[i] += deltaDimVals[i];
   dimVals++;
//    if ( dimVals[i] > width )
//    {
//      xVals[i] = random( width );
//      yVals[i] = random( height  );
//      //deltaDimVals[i] = random( 3, 10 );
//      dimVals[i] = 0;
//      colorVals[i] = color( random( 255 ), random( 255 ), random( 255 ) );
//    }
  }
}
 
void drawFigures( )
{
  for ( int i = 0; i < xVals.length; i++)
  {
    fill( colorVals[i] );
      rect( xVals[i], yVals[i], dimVals, dimVals );
      if (mousePressed == true) {
        dimVals=0;
      }
  }
}



