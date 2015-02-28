
//Extra Credit 03
//copyright Maitri Shah Pittsburgh PA

final int MAX = 25;

float [ ] xValues = new float [MAX]; //position of X co-ordinate 
float [ ] yValues = new float [MAX]; //position og Y co-ordinate
float [ ] wd = new float [MAX] ;     //random width of rectangle
float [ ] ht = new float [MAX] ;     //random height of rectangle
float [ ] deltaX = new float [MAX] ; 
float [ ] deltaY = new float [MAX] ;
color [ ] colors = new color [MAX];


void setup ( )
{
  size ( 400, 400);
  initialize ( );      //feeding data into the array
}

void draw ( )
{
  background ( 255 );
  for ( int i = 0 ; i < MAX ; i++ )
    {
      drawfigure( i ) ;      
      movefigure ( i );
      bouncefigure( i );
      //println( deltaX[i] + "   " + deltaY[i] ) ;
    }

}

//---------------------------------------------------------------------------------

void bouncefigure(int i)
{
  if ( ( xValues[i] >= (width - wd[i])) || ( xValues[i] < (0) ) ) 
  {
    deltaX[i] = -deltaX[i] ;
  }
  
  if ( ( yValues[i] >= (height - ht[i])) || ( yValues[i] < (0 ) ) )
  {
    deltaY[i] = -deltaY[i] ;
  }  
}

//-----------------------------------------------------------------------------------

void movefigure( int i )
{
  xValues[i] = xValues[i] + deltaX[i];
  yValues[i] = yValues[i] + deltaY[i];
}

//----------------------------------------------------------------------------------

void drawfigure ( int i )
{
  noStroke( );
  fill(colors[i]);
  rect(xValues[i], yValues[i], wd[i],ht[i] ) ;
}

//-----------------------------------------------------------------------------------

void initialize ( )
{
 for ( int i = 0 ; i < MAX ; i++ )
  { 
   xValues[i] = random(0, 0.7*width);
   yValues[i] = random(0, 0.7*height) ;
   wd[i] = random(0.05*width, 0.3*width) ;
   ht[i] = random(0.05*height, 0.3*height) ;
   deltaX[i] = random ( 1 , 5 );
   deltaY[i] = random ( 1 , 5 );
   colors[i] = color( random(255), random(255), random(255) );   
  }
}

