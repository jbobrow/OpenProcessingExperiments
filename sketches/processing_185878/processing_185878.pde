
// Constants instead of enum because processing doesn't support it
private static final int CELL_STATE_Empty = 0;
private static final int CELL_STATE_Born = 1;
private static final int CELL_STATE_Alive = 2;
private static final int CELL_STATE_Dead = 3;

// Properties that can be modified
private static final int ms_nEmptyColor = 0;
private static final int ms_nBornColor = 255;
private static final int ms_nAliveColor = 255;
private static final int ms_nDeadColor = 0;

private static final float ms_fTimeStep = 1000.0f / 30.0f; // 30fps
private static final int ms_nWorldWidth = 600;
private static final int ms_nWorldHeight = 600;
private static final float ms_nInitialAliveCellPercent = 0.0f;
private static final float ms_nRandomChangePercent = 0.4f;

// Private attributes
private int[][][] m_vecWorld;
private int m_nPreviousWorld;
private int m_nCurrentWorld;

private float m_fPreviousTime = 0.0f;
private float m_fWorldTimer = 0.0f;

public void setup()
{
  size(600, 600);
  
  m_vecWorld = new int[2][ms_nWorldWidth + 2][ms_nWorldHeight + 2];
  m_nPreviousWorld = 0;
  m_nCurrentWorld = 1;

  loadPixels();
  
  for( int i = 0; i < ms_nWorldWidth + 2; ++i )
  {
  for( int j = 0; j < ms_nWorldHeight + 2; ++j )
  {
    m_vecWorld[m_nCurrentWorld][i][j] = random(100) > ms_nInitialAliveCellPercent ? CELL_STATE_Dead : CELL_STATE_Alive;
    
    if( i > 0 && i < ms_nWorldWidth + 1 && j > 0 && j < ms_nWorldHeight + 1 )
    {
    pixels[ ( i - 1 ) + ( j - 1 ) * width ] = m_vecWorld[m_nCurrentWorld][ i - 1 ][ j - 1 ] == CELL_STATE_Dead ? color( ms_nDeadColor ) : color( ms_nAliveColor );
    }
  }
  }
  
  updatePixels();
}

public void draw()
{
  float fTime = millis();
  m_fWorldTimer += fTime - m_fPreviousTime;
  
  if( m_fWorldTimer > ms_fTimeStep )
  {
  if( !mousePressed )
  {
    updateWorld();
  }
  m_fWorldTimer = 0;
  }
  
  m_fPreviousTime = fTime;
}

private void updateWorld()
{
  m_nPreviousWorld = m_nCurrentWorld;
  m_nCurrentWorld = 1 - m_nCurrentWorld;

  copyExtremityCells(m_nPreviousWorld);
  loadPixels();
  
  int x, y, nSum;
  float rand;
  
  for( int i = 0; i < ms_nWorldWidth; ++i )
  {
  for( int j = 0; j < ms_nWorldHeight; ++j )
  {
    x = i + 1;
    y = j + 1;
    nSum = getNeighbourhoodAliveCellsCount( m_nPreviousWorld, x, y );
    rand = random(100);
    
    if( rand < ms_nRandomChangePercent )
    {
      if( rand < ms_nRandomChangePercent * 0.5f )
      {
        m_vecWorld[m_nCurrentWorld][x][y] = ( m_vecWorld[m_nPreviousWorld][x][y] + 1 ) % 4;
      }
      else
      {
        m_vecWorld[m_nCurrentWorld][x][y] = ( m_vecWorld[m_nPreviousWorld][x][y] - 1 ) % 4;
      }
    }
    else if( m_vecWorld[m_nPreviousWorld][x][y] == CELL_STATE_Alive || m_vecWorld[m_nPreviousWorld][x][y] == CELL_STATE_Born )
    {
    if (nSum < 2 || nSum > 3)
    {
      m_vecWorld[m_nCurrentWorld][x][y] = CELL_STATE_Dead;
    }
    else
    {
      m_vecWorld[m_nCurrentWorld][x][y] = CELL_STATE_Alive;
    }
    }
    else
    {
    if (nSum == 3)
    {
      m_vecWorld[m_nCurrentWorld][x][y] = CELL_STATE_Born;
    }
    else
    {
      m_vecWorld[m_nCurrentWorld][x][y] = CELL_STATE_Empty;
    }
    }
    
    setPixelColor( m_nCurrentWorld, i, j, m_vecWorld[m_nCurrentWorld][x][y] );
  }
  }
  
  updatePixels();
}

private void copyExtremityCells( int nWorld )
{
  for( int i = 0; i < ms_nWorldWidth + 2; ++i )
  {
  m_vecWorld[nWorld][i][0] = m_vecWorld[nWorld][i][ms_nWorldHeight];
  m_vecWorld[nWorld][i][ms_nWorldHeight + 1] = m_vecWorld[nWorld][i][1];
  }
  
  for( int i = 0; i < ms_nWorldHeight + 2; ++i )
  {
  m_vecWorld[nWorld][0][i] = m_vecWorld[nWorld][ms_nWorldWidth][i];
  m_vecWorld[nWorld][ms_nWorldWidth + 1][i] = m_vecWorld[nWorld][1][i];
  }
}

private int getNeighbourhoodAliveCellsCount( int nWorld, int x, int y )
{
  int nSum = 0;
  
  for( int i = -1; i <= 1; ++i )
  {
  for( int j = -1; j <= 1; ++j )
  {
    if( !(i == 0 && j == 0) && ( m_vecWorld[nWorld][ x + i ][ y + j ] == CELL_STATE_Alive || m_vecWorld[nWorld][ x + i ][ y + j ] == CELL_STATE_Born ) )
    {
    nSum++;
    }
  }
  }
  
  return nSum;
}

private void setPixelColor( int nWorld, int x, int y, int nCellState )
{
  if( x < width && y < height )
  {
    switch( nCellState )
    {
      case CELL_STATE_Empty: pixels[ x + y * width ] = color( ms_nEmptyColor ); break;
      case CELL_STATE_Born:  pixels[ x + y * width ] = color( ms_nBornColor );  break;
      case CELL_STATE_Alive: pixels[ x + y * width ] = color( ms_nAliveColor ); break;
      case CELL_STATE_Dead:  pixels[ x + y * width ] = color( ms_nDeadColor );  break;
    }
  }
}


