
// Homework #11 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright March 2012

//Instructions
//Key Up and Down to see Urchine connections

final int MAX = 200;

int [] xList;
int [] yList;
int [] deltaXlist;
int [] deltaYlist;
int [] sizeList;
color[] col;
color[] col2;
int [] index;
int maxDist;

void setup()
{
  smooth();
  size( 670, 670 );
  noStroke();
  xList = new int [ MAX ];
  yList = new int [ MAX ];
  deltaXlist = new int [ MAX ];
  deltaYlist = new int [ MAX ];
  sizeList = new int [ MAX ];
  col = new color[ MAX ];
  col2 = new color[ MAX ];
  index = new int[0];
  
  initArray( xList, 0, width );
  initArray( yList, 0, height );
  initArray( deltaXlist, -4, 4 );
  initArray( deltaYlist, -3, 6 );
  initArray( sizeList, 5, 25 );
  initColor( col );
  initColor2( col2 );
  
  movementCheck( );
}

void draw()
{
  moveFigures();
  drawFigure();
  lineDraw();
  fill( 0, 150, 150, 4 );
  rect( 0, 0, width, height );
}

void moveFigures()
{
  for( int i = 0; i < xList.length; i++ )
  {
    xList[i] += deltaXlist[i];
    if( xList[i] > width )
    {
      deltaXlist[i] = -deltaXlist[i];
    }
    xList[i] += deltaXlist[i];
    if( xList[i] < 0 )
    {
      deltaXlist[i] = -deltaXlist[i];
    }
    yList[i] += deltaYlist[i];
    if( yList[i] > height )
    {
      deltaYlist[i] = -deltaYlist[i];
    }
    yList[i] += deltaYlist[i];
    if( yList[i] < 0 )
    {
      deltaYlist[i] = -deltaYlist[i];
    }
  }
}

void drawFigure()
{
  for( int i = 0; i < xList.length; i++ )
  {
    fill( col[i] );
    ellipse( xList[i], yList[i], sizeList[i], sizeList[i] );
  }
}

void initArray( int [] ar, int low, int high )
{
  for( int i = 0; i < ar.length; i++ )
  {
    ar[i] = int( random( low, high ) );
  }
}
  
void initColor( color[] tempColor )
{
  for( int i = 0; i < tempColor.length; i++ )
  {
    int redV = 100;
    int greenV = int( random( 100, 200 ));
    int blueV = int( random( 100, 250 ));
    int transparency = int( random( 150 ));
    tempColor[i] = color( redV, greenV, blueV, transparency );
  }
}

void initColor2( color[] tempColor )
{
  for( int i = 0; i < tempColor.length; i++ )
  {
    
    int whiteV = int( random( 0, 255 ));
    
    int transparency = int( random( 100, 255 ));
    tempColor[i] = color( whiteV, transparency );
  }
}

void movementCheck()
{
  for( int i = 0; i < xList.length; i++ )
  {
    if ( deltaXlist[i] > 1.001 && deltaXlist[i] < 2.001 && deltaYlist[i] > 0.501 && deltaYlist[i] < 2.001 )
     {
       index = append( index, i );
       
     }
  }
}
  
void lineDraw()
{
    strokeWeight( 2 );
  for( int j = 0; j < index.length; j++ )
  {
    int smallIndex = 0;
    for( int i = 0; i < xList.length; i++ )
    {
      stroke( col2[i] );
      float d = dist( xList[index[j]], yList[index[j]], xList[i], yList[i] );
      if( d < maxDist )
      {
         line( xList[index[j]], yList[index[j]], xList[i], yList[i] );
      }
    }
  }
  noStroke();
}

void keyPressed() 
{
  if (keyCode == UP) maxDist += 5;
  else if (keyCode == DOWN) maxDist -= 5;
}
  
  
