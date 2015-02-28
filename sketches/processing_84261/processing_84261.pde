
public static int SQUARE_SIZE    = 60;

class Square
{
  private int     m_iCenterX;
  private int     m_iCenterY; 
  private boolean m_bIsHighlighted;

  public void printlol()
  {
    println(m_iCenterX + " " + m_iCenterY);
  }
  public Square(int iCenterX, int iCenterY)
  {
    m_iCenterX       = iCenterX;
    m_iCenterY       = iCenterY; 
    m_bIsHighlighted = false;
  }

  public void SetIsHighlighted(boolean bValue)
  {
    m_bIsHighlighted = bValue;
  }

  public void Draw()
  {
    strokeWeight(8);
    stroke(100);
    if (m_bIsHighlighted)
    {
      fill(30, 255, 30);
    }
    else
    {
      fill(120);
    }

    rect(m_iCenterX - SQUARE_SIZE/2, m_iCenterY - SQUARE_SIZE/2, SQUARE_SIZE, SQUARE_SIZE);
  }
}

//index to have an easy access to a given square.
public static int TOP_LEFT       = 0;
public static int TOP            = 1;
public static int TOP_RIGHT      = 2;
public static int LEFT           = 3;
public static int MID            = 4;
public static int RIGHT          = 5;
public static int DOWN_LEFT      = 6;
public static int DOWN           = 7;
public static int DOWN_RIGHT     = 8;

ArrayList<Square> m_aSquares;

//Tells if the corresponding key is being pressed or not
boolean m_bLeftKeyDown = false;
boolean m_bRightKeyDown = false;
boolean m_bTopKeyDown = false;
boolean m_bDownKeyDown = false;

void setup()
{
  size(360, 360);
  frameRate(60);

  m_aSquares = new ArrayList<Square>();
  
  //Double loop trick to have a grid disposition
  for (int y=1; y<4; y++)
  {
    for (int x=1; x<4; x++)
    {
      m_aSquares.add( new Square( (int)(x*SQUARE_SIZE*1.5f), (int)(y*SQUARE_SIZE*1.5f)) );
    }
  }
}

void keyPressed() 
{  
  if ( keyCode == UP || key == 'e' ) 
  {
    m_bTopKeyDown = true;
  } 
  if ( keyCode == DOWN || key == 'd' )
  {
    m_bDownKeyDown = true;
  }
  if ( keyCode == LEFT || key == 's' )
  {
    m_bLeftKeyDown = true;
  }
  if ( keyCode == RIGHT || key == 'f' )
  {
    m_bRightKeyDown = true;
  }
}

void keyReleased()
{
  if ( keyCode == UP || key == 'e' ) 
  {
    m_bTopKeyDown = false;
  } 
  if ( keyCode == DOWN || key == 'd' )
  {
    m_bDownKeyDown = false;
  }
  if ( keyCode == LEFT || key == 's' )
  {
    m_bLeftKeyDown = false;
  }
  if ( keyCode == RIGHT || key == 'f' )
  {
    m_bRightKeyDown = false;
  }
}

void draw()
{
  for (int i=0; i<m_aSquares.size(); i++ )
  {
    m_aSquares.get(i).SetIsHighlighted(false);
  }

  //Some boolean logic to highlight the correct squares, according to the pressed keys.
  m_aSquares.get(MID).SetIsHighlighted(!m_bRightKeyDown && !m_bLeftKeyDown && ! m_bTopKeyDown && !m_bDownKeyDown);
  
  m_aSquares.get(LEFT).SetIsHighlighted(m_bLeftKeyDown );
  m_aSquares.get(RIGHT).SetIsHighlighted(m_bRightKeyDown );
  m_aSquares.get(TOP).SetIsHighlighted(m_bTopKeyDown  );
  m_aSquares.get(DOWN).SetIsHighlighted(m_bDownKeyDown); 
  
  m_aSquares.get(DOWN_LEFT).SetIsHighlighted(m_bLeftKeyDown && m_bDownKeyDown); 
  m_aSquares.get(DOWN_RIGHT).SetIsHighlighted(m_bRightKeyDown && m_bDownKeyDown); 
  m_aSquares.get(TOP_LEFT).SetIsHighlighted(m_bLeftKeyDown && m_bTopKeyDown); 
  m_aSquares.get(TOP_RIGHT).SetIsHighlighted(m_bRightKeyDown && m_bTopKeyDown); 
  
  for (int i=0; i<m_aSquares.size(); i++ )
  {
    m_aSquares.get(i).Draw();
  }
}



