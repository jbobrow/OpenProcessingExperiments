
/* This is a copy of George Nee's classic "Schotter" (1968) 
 * http://www.medienkunstnetz.de/works/schotter/
 *
 * by Julia Teitelbaum, 09/09/2013
 */

int numRows;
int numCols;
float squareSideLength;
float padding;
float rowsRandomnessFactor; 

void setup() {
  /* set/calculate width and height based on proprortions of Schotter's
   * original piece */
  int drawingHeight = 600;
  float widthHeightRatio = 0.49;
  int drawingWidth = int(drawingHeight * widthHeightRatio); // ~285
  
  /* set randomness factor 
   * lower means more rows will be more random, higher means more rows will be more ordered
   */
  rowsRandomnessFactor = 70.0;
  
  /* calculate padding for squares  and length of their sides 
   * based on proportions of Schotter original */
  float paddingRatio = 0.14;
  padding = drawingWidth * paddingRatio; // ~40
  squareSideLength = padding/2; // ~20
  
  size((drawingWidth + int(padding)), drawingHeight); // set the size of the window
  noLoop(); // we aren't animating, so draw() only needs to run once
  noFill(); // none of the squares have fills, only outlines
}

void draw() {
  int schotterGrey = 225;
  background(schotterGrey);
  smooth(); // alias lines so the squares look nice
  
  numCols = 12;
  numRows = 2*numCols; // 24
  
  for (int currentCol = 0; currentCol < numCols; currentCol++) {
    for (int currentRow = 0; currentRow < numRows; currentRow++) {
       pushMatrix(); // save current canvas position
       
       // calculate positional change for canvas
       float leftOffset = padding + (currentCol * squareSideLength);
       float topOffset = padding + (currentRow * squareSideLength);
       translate(leftOffset, topOffset);
       
       // calculate rotational change for canvas
       // to shift the square's angle
       float lowerRandomBound = PI*currentRow/(-1*rowsRandomnessFactor);
       float upperRandomBound = PI*currentRow/rowsRandomnessFactor;
       float angleShift = random(lowerRandomBound, upperRandomBound);
       rotate(angleShift);
        
       // draw the square (as far as it knows, it's at the origin)
       rect(0, 0, squareSideLength, squareSideLength);
       
       // put the canvas back as it was
       popMatrix();
    }
  }
}

/* NOTE ON USAGE OF PUSHMATRIX() AND POPMATRIX()
 * We're using matrix translations to conceptually move the canvas. 
 * we're basically always drawing the box/keeping the imaginary
 * pen in the same location, but keeping a record of where we've 
 * moved the canvas so we can shift it differently for each square */


