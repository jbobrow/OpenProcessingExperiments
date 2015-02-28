
class TickedLine
{
  // cosmetic variables
  int lineThickness;
  int tickThickness;
  color lineColor;
  color tickColor;

  // instance variables
  int xStart;
  int yStart;
  int xFinish;
  int yFinish;
  int distanceBetweenTicks;
  boolean hasStart;
  boolean hasFinish;
  boolean drawLine;
  boolean drawTicks;
  
  // label variables
  boolean drawLabels;
  boolean drawFirstUnitLable;
  PFont labelFont;
  float labelDisplacement;
  float labelMultiple;
  color labelColor;

  // default constructor //////////////
  TickedLine()
  {
    distanceBetweenTicks = 40;
    drawLine = true;
    drawTicks = true;
    lineThickness = 1;
    tickThickness = 20;
    lineColor = color( 127 );
    tickColor = color( 0 );
    labelFont = createFont( "Arial", 10 );
    labelColor = color( 255 );
    drawLabels = true;
    labelDisplacement = 0;
    labelMultiple = 1;
  }
  
  // custom constructor ///////////////
  TickedLine( int x1, int y1, int x2, int y2, int distanceBetweenTicks )
  {
    xStart = x1;
    yStart = y1;
    xFinish = x2;
    yFinish = x2;
    distanceBetweenTicks = distanceBetweenTicks;
    drawLine = true;
    drawTicks = true;
    lineThickness = 1;
    tickThickness = 20;
    lineColor = color( 127 );
    tickColor = color( 0 );
    labelFont = createFont( "Arial", 10 );
    labelColor = color( 255 );
    drawLabels = true;
    labelDisplacement = 0;
    labelMultiple = 1;
  }

  void updatePosition( int xPosition, int yPosition )
  {
    if ( hasStart )
    {
      // if we're in need of a finish point, 
      // update the finish position with the mouse
      // so we can see where the heck we are
      if ( !hasFinish )
      {
        xFinish = xPosition;
        yFinish = yPosition;
      } 
    }
  }

  void setPoint( int xPosition, int yPosition )
  {
    if( hasStart )
    {  
      if( hasFinish )
      {
        // if we have a start point and an end point,
        // then a call to setPoint signifies that 
        // the user wants to start again with a new start point.
        xStart = xPosition;
        yStart = yPosition;
        // reset the finish, too, 
        // so that it starts redrawing
        // from the newly clicked position, 
        // not the last position
        xFinish = xPosition;
        yFinish = yPosition;
        // a fresh set of booleans
        hasStart = true;
        hasFinish = false;
      }
      else
      {
        // if we have a start but no finish,
        // then update the finish point
        xFinish = xPosition;
        yFinish = yPosition;
        // seal the line off at the end 
        // so it doesn't move around with the mouse
        hasFinish = true;        
      }
    }
    else
    {
      // if we have neither start nor finish, then we must
      // be in the first few microseconds of the program,
      // so set the start point and the finish point 
      // to be the mouse point.
      xStart = xPosition;
      yStart = yPosition;
      xFinish = xPosition;
      yFinish = yPosition;
      hasStart = true; // now we have an initial value
    }
  }
  void updateAppearance()
  {
    if ( hasStart )
    {
      if( drawLine )
      {
        strokeWeight( lineThickness );
        stroke( lineColor );
        line( xStart, yStart, xFinish, yFinish );
      }
      if( drawTicks )
      {
        strokeWeight( tickThickness );
        stroke( tickColor );
        fill( labelColor );
        drawTicks();
      }
    }  
  }

  void drawTicks()
  {
    float changeInY = yFinish - yStart;    
    float changeInX = xFinish - xStart;
    float lineDistance = dist( xStart, yStart, xFinish, yFinish );
    int numberOfSubdivisions = floor( lineDistance / distanceBetweenTicks );
    int tickedOffDistance = numberOfSubdivisions * distanceBetweenTicks;
    float percentShorterThanFullLine = (float)tickedOffDistance/lineDistance;
    changeInY *= percentShorterThanFullLine;
    changeInX *= percentShorterThanFullLine;
    changeInY /= numberOfSubdivisions;
    changeInX /= numberOfSubdivisions;
    
    textFont( labelFont );
    textAlign( CENTER, CENTER );   
    for( int i = 0; i <= numberOfSubdivisions; i++ )
    {
      point( xStart + i*changeInX, yStart + i*changeInY );
      if( drawLabels )
      {
        if ( ( !drawFirstUnitLable ) && ( i == 0 ) )
        {
          // if on the first unit label, and we've
          // chosen not to draw on first unit label,
          // then ignore the label
        }
        else
        {
          text( round(i*labelMultiple + labelDisplacement), 
                xStart + i*changeInX,
                yStart + i*changeInY );
        }
      }
    }
  }
  
  // getters and setters ////////////////////////////
  void setDistanceBetweenTicks( int distance )
  {
    if( distanceBetweenTicks > 0 )
    {
      distanceBetweenTicks = distance; 
    }
  }

  int getDistanceBetweenTicks()
  {
    return distanceBetweenTicks;
  }

  void setTickColor( color c )
  {
    tickColor = c;
  }

  void setLineColor( color c )
  {
    lineColor = c;
  }

  void setTickThickness( int thickness )
  {
    if ( thickness > 0 )
    {
      tickThickness = thickness;
    } 
  }

  int getTickThickness()
  {
    return tickThickness;
  }

  void setLineThickness( int thickness )
  {
    if ( thickness > 0 )
    {
      lineThickness = thickness;
    }
  }

  int getLineThickness()
  {
    return lineThickness;
  }
  
  void setLineVisibility( boolean visible )
  {
    drawLine = visible;
  }
  
  boolean getLineVisibility()
  {
    return drawLine;
  }
  
  void setTickVisibility( boolean visible )
  {
    drawTicks = visible;
  }
  
  boolean getTickVisibility()
  {
    return drawTicks;
  }
  
  void drawLabels( boolean labelFirst, float displacement, float multiple )
  {
    drawLabels = true;
    drawFirstUnitLable = labelFirst;
    labelMultiple = multiple;
    labelDisplacement = displacement;
  }
    

}

