
class RoundedRect
{
  PVector position, dimensions, transposition, transdimensions, destination;
  color rectColor;
  float speed, roundness;

  RoundedRect()
  {
    position = new PVector( 0, 0 );
    dimensions = new PVector( random( 30, width - 30 ), random( 30, height - 30 ) );
    transposition = new PVector();
    transdimensions = new PVector();
    updateTransDimensions();
    destination = new PVector();
    speed = .3;
    roundness = .4;
    rectColor = color( random( 255 ), random( 255 ), random( 255 ) );
  }

  private void updateTransDimensions()
  {
    transposition.x = .5 * dimensions.x * roundness;
    transposition.y = .5 * dimensions.y * roundness;
    transdimensions.x = dimensions.x - 2 * transposition.x;
    transdimensions.y = dimensions.y - 2 * transposition.y; 
  }

  void update()
  {
    move();
    updateTransDimensions();
    pushStyle();
    drawRoundedRect( position.x, position.y, dimensions.x, dimensions.y, roundness );
    popStyle();
  }

  /** r is a float from zero to one **/
  private void drawRoundedRect( float x, float y, float w, float h, float r )
  {
    fill( rectColor );
    stroke( rectColor );
    // body rect
    rect( position.x + transposition.x, position.y + transposition.y, 
    transdimensions.x, transdimensions.y );
    // top rect
    rect( position.x + transposition.x, position.y, 
    transdimensions.x, transposition.y );
    // right rect
    rect( position.x + transposition.x + transdimensions.x, 
    position.y + transposition.y, 
    transposition.x, transdimensions.y );
    // bottom rect
    rect( position.x + transposition.x, 
    position.y + transposition.y + transdimensions.y, 
    transdimensions.x, transposition.y );
    // left rect
    rect( position.x, position.y + transposition.y, 
    transposition.x, transdimensions.y );
    // upper left arc
    ellipseMode( CENTER );
    arc( position.x + transposition.x, 
    position.y + transposition.y, 
    transposition.x*2, transposition.y*2,
    PI, -HALF_PI );
    // upper right arc
    arc( position.x + transposition.x + transdimensions.x,
    position.y + transposition.y,
    transposition.x*2, transposition.y*2,
    PI + HALF_PI, 0 );
    // lower right arc
    arc( position.x + transposition.x + transdimensions.x,
    position.y + transposition.y + transdimensions.y,
    transposition.x*2, transposition.y*2,
    0, HALF_PI );
    // lower left arc
    arc( position.x + transposition.x,
    position.y + transposition.y + transdimensions.y,
    transposition.x*2, transposition.y*2,
    HALF_PI, PI );
  }

  void move()
  {
    float dx = destination.x - position.x;
    float dy = destination.y - position.y;
    // if it has reached it's destination
    if(  abs( dx ) < .5  &&  abs( dy ) < .5  )
    {
      // don't move
    }
    else
    {
      position.x += dx*speed;
      position.y += dy*speed; 
    }
  }

  public void setSpeed( float zeroToOne )
  {
    zeroToOne = constrain( zeroToOne, 0.0, 1.0 );
    speed = zeroToOne; 
  }

  public void setColor( color b )
  {
    rectColor = b; 
  }

  public void setRoundness( float zeroToOne )
  {
    zeroToOne = constrain( zeroToOne, 0.0, 1.0 );
    roundness = zeroToOne; 
  }

  private float getRadius()
  {
    return .1;
  }

  void setDestination( float x, float y )
  {
    destination.x = x;
    destination.y = y;
    println( "Destination is now (" + destination.x + "," + destination.y + ")" );
  }
}





