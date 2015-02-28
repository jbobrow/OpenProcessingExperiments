
/* 
Travis Berk
9/2/2011
*/
/**
 *	Color Creator Class.  Used to select colors for the objects.
 */
class ColorCreator
{
  final int COLOR_RED       = 1; /**< ID value of red. */
  final int COLOR_GREEN     = 2; /**< ID value of green. */
  final int COLOR_BLUE      = 3; /**< ID value of blue. */
  final int COLOR_YELLOW    = 4; /**< ID value of yellow. */
  final int COLOR_LIGHTBLUE = 5; /**< ID value of lightblue. */
  final int COLOR_PURPLE    = 6; /**< ID value of purple. */
  final int COLOR_ORANGE    = 7; /**< ID value of orange. */
  int[] colorsTaken = new int[4]; /**< Array the holds the ID's of colors that are taken. */
  /**
   * Constructor.
   * Sets the colorsTaken array to default.
   */
  ColorCreator(){
    for(int i = 0; i < 4; i++)
    {
        colorsTaken[i] = 0;
    }
  }
  /**
   * Function returning an integer value.
   * @see colorChooser(int c)
   * @return ID for a color
   */
  int colorChooser()
  {
    int r = 0;
    boolean repeat = false;
    while(!repeat)
    {
      r = int(random(1, 8));
      for(int i = 0; i < 4; i++)
      {
        if(r == colorsTaken[i])
        {
          repeat = false;
          break;
        }
        else
          repeat = true;
      }
    }
    for(int i = 0; i < 4; i++)
    {
      if(colorsTaken[i] == 0)
      {
        colorsTaken[i] = r;
        
        break;
      }
    }

    return r;
  }
  /**
   * Function returning an integer value.
   * @param c ID value that is already being used.
   * @see colorChooser()
   * @return ID for a color
   */
  int colorChooser(int c)
  {
    if(colorsTaken[0] != c)
    {
      colorsTaken[0] = c;
    }
    int r = 0;
    boolean repeat = false;
    while(!repeat)
    {
      r = int(random(1, 8));
      for(int i = 0; i < 4; i++)
      {
        if(r == colorsTaken[i])
        {
          repeat = false;
          break;
        }
        else
          repeat = true;
      }
    }
    for(int i = 0; i < 4; i++)
    {
      if(colorsTaken[i] == 0)
      {
        colorsTaken[i] = r;
        
        break;
      }
    }
    
    return r;
  }
  /**
   * Sets the color arrays.
   */
  void createColors()
  {
    globalValues.rColor[0] = 255;
    globalValues.rColor[1] = 0;
    globalValues.rColor[2] = 0;
    
    globalValues.gColor[0] = 0;
    globalValues.gColor[1] = 255;
    globalValues.gColor[2] = 0;
    
    globalValues.bColor[0] = 0;
    globalValues.bColor[1] = 0;
    globalValues.bColor[2] = 255;
    
    globalValues.yColor[0] = 255;
    globalValues.yColor[1] = 255;
    globalValues.yColor[2] = 0;
    
    globalValues.nbColor[0] = 0;
    globalValues.nbColor[1] = 255;
    globalValues.nbColor[2] = 255;
    
    globalValues.oColor[0] = 255;
    globalValues.oColor[1] = 175;
    globalValues.oColor[2] = 0;
    
    globalValues.pColor[0] = 255;
    globalValues.pColor[1] = 0;
    globalValues.pColor[2] = 255;
  }
}

