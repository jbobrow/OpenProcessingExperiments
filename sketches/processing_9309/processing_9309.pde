
/*
  CLASS FOR MY FACETED OBJECTS
*/
class facetedObjects {
  
  // Arrays for Type, Size and Color of the objects
  String[] Type = new String[1];
  float[] Size = new float[1];
  color[] Color = new color[1];
  
  // Arrays for the position
  // Pos[][] ... last/current position of the Object
  // nPos[][] ... future position
  float[][] Pos;
  float[][] nPos;
  
  // modes ... 1-4
  int[] Mode = new int[1];
  
  // other stuff
  int index;
  boolean started;
  
  
  /*
    CONSTRUCTOR
    
    just initiating some important things
  */
  facetedObjects () {
    index = 0;
    started = false;
    Type[index] = "";
    Size[index] = 0;
    Color[index] = color (0);
    Mode[index] = 1;
  }

  
  /*
    ADDING DATA
    
    expanding the arrays for the information of the objects
  */
  void addData ( String nType, float nSize, color nColor ) {
    if ( started ) {
      Type = append ( Type, nType );
      Size = append ( Size, nSize );
      Color = append ( Color, nColor );
      Mode = append ( Mode, 1 );
      index++;
    }
    else {
      Type[index] = nType;
      Size[index] = nSize;
      Color[index] = nColor;
      started = true;
    }
  }
  
  /*
    ANALYSE
  
  mode 1-4
  4 ... get it ... activated
  3 ... throw it away ... deactivated
  2 ... active
  1 ... inactive
  
  */
  void analyse ( int i ) {
    // some intern variables for temp-storage
    int mode = 1;
    boolean mode_color = false;
    boolean mode_type = false;
    boolean mode_size = false;
    
    /*
    three question-types: color, type, size
    - checking which buttons are selected
    - setting facet-mode to true if something is done here
    */
    if( key_color == "none" 
    || ( key_color == "rot" && red(this.Color[i]) > 150 
    || key_color == "gruen" && green(this.Color[i]) > 150 
    || key_color == "blau" && blue(this.Color[i]) > 150 ) )
      mode_color = true;
      
    if( key_type == "none" 
    || ( key_type == "eckig" && this.Type[i] == "square"
    || key_type == "rund" && this.Type[i] == "circle" ) )
      mode_type = true;

    if( key_size == "none" 
    || ( key_size == "klein" && this.Size[i] < 10 
    || key_size == "gross" && this.Size[i] > 10 ) )
      mode_size = true;
    
    // if everything is set to "all" ... set temp-mode to active (2)
    // else if this object is interesting considering all three facets ... set it temp. to active (2)
    if( key_color == "none" && key_type == "none" && key_size == "none" )
      mode = 2;
    else if( mode_color && mode_type && mode_size 
        && ( key_color != "none" || key_type != "none" || key_size != "none" ) )
      mode = 2;
    
    // if object was inactive (1) and temp-mode says it is active (2) => activate (4)
    // else if .. the other way round ... => deactivate (3)
    if( this.Mode[i] == 1 && mode == 2 ) { // get it / activated
      mode = 4;
    }
    else if( this.Mode[i] == 2 && mode == 1 ) { // throw it away / deactivated
      mode = 3;
    }
    
    // saves mode
    this.Mode[i] = mode;
  }
  
  
  /*
    CALCULATES POSITION

    - old/current position = new position
      ... because the animation is done
      ... the old one is unused
      ... the current nPos is now used and so it its the real current Position
  
    - getting the real new position considering the mode of the object
  
    modes 1-4
    1  index from the outside position array
    2  lowest unused index from the inside position array
    3  index from the outside position array  
    4  lowest unused index from the inside position array
  */
  void calcPos ( int i ) {
    // setting new position to current
    Objects.Pos[i][0] = Objects.nPos[i][0];
    Objects.Pos[i][1] = Objects.nPos[i][1];
    
    // general temp-saving
    int mode = Objects.Mode[i];
    float x = 0;
    float y = 0;
    
    // considering the modes ... setting the new position
    switch ( mode ) {
      case ( 1 ): // mode 1 ... inactive
        x = oPos[i][0];
        y = oPos[i][1];
        break;
      case ( 2 ): // mode 2 ... active
        // lowest unused inside position
        x = iPos[activeIndex][0];
        y = iPos[activeIndex][1];
        activeIndex++;
        break;
      case ( 3 ): // mode 3 ... deactivated
        x = oPos[i][0];
        y = oPos[i][1];
        break;
      case ( 4 ): // mode 4 ... activated
        // lowest unused inside position
        x = iPos[activeIndex][0];
        y = iPos[activeIndex][1];
        activeIndex++;
        break;
    }
    
    // saving the new position
    Objects.nPos[i][0] = x;
    Objects.nPos[i][1] = y;
  }
}

