
// Lauren Hartman
// lmhartma@andrew.cmu.edu
// copyright Lauren Hartman Nov 2013

final int MAX = 20;

int [ ] x, y, edge, dX, dY;

void setup( )
{
  size( 400, 400 );
  background (0);
  x = new int[ MAX ]; 
  y = new int[ MAX ]; 
  edge = new int[ MAX ]; 
  dX = new int[ MAX ]; 
  dY = new int[ MAX ]; 
  
  x = initInt( 0, width );
  y = initInt( 0, height );
  edge = initInt( 30, 100 );
  dX = initInt( 2, 100 );
  dY = initInt( 2, 100 );
}

void draw( )
{
   fill(0, 124);
   noStroke();
   rect( 0, 0, width, height );
   drawCircle( );
   moveCircle( );
   
   println(frameRate);
}

void moveCircle( )
{
     for ( int i = 0; i < x.length; i++)
  {
    x[ i ] += dX[ i ];
    y[ i ] += dY[ i ];  
  }  
}

void drawCircle( )
{
   for ( int i = 0; i < x.length; i++)
  {
     stroke( 90, 180, 180 );
     strokeWeight(3);
     ellipse( x[i]%width, y[i]%height, edge[i], edge[i]);
     noFill();
     frameRate (10);
  } 
}

int[ ] initInt( int low, int high )
{
   int [ ] temp = new int[ MAX ];
   for (int i = 0; i <  temp.length; i++)
   {
      temp[ i ] = int(random( low, high ) ); 
   }
   return temp;
}
