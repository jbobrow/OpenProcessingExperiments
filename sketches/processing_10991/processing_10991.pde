
/**
  * matrixHelper
  * For greater understanding of pushMatrix() and popMatrix()
  * Square Crow, July 2010s
  */
  
/**
  README
  ======
  
  I have submitted this sketch because writing it solidified my understanding the pushMatrix()
  and popMatrix() functions.  It also shows the usefulness of nesting push-pop pairs within
  one another.  (At the risk of violating good Java style I have indented code within push-pop 
  pairs even though these are not formal code blocks.  This is for the sake of clarity.)
  
  The sketch creates four shapes (rectangles), and also manipulates these shapes as a unit, which 
  I will call a figure.
  
  Transformations translate() and rotate() stack so that when you call one, all subsequent items
  that are drawn will appear with those transformations applied.  pushMatrix() and popMatrix()
  are used to put a new set of transformation on the stack, and then remove transformations from
  the stack so that they are not applied to items drawn later.
  
  Using pushMatrix() and popMatrix() is the best way to cleanly position many items on the same
  screen.
  */
  
// * Globals *
int WINWIDTH = 400;  // = 400;
int WINHEIGHT = 400; // = 400;

// * Setup *

void setup(){
  size(WINWIDTH,WINHEIGHT);
  noLoop(); // used only for static pictures
  rectMode(CENTER);
}

// * Main Loop *

void draw(){
  background(150); 
  
  pushMatrix(); // create a new reference frame for the figure
  
  // "Figure" transformations
  translate(200,200); // move the figure to the center of the window
  rotate(PI/15); // rotate the figure by a small amount
    
    // "Shape" transformations
    
    pushMatrix(); // create a reference frame for this individual shape
      // Apply transformations as though the center of the figure were at the 
      //origin.  We have already moved the entire figure reference frame
      //as seen above.
      translate(-75,-75); // position relative to the center of the figure at origin
      rotate(-PI/4);
      // create the shape at the origin so that only transformations
      //will move it
      rect(0,0,30,50);
    popMatrix(); // done with the shape
                 //pop matrix so it will not affect other shapes
    
    pushMatrix();
      // Note that if I had called rotate() before translate() the shape would have
      //been rotated about a point (75,-75) relative to its center, rather than being
      //rotated about it's center as I had intended
      translate(75,-75);
      rotate(PI/4);
      rect(0,0,30,50);
    popMatrix();
    
    pushMatrix();
      translate(75,75);
      rotate(-PI/4);
      rect(0,0,30,50);
    popMatrix();
    
    pushMatrix();
      translate(-75,75);
      rotate(PI/4);
      rect(0,0,30,50);
    popMatrix();
  
  popMatrix(); // pop the figure reference frame to clean up the transformation
               //matrix "stack"
}

