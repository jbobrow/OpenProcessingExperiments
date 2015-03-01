
int counter;
PImage img = createImage( 512, 512, ARGB );
int p = 1;
int q = 1;
 
float r = 1;
float s = 1;
float step = 0.1;
 
void setup( )
{
  size( 512, 512 );
}
 
void draw( )
{
  int j = 0;
  for ( int i = 0; i < 512 * 512; i++ )
    img.pixels[ i ] = 0;
  
  for ( int x = 0; x < 512; x++ )
  {
    for ( int y = 0; y < 512; y++ )
    {
      if ( img.pixels[ y * 512 + x ] != 0 )
        continue;
         
      color c = color( j );
      int xx = x, yy = y;
   
      for( ;; )
      {
        img.pixels[ y * 512 + x ] = c;
        x += ( int )( r * ( y - 256 ) );
        x &= 0x1ff;
        y -= ( int )( s * ( x - 256 ) );
        y &= 0x1ff;
         
        if ( x == xx && y == yy )
          break;
      }
       
      j = ( j + 1 ) & 255;
    }
  }
  img.updatePixels( );
  image( img,0,0,img.width,img.height );
   
}
 
void keyPressed( )
{
  if ( keyCode == UP    ) r += step;
  if ( keyCode == DOWN  ) r -= step;
   
  if ( keyCode == LEFT  ) s -= step;
  if ( keyCode == RIGHT ) s += step;
    
  if ( key == ' ' ) { r = 1.0; s = 1.0; }
  
  if ( key == '+' ) step *= 2.0;
  if ( key == '-' ) step /= 2.0;
   
  print( "r = " ); print( r ); print( " " );
  print( "s = " ); print( s ); print( "\n" );
}

