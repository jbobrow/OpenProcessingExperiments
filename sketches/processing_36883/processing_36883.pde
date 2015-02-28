
int[][] pos = new int[ 2 ][ 320 ];

int v1;
int p1;

int v2;
int p2;

int want = 0;

class bead_t
{
  bead_t( float vx0, float vy0, float px0, float py0, color c0 )
  {
    vx = vx0;
    vy = vy0;
    px = px0;
    py = py0;
    c  = c0;
    follow = 0;
  }
  float vx, vy, px, py;
  color c;
  
  int follow = 0;
  
  void draw( )
  {
    fill( c );
    stroke( 0, 127 );
    strokeWeight( 6 );
    ellipse( px, py, 20, 20 );
  }
}

bead_t[] bead = new bead_t[ 6 ];

void setup( )
{
  size( 240, 320 );
  smooth();
 
  p1 = -23200;  
  v1= 0;
  
  p2 = 23200;  
  v2 = 0;
  
  for ( int i = 0; i < 320; i++ )
    pos[ 0 ][ i ] = ( p1 / 512 ) + 75;
    
  for ( int i = 0; i < 320; i++ )
    pos[ 1 ][ i ] = ( p2 / 512 ) + 165;
  
  for ( int i = 0; i < bead.length; i++ )
    bead[ i ] = new bead_t( 0.0, -1.5, ( p1 / 256 ) + 120, i * 20, color( i%3 == 0 ? 255 : 0, i%3 == 1 ? 255 : 0, i%3 == 2 ? 255 : 0 ) );
    
}

void moveview( )
{
  while ( bead[ 0 ].py > 40 )
  {
    for ( int i = 1; i < 320; i++ )
    {
      pos[ 0 ][ i - 1 ] = pos[ 0 ][ i ];
      pos[ 1 ][ i - 1 ] = pos[ 1 ][ i ];
    }
    
    p1 = p1 + v1;
    v1 = v1 - ( ( p1 ) / 2048 );
    pos[ 0 ][ 319 ] = ( p1 / 512 ) + 75;
    
    p2 = p2 + v2;
    v2 = v2 - ( ( p2 ) / 2048 );
    pos[ 1 ][ 319 ] = ( p2 / 512 ) + 165;
    
    for ( int j = 0; j < bead.length; j++ )
      bead[ j ].py--;
  }
}



void draw_wire( )
{
  stroke( 255 );
  strokeWeight( 4 );
  for ( int y = 0; y < 320; y++ )
    rect( pos[ 0 ][ y ], y, 1, 1 );
    
  stroke( 0 );
  for ( int y = 0; y < 320; y++ )
    rect( pos[ 1 ][ y ], y, 1, 1 );
}

void draw( )
{
  background( 100 );
  
  moveview( );
  
  for ( int i = 0; i < bead.length; i++ )
  {
    if ( want != bead[ i ].follow && abs( pos[ 0 ][ ( int )bead[ i ].py ] - pos[ 1 ][ ( int )bead[ i ].py ] ) < 2 )
      bead[ i ].follow = want;
    bead[ i ].px = pos[ bead[ i ].follow ][ ( int )bead[ i ].py ];
    bead[ i ].py -= bead[ i ].vy; 
  }
  
  draw_wire( );
  for ( int i = 0; i < bead.length; i++ )
    bead[ i ].draw( );
}

void keyPressed( )
{
  if ( keyCode == LEFT )
    want = 0;
    
  if ( keyCode == RIGHT )
    want = 1;
}

