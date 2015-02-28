
int counter;
color strokeA, strokeB;
 
void setup()
{ 
  size(250, 250);
  strokeA = color( random( 255 ), random( 255 ), random( 255 ) );
  strokeB = color( random( 255 ), random( 255 ), random( 255 ) ); 
  strokeWeight( 5 );
}
 
void draw()
{ 
    fill( 0, 20 );
    rect( 0, 0, width, height );
    translate( width/2, height/2);
    rotate( radians( frameCount) );
    stroke( strokeA );
    line( 0, 0, 100, 100 );
    stroke( strokeB );
    line( 0, 0, -100, -100 );
}
