
//Copyrights 2014 kristen chon

final int MAX_FIGS = 10;
 
float  [ ] xVals;
float  [ ] yVals;
float  [ ] dimVals;
float  [ ] deltaDimVals;
 
color  [ ] colorVals;
 
void setup( )
{
  size(400, 600 );
  noStroke( );
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
   
  xVals = new float[ MAX_FIGS ];
  initFloatArray( xVals, 50, width-50 );
   
  yVals = new float[ MAX_FIGS ];
  initFloatArray( yVals, 50, height-50 );
   
  dimVals = new float[ MAX_FIGS ];
  initFloatArray( dimVals, 5, 40 );
   
  deltaDimVals = new float[ MAX_FIGS ];
  initFloatArray( deltaDimVals, 1, 5 );
   
  colorVals = new color[ MAX_FIGS ];
  initColorArray( colorVals );
}
 
void initFloatArray (float[]anyFloatArray, int minVal, int maxVal)
{
  for(int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray[i] = int(random(minVal, maxVal));
  }
}
 
void initColorArray(color[]anyColorArray)
{
  for(int i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray[i] = color(random(255), random(255), random(255));
  }
}
 
void draw( )
{
   background( 0 );
   drawFigures( );
   moveFigure();
}

void moveFigure() 
{for ( int i = 0; i < dimVals.length; i++)
  {
    xVals[ i ] += dimVals[ i ];
    yVals[ i ] += deltaDimVals[ i ];  
    
    if (xVals[i] + dimVals[i] > width || xVals[i] < 0)
    {
      dimVals[i] = -dimVals[i];
    }
    
    if (yVals[i] + deltaDimVals[i] > width || yVals[i] < 0)
    {
      deltaDimVals[i] = -deltaDimVals[i];
      
    
   
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
      ellipse( xVals[i], yVals[i], dimVals[i]+xVals[i]*.5, dimVals[i]+yVals[i]*.2);
    }
    else  // odd index
    {
      rect( xVals[i], yVals[i], dimVals[i]+xVals[i]*.2, dimVals[i]+yVals[i]*.4 );     
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



