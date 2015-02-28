
PImage img;
int p = 1;
int q = 1;
 
float r = 1.0;
float s = 1.0;
float step = 0.1;
float sheer = 1.0;

int dim = 512;
int offs = 256;

float cmul = 1.0;
 
void setup( )
{
  size( 512, 512 );
  img = createImage( dim, dim, ARGB );
}
 
void draw( )
{
  if ( dim != img.width )
  {
    img = createImage( dim, dim, ARGB );
    offs = dim / 2;
  }
  
  int j = 0;
  for ( int i = 0; i < img.width * img.height; i++ )
    img.pixels[ i ] = 0;
  
  for ( int x = 0; x < img.width; x++ )
  {
    for ( int y = 0; y < img.height; y++ )
    {
      if ( img.pixels[ y * img.width + ( ( ( x + ( int )( ( y - img.height / 2 ) * sheer ) ) ) & ( img.width - 1 ) ) ] != 0 )
        continue;

      int xx = x, yy = y;
   
      for( ;; )
      {
        img.pixels[ y * img.width + ( ( ( x + ( int )( ( y - img.height / 2 ) * sheer ) ) ) & ( img.width - 1 ) ) ] = j;
        x += ( int )( r * ( y - offs ) );
        x &= ( img.width - 1 );
        y -= ( int )( s * ( x - offs ) );
        y &= ( img.height - 1 );
         
        if ( x == xx && y == yy )
          break;
      }     
      j++;
    }
  }
  for ( int i = 0; i < img.width * img.height; i++ )
    img.pixels[ i ] = color( ( ( int ) ( ( cmul * img.pixels[ i ] * 255 ) / j ) ) & 255 );
  img.updatePixels( );
  image( img,0,0,512,512 );
   
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
  
  if ( key == 'q' && dim < 4096 ) dim *= 2;
  if ( key == 'w' && dim > 1   ) dim /= 2;
  
  if ( key == 'o' && cmul < 65536.0 * 65536.0  ) cmul *= sqrt( sqrt( 2.0 ) );
  if ( key == 'p' && cmul > 0.001   )  cmul /= sqrt( sqrt( 2.0 ) );
  
  if ( key == 'm' ) sheer += 0.1;
  if ( key == 'n' ) sheer -= 0.1;
   
  print( "r = " ); print( r ); print( " " );
  print( "s = " ); print( s ); print( "\n" );
}


