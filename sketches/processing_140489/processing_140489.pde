

final int MAX = 30;

float  [ ] xVals;
float  [ ] yVals;
float  [ ] dimVals;
float  [ ] deltaDimVals;
color  [ ] colorVals;

void setup( )
{
  size( 600,400 );
  noStroke( );
  rectMode( CENTER );
  frameRate( 24 );
  smooth( );
  
  xVals        = new float[ MAX ];
  initFloatArray( xVals, 10, width-100 );
  
  yVals        = new float[ MAX ];
  initFloatArray( yVals, 10, height-100 );
  
  dimVals      = new float[ MAX ];
  initFloatArray( dimVals, 30, 10 );
  
  deltaDimVals = new float[ MAX ];
  initFloatArray( deltaDimVals, 8, 5 );
  
  colorVals    = new color[ MAX ];
  initColorArray( colorVals );
  
}

void initFloatArray (float[]anyFloatArray, int minVal, int maxVal)
{
  for (int i =0; i <anyFloatArray.length; i++)
  {
   anyFloatArray[i]=int(random(minVal,maxVal)); 
  }

}

void initColorArray(color[]anyColorArray)
{
  for(int i=0; i<anyColorArray.length; i++)
  {
    anyColorArray [i] = color(random(255),random(255),random(255));
  }
}

void draw( )
{
   background( 0 );
   moveFigures( );
   drawFigures( ); 
}

void moveFigures( )
{  
  for( int i = 0; i < deltaDimVals.length; i++)
  {
    xVals[i] += deltaDimVals[i];
      if ( xVals[i] > width || xVals[i] <0)
      {
       deltaDimVals[i] = -deltaDimVals[i];
       colorVals[i] = color( random( 255 ), random( 255 ), random( 255 ) );
      } 
  }
}

void drawFigures( )
{
  for( int i = 0; i < xVals.length; i++)
  {
    fill( colorVals[i] );
   {quad(xVals[i],yVals[i],xVals[i]+dimVals[i],yVals[i]+dimVals[i],xVals[i]/1.2,yVals[i]/1.2,dimVals[i],dimVals[i]*.9);}
  }  
}






void keyPressed()
{
  if(key == ' '){setup();} else {exit();}
}


