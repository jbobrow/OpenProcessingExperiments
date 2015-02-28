
/**
 * Helps out with developing 3D stuff by drawing a color coded axis, 
 * providing built in coordinate twisting and zooming rules.  Assumes you want a regular
 * coordinate system, with y positive up in the air, x positive to the right,
 * and z positive heading toward you.
 * 
 * @author Myer Nore
 * @version 20081115
 **/
class Help3d
{
  float angle;
  float rotationSpeed;
  float zoom;
  float minZoom;
  float maxZoom;
  int axisLength;
  boolean axisOn;

  /** this can be set to "off" in order to 
   * completely disable all Help3d functions,
   * that way, you can integrate it into your 
   * class for debugging and easily get rid of it.
   **/
  boolean on;

  Help3d()
  {
    minZoom = 2;
    maxZoom = 30;
    axisLength = 50;
    // starting zoom level
    zoom = 10;
    on = true;
    axisOn = true;
  }

  /** to be called inside draw() AFTER YOU CALL BACKGROUND, 
   * but before other things - displays axis, 
   * handle zooms and rotations, etc.
   **/
  void display()
  {
    // make help class easy to turn off
    if( on )
    {
      if( mousePressed )
      {
        // if we're moving down
        if( mouseY > pmouseY )
        {
          // zoom out
          zoom = constrain( zoom - .1, minZoom, maxZoom );
        }
        // if we're moving up
        if( mouseY < pmouseY )
        {
          // zoom in
          zoom = constrain( zoom + .1, minZoom, maxZoom );
        }
        // if we're moving right
        if( mouseX > pmouseX )
        {
          // twist clockwise
          angle = angle + .1;
        }
        // if we're moving left
        if( mouseX < pmouseX )
        {
          // twist counterclockwise )
          angle = angle - .1;
        }
      }
      camera( zoom*10, zoom*10, zoom*10, // eyeX, eyeY, eyeZ
      0.0, 0.0, 0.0, // centerX, centerY, centerZ
      0.0, -1.0, 0.0); // upX, upY, upZ

      // rotate about the y axis if angle > 0
      rotateY( angle );
      if( axisOn )
      {
        drawAxis();
      }
    }
  }

  /** 
   * Draws a color-coded axis. 
   **/
  void drawAxis()
  {
    // remember style rules 
    pushStyle();

    strokeWeight( 4 );
    stroke(100, 0, 0); // dark red for:
    line( -axisLength, 0, 0, 0, 0, 0); // negative x axis
    stroke(255, 0, 0); // bright red for:
    line(0, 0, 0, axisLength, 0, 0); // positive x axis
    stroke( 0, 100, 0 ); // dark green for:
    line(0, -axisLength, 0, 0, 0, 0); // negative y axis
    stroke( 0, 255, 0 ); // bright green for:
    line( 0, 0, 0, 0, axisLength, 0); // positive y axis
    stroke( 0, 0, 100 ); // dark blue for: 
    line(0, 0, -axisLength, 0, 0, 0); // negative z axis 
    stroke( 0, 0, 255 ); // light blue for:
    line(0, 0, 0, 0, 0, axisLength ); // positive z axis

    // restore stroke defaultss
    popStyle();
  }

  // setters /////////////////////////////////
  void axisOn()
  {
    axisOn = true;
  }

  void axisOff()
  {
    axisOn = false;
  }

  void setMinZoom( float minZoom )
  {
    this.minZoom = minZoom;
  }

  void setMaxZoom( float maxZoom )
  {
    this.maxZoom = maxZoom;
  }

  void setAxisLength( int axisLength )
  {
    this.axisLength = axisLength;   
  } 

  void on()
  {
    on = true; 
  }

  void off()
  {
    on = false;
  }
}


