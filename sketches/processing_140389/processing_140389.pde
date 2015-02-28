
//copyright nickiecheung HW8

// declare figure variables
int numFig = 20;    //number of figures created
float [] xVal = new float [ numFig ] ;   //x-value of the figure
float [] yVal = new float [ numFig ] ;   //y-value of the figure  
float [] figDim = new float [ numFig ];  //dimension of the figure
color [] figColor = new color [ numFig ];  //color of the figure
float [] deltaX = new float [ numFig ];   //change x-position
float [] deltaY = new float [ numFig ];   //change y-position
float [] figOrient = new float [ numFig ];  //orientation of figure
boolean [] figBounce = new boolean [ numFig ]; 
float [] rotate = new float [ numFig ];


void setup( )
{
  size( 600, 400 );
  background( 0 );
  noStroke( );

  //set starting placement values
  for ( int i = 0; i < xVal.length; i++)
  {
    xVal [ i ] = width*.75;
    yVal [ i ] = height*.75;

    //movement of figure
    deltaX [ i ] = random( 1, 3 );
    deltaY [ i ] = random( 1, 3 );

    //orientation of figure
    figOrient [ i ] = random( 1, 90 );

    //figure color
    figColor [ i ] = color( random( 255 ), random( 255 ), random( 255 ), 5 );
    //figure size
    figDim [ i ] = random( 5, 15 );

    figBounce [ i ] = false;
  }
}

void draw( )
{
  background( 0 );


  moveFigure( );
  drawFigure( );
}

void moveFigure( )
{
  for ( int i = 0; i<xVal.length; i++ )
  {
    xVal [ i ] = xVal [ i ] - deltaX [ i ];
    yVal [ i ] = yVal [ i ] - deltaY [ i ];

    //border collision test
    //check left border
    if ( xVal [ i ] < 0 )
    {
      deltaX [ i ] = -deltaX [ i ];
      deltaY [ i ] = deltaY [ i ];
    }

    if ( xVal [ i ] > width)
    {
      deltaX [ i ] = -deltaX [ i ];
      deltaY [ i ] = deltaY [ i ];
    }

    if ( yVal [ i ] < 0 )
    {
      deltaX [ i ] = deltaX [ i ];
      deltaY [ i ] = -deltaY [ i ];
    }

    if ( yVal [ i ] > height )
    {
      deltaX [ i ] = deltaX [ i ];
      deltaY [ i ] = -deltaY [ i ];
    }
  }
}
  void drawFigure( )
  {
    for ( int i = 0; i<xVal.length; i++ )
    {
      rotateFigure( i );
    }
  }

  void rotateFigure( int index )
  {
    for ( int i = 0; i < xVal.length; i++ )
    {
      figure( i, figColor [ i ] );
    }
  }



  void figure( int index, int c )
  {
    //declare local variables
    float x = xVal [ index ];
    float y = yVal [ index ];
    float wd = figDim [ index ];
    float ht = figDim [ index ];

    fill( 255, 255, 255, 5 );
    rect( x, y, wd, ht );

    fill( c );
    //upper triangle
    triangle( x, y, x + .5*wd, y - ht, x + wd, y );

    //left triangle
    triangle( x - wd, y + .5*ht, x, y, x, y + ht );

    //right triangle
    triangle( x + wd, y, x + 2 * wd, y + .5 * ht, x + wd, y + ht );

    //bottom triangle
    triangle( x, y + ht, x + wd, y + ht, x + .5 * wd, y + 2 * ht );
  }


  void keyPressed( )
  {
    if ( key == ' ' )
    {
      setup( );
    }
    else
    {
      exit( );
    }
  }



