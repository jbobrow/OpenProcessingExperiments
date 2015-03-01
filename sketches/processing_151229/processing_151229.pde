
/*
 * Futurelearn | Creative Coding
 * Week 2 - 11th June 2014
 * 25 Squares Generator
 * by Chris Dymond (c)
 *
 * This program is an interpretation of Vera Molnar's 25 Squares
 * It draws 5 rows of 5 squares in a grid, each slightly offset by a random factor
 * Each square is also coloured slightly differently by randomly adjusting the alpha
 * 
 */

// initialisation
void setup() {
  size(600, 600);  // sets the canvas size
  frameRate(1); // refresh draw() once per second
  rectMode(CORNER); // set the rectangle drawing mode to specify the rectangle's top left corner
  noStroke();  // don't draw outlines
}

// main drawing routine
void draw() {
  background(220);  // sets the background colour
  int Squares = 5;  // sets the number of squares on each side
  int Margin = 20;  // sets the outer frame margin
  int Gap = 2;      // sets the default gap between the squares
  fill (128,0,0);   // sets the default fill colour
  float Squaresize = (width - ((Margin*2)+(Gap*(Squares-1))))/Squares; // calculates the size of the squares
  float Offset;     // set random offset
    
  for (int i=0; i<Squares; i++) {  //loop the rows
    for (int j=0; j<Squares; j++) {  //loop the columns
      // set random offset
      Offset = (int) random (-7,7);
      
      // set the transparency range
      int Alpha = 180+(int) random(-50,50);

      // draw the rectangle
      fill (150,0,0,Alpha);
      rect(Margin+(i*(Gap+Squaresize))+Offset, Margin+(j*(Gap+Squaresize))+Offset, Squaresize, Squaresize);
      
    }  //end for j
  }  //end for i
  
  // save the drawing when the 's' key is pressed
  if (keyPressed == true && key == 's') {
    saveFrame("25Squares.jpg");
  }
  
}  //end of draw





