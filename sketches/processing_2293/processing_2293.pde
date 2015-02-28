
class SquareManager
{
  private int[] m_cxList;
  private int[] m_cyList;
  private int[] m_sizeList;
  private int m_count;
  private int m_capacity;

  // ------------------------------ public  methods
  public SquareManager()
  {
    m_count = 0;
    m_capacity = 1;
    m_cxList = new int[m_count];
    m_cyList = new int[m_count];
    m_sizeList = new int[ m_count ];

  }


  public boolean createSquare(int cx, int cy, int s)
  {
    // Check to see is if the passed square intersects with a saved square
    if( ! findIntersection(cx, cy, s) )
    {
      // No intersection so draw the square
      rect( cx - (s/2), cy - (s/2), s, s );

      // Save the square in array
      saveSquare( cx, cy, s );

      return true;
    }

    return false;
  }



  private boolean rectIntersect( int left1, int right1, int top1, int bottom1, int left2, int right2, int top2, int bottom2 )
  {
    return ! ((left2 > right1) || ( right2 < left1) || (top2 > bottom1) || (bottom2  < top1 ) );
  }

  // ------------------------------ private methods
  private boolean findIntersection( int cx, int cy, int s) 
  {
    boolean ret = false;
    
    // Loop through all the squares that are saved in the array, and perform
    // a rectangle intersection algorithm
    for ( int i = 0; i < m_count; i++ )
    {
      // Get the target data
      int tx = m_cxList[ i ];
      int ty = m_cyList[ i ];
      int ts = m_sizeList[ i ];

      // Rect One
      int left1 = tx - (ts/2);
      int right1 = tx + (ts/2);
      int top1 = ty - (ts/2);
      int bottom1 = ty + (ts/2);

      // Rect Two
      int left2 = cx - (s/2);
      int right2 = cx + (s/2);
      int top2 = cy - (s/2);
      int bottom2 = cy + (s/2);
      
      
      // Perform an OR check against all the sides
      if ( rectIntersect(left1, right1, top1, bottom1, left2, right2, top2, bottom2) )
      {

        return true;
      }


    }

    return ret;
  }

  private void saveSquare( int cx, int cy, int s )
  {
    m_count++;
    
    // If more memory is required to be allocated, double the array capacity
    if ( m_count == m_capacity)
    {
       m_cxList = expand( m_cxList, m_capacity * 2);
       m_cyList = expand( m_cyList, m_capacity * 2);
       m_sizeList = expand( m_sizeList, m_capacity * 2 );
       
      m_capacity *= 2;
    }
    
    // Save the square data
    m_cxList[m_count - 1] = cx;
    m_cyList[m_count - 1] = cy;
    m_sizeList[ m_count - 1] = s;
    
  }

}



