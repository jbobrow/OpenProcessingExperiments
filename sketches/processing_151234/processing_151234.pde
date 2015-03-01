
/*
 * Creative Coding
 * Week 2, 02 - Nine Squares, part 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws 3 rows of 3 squares in the display window
 * Each row is coloured red, green, and blue.
 * In this example the 9 squares are drawn using two different methods involing
 * for loops. Change the value of the variable "caseNum" from 1 to 2 to swap methods.
 *
 * The first method (caseNum == 1) uses 3 for loops to draw each row.
 * The second method (caseNum == 2) uses 2 nested for loops to draw rows and columns.
 *
 * The on-screen results are the same, but the execution flow is different.
 * Notice that in the nested loop case, only one call to rect is made, but it is called 9 times
 * 
 */

// variables:
int numberSquares = 5;           // number of rows/cols
int canvasSize = 600;  // size of canvas
int borderPercentage = 5; // %age size of border each edge
int averageGapPercentage = 2; // 5age size of gape between squares

int sizeOfSquares;
int borderSize;
int gapSize;

  int xPosn;
  int yPosn;
  
  int randX;
  int randY;
  
void setup() {


  borderSize = int(canvasSize * borderPercentage / 100)  ;
  gapSize =   int(canvasSize * averageGapPercentage / 100) ;
  sizeOfSquares = int((canvasSize - (2*borderSize) - (gapSize*(numberSquares-1) ) ) / numberSquares);
 
   
  size(canvasSize, canvasSize);
  background(180);
  noLoop(); // only execute the draw function once
  // rectMode(CENTER);
  noStroke();
  randomSeed(second() + millis());

}


void draw() {
  
  
    for (int i=0; i<numberSquares; i++) { // col
      for (int j=0; j<numberSquares; j++) { // row
      
      
        // draw the rectangle
        fill(255, 0, 0, 150);

        randX = int(random(20))-10 ;
        randY = int(random(20))-10 ;

        xPosn = int(borderSize + (sizeOfSquares+gapSize)*i + randX );
        yPosn = int(borderSize + (sizeOfSquares+gapSize)*j + randY );
                
        rect( xPosn , yPosn , sizeOfSquares, sizeOfSquares);
        
      } // end for (j)
    } // end for (i)
} //end of draw 

