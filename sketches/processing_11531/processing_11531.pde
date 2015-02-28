
/* ------------------------------------------------------------------------------ Ribbon.pde
 Notes
 ~~~~~
 This class defines the attributes of each 'ribbon' object drawn on the screen including its
 width, position, and the pattern that it follows.
 
 ------------------------------------------------------------------------------------------ */
class Ribbon {

  // ----------------------------------------------------------------- Constants and variables

  int displacement = height/70 ;  // Sets the change made to the position of ribbons drawn
                                  // in each cycle relative to screen height
  int strokeWidth;                // Sets the maximum possible width of the ribbon
                                  // relative to screen size

  int positionX, positionY, lastX, lastY ; // Stores the current and previous position
                                           // of the ribbon
  int index ;  // Stores the number of the ribbon (ribbon closest to centre is 1, next
               // is 2, etc)

  int pattern ;// Stores which pattern the ribbon is required to draw.

  // ---------------------------------------------------------------------------- Constructors

  Ribbon(int indx, int pattn) {

    index = indx + 1 ; // Save the number of the ribbon (as counted from the centre of the
                       // display
    pattern = pattn ;
    updatePosition() ; // Set the initial location of the ribbon

      strokeWidth = index * ((height/60) / numRibbons) ;
  }

  // --------------------------------------------------------------------------- Public methods


  // Update the position of the ribbon according to which pattern it is following  
  int updatePosition() {

    // Save the previous position of the ribbon so a line can be drawn between the previous
    // and the current position
    lastX = positionX ;
    lastY = positionY ;

    if (pattern == CIRCLE_PATTERN) {

      // Update the position of the ribbon according to the 'circle' pattern
      positionX = round((height/2)*(index/float(numRibbons)) * sin(delta) * cos(delta)) ;
      positionY = round((height/2)*(index/float(numRibbons)) * sin(delta) * sin(delta) + displacement * (delta/PI)) ;
    } 
    else if (pattern == SPIKE_PATTERN) {

      // Update the position of the ribbon according to the 'spike' pattern
      positionX = round((height/2)*(index/float(numRibbons)) * sin(delta)) ;
      positionY = round((height/2)*(index/float(numRibbons)) * sin(delta) * sin(delta) * (delta)) ;
    } 
    else if (pattern == FLOWER_PATTERN) {

      // Update the position of the ribbon according to the 'flower' pattern
      positionX = round((height/2)*(index/float(numRibbons)) * sin(delta) * sin(delta) * sin(delta) * cos(delta)) ;
      positionY = round((height/2)*(index/float(numRibbons)) * cos(delta) + displacement * (delta/PI)) ;
    }

    return 0 ;

  }


  int drawRibbon(color colour) {

    stroke(colour) ;
    strokeWeight(index * (strokeWidth/numRibbons)) ;

    // Draw a line between the previous position and the current position of the ribbon
    line(positionX,positionY, lastX,lastY) ;
    return 0 ;
  }
}



