

 
// COPYRIGHT Faryal Khalid
//Computing Arts with Processing
//HW 8

int numFig = 20;    //number of figures created
float [] xVal = new float [ numFig ] ;   //x-value of the figure
float [] yVal = new float [ numFig ] ;   //y-value of the figure 
color [] figColor = new color [ numFig ];  //color of the figure
float [] figDim = new float [ numFig ];  //dimension of the figure
float [] moveX = new float [ numFig ];   //movement in x direction
float [] moveY = new float [ numFig ];   //movement in y direction
float [] figAngle = new float [ numFig ];  //Angle of figure
boolean [] figBounce = new boolean [ numFig ];
float [] rotate = new float [ numFig ];
 
 
void setup( )
{
  size( 600, 400);
  background( 0 );
  noStroke( );
 
  //where the figure starts
  for ( int i = 0; i < xVal.length; i++)
  {
    xVal [ i ] = width*.75;
    yVal [ i ] = height*.75;
 
    //how the figure moves
    moveX [ i ] = random( 1, 7 );
    moveY [ i ] = random( 1, 7 );
 
    //angle of figure
    figAngle [ i ] = random( 1, 90 );
 
    //spell out figure color later
    
    //how big the figure is
    figDim [ i ] = random( 5, 20 );
 
    figBounce [ i ] = false;
  }
}
 
void draw( )
  {

  background(1,4,121);
  moveFigure( );
  drawFigure( );

  }

//border collision instance
void moveFigure( )
{
  for ( int i = 0; i<xVal.length; i++ )
  {
    xVal [ i ] = xVal [ i ] - moveX [ i ];
    yVal [ i ] = yVal [ i ] - moveY [ i ];
 

    if ( xVal [ i ] < 0 )
    {
      moveX [ i ] = -moveX [ i ];
      moveY [ i ] = moveY [ i ];
    }
 
    if ( xVal [ i ] > width)
    {
      moveX [ i ] = -moveX [ i ];
      moveY [ i ] = moveY [ i ];
    }
 
    if ( yVal [ i ] < 0 )
    {
      moveX [ i ] = moveX [ i ];
      moveY [ i ] = -moveY [ i ];
    }
 
    if ( yVal [ i ] > height )
    {
      moveX [ i ] = moveX [ i ];
      moveY [ i ] = -moveY [ i ];
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
    
    stroke(255);
    line( x, y, wd-15, ht-15 );
    

    
    noStroke();
    fill( 72,247,243);
    ellipse( x, y, wd*2, ht*2 );
    
    noStroke();
    fill( 255, random(255), random(255));
    rect( x, y, wd, ht );

 
    
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



