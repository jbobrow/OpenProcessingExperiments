
public final static int numCols    = 23;
public final static int numRows    = 23;

public final static float colWidth  = 16;
public final static float rowHeight = 16;

public final static int tileCount = 512;

int tile[][] = new int[ numCols ][ numRows ];

float getPx( int row, int col, int p, int q )
{
  return ( col + ( float )q / 2.0 ) * colWidth; 
}

float getPy( int row, int col, int p, int q )
{
  return ( row + ( float )p / 2.0 ) * rowHeight;
}

final int BLANK = 0;
final int N     = 0;
final int NE    = 1;
final int E     = 2;
final int SE    = 3;
final int S     = 4;
final int SW    = 5;
final int W     = 6;
final int NW    = 7;
final int BLOB  = 8;

void drawTile( int row, int col, int type )
{
  float p00x = getPx( row, col, 0, 0 );
  float p00y = getPy( row, col, 0, 0 );
  float p01x = getPx( row, col, 0, 1 );
  float p01y = getPy( row, col, 0, 1 );
  float p02x = getPx( row, col, 0, 2 );
  float p02y = getPy( row, col, 0, 2 );
  float p10x = getPx( row, col, 1, 0 );
  float p10y = getPy( row, col, 1, 0 );
  float p11x = getPx( row, col, 1, 1 );
  float p11y = getPy( row, col, 1, 1 );
  float p12x = getPx( row, col, 1, 2 );
  float p12y = getPy( row, col, 1, 2 );
  float p20x = getPx( row, col, 2, 0 );
  float p20y = getPy( row, col, 2, 0 );
  float p21x = getPx( row, col, 2, 1 );
  float p21y = getPy( row, col, 2, 1 );
  float p22x = getPx( row, col, 2, 2 );
  float p22y = getPy( row, col, 2, 2 );
  
  fill( 0 ); 
  
  if ( ( type & ( 1 << BLOB ) )!= 0 )
  {
    noStroke();
    ellipse( p11x, p11y, colWidth / 2.0, rowHeight / 2.0 );  
  }
  
  strokeWeight( rowHeight / 8.0 );
  stroke( 0 ); 
    
  if ( ( type & ( 1 << N ) ) != 0 )
    line( p01x, p01y, p11x, p11y );
   
  if ( ( type & ( 1 << NE ) ) != 0 )
    line( p02x, p02y, p11x, p11y );
   
  if ( ( type & ( 1 << E ) ) != 0 )
    line( p12x, p12y, p11x, p11y );
  
  if ( ( type & ( 1 << SE ) ) != 0 )
    line( p22x, p22y, p11x, p11y );
  
  if ( ( type & ( 1 << S ) ) != 0 )
    line( p21x, p21y, p11x, p11y );
  
  if ( ( type & ( 1 << SW ) ) != 0 )
    line( p20x, p20y, p11x, p11y );
  
  if ( ( type & ( 1 << W ) ) != 0 )
    line( p10x, p10y, p11x, p11y );
  
  if ( ( type & ( 1 << NW ) ) != 0 )
    line( p00x, p00y, p11x, p11y );
  
  tile[ row ][ col ] = type; 
}

void fillRandom()
{
  for ( int row = 0; row < numRows; row++ )
  {
    for ( int col = 0; col < numCols; col++ )
    {
      int t = ( int )random( tileCount );
      
      tile[ row ][ col ] = t;
    }
  }
}

void fillTiles( int n )
{
  for ( int row = 0; row < numRows; row++ )
  {
    for ( int col = 0; col < numCols; col++ )
    {
      int t = ( int )random( tileCount );
      
      tile[ row ][ col ] = n;
    }
  }
}

int state = 0;

void setup()
{
  state = 0;
  size( ( int )( numCols * colWidth ), ( int )( numRows * rowHeight ), P2D );
  fillTiles( BLANK );
}


int thisRow;
int thisCol;

int nextRow;
int nextCol;

int dir;

void draw()
{
  background( 255 );
  //noStroke();
  for ( int row = 0; row < numRows; row++ )
  {
    for ( int col = 0; col < numCols; col++ )
    {
      drawTile( row, col, tile[ row ][ col ] );
    }
  }
  
  switch( state )
  {
    case 0:
    {
     thisRow = ( int )random( numRows );
     thisCol = ( int )random( numCols );
     dir = ( int )random( 8 ); 
     if ( tile[ thisRow ][ thisCol ] == 0 )
       state = 1;
     break;
    }
    case 1 :
    {
      switch( dir )
      {
        case N :
        {
          nextRow = thisRow - 1;
          nextCol = thisCol;
          break;
        }
        case NE :
        {
          nextRow = thisRow - 1;
          nextCol = thisCol + 1;
          break;
        }
        case E :
        {
          nextRow = thisRow;
          nextCol = thisCol + 1;
          break;
        }
        case SE :
        {
          nextRow = thisRow + 1;
          nextCol = thisCol + 1;
          break;
        }
        case S :
        {
          nextRow = thisRow + 1;
          nextCol = thisCol;
          break;
        }
        case SW :
        {
          nextRow = thisRow + 1;
          nextCol = thisCol - 1;
          break;
        }
        case W :
        {
          nextRow = thisRow;
          nextCol = thisCol - 1;
          break;
        }
        case NW :
        {
          nextRow = thisRow - 1;
          nextCol = thisCol - 1;
          break;
        }
      }
      
      if ( nextRow < 0 || nextRow >= numRows ||
           nextCol < 0 || nextCol >= numCols )
      {
        state = 0;
        break;
      }
      
      if ( tile[ nextRow ][ nextCol ] != BLANK )
      {
        state = 0;
        break;
      }
      
      if ( dir == NE && ( tile[ thisRow - 1 ][ thisCol ] != BLANK || tile[ thisRow ][ thisCol + 1 ] != BLANK ) )
      {
        state = 0;
        break;
      }
      
      if ( dir == SW && ( tile[ thisRow + 1 ][ thisCol ] != BLANK || tile[ thisRow ][ thisCol - 1 ] != BLANK ) )
      {
        state = 0;
        break;
      }
      
      if ( dir == NW && ( tile[ thisRow - 1 ][ thisCol ] != BLANK || tile[ thisRow ][ thisCol - 1 ] != BLANK ) )
      {
        state = 0;
        break;
      }
      
      if ( dir == SE && ( tile[ thisRow + 1 ][ thisCol ] != BLANK || tile[ thisRow ][ thisCol + 1 ] != BLANK ) )
      {
        state = 0;
        break;
      }
      switch( dir )
      {
        default :
        {
          if ( tile[ thisRow ][ thisCol ] == BLANK )
          {
            drawTile( thisRow, thisCol, ( 1 << BLOB ) | ( 1 << dir ) );
            drawTile( nextRow, nextCol, ( 1 << BLOB ) | ( 1 << ( ( dir + 4 ) & 7 ) ) );
          }
          else
          {
            tile[ thisRow ][ thisCol ] &= ~( 1 << BLOB );
            drawTile( thisRow, thisCol, tile[ thisRow ][ thisCol ] | ( 1 << dir ) );
            drawTile( nextRow, nextCol, ( 1 << BLOB ) | ( 1 << ( ( dir + 4 ) & 7 ) ) );
          }
          break;
        }
      }
      thisRow = nextRow;
      thisCol = nextCol;
    }
  }
}

void mousePressed()
{
  setup();
}

void keyPressed()
{
  setup();
}
