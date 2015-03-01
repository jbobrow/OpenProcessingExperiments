

void setup( )
{
   size( 600, 600, OPENGL); 
   background( 0 );
   translate( 300, 300, 0 );
   rotateY( radians( 30 ) );
   rotateX( radians( 20 ) );
   lights( );
   stroke( 255 );
   //fill( 255, 10 );
   noFill( );
   box( 200 );
   fill( 255, 0, 0 );
   sphere( 50 );
}


