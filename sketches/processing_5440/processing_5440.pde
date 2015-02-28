
/* CLASS MATRIX
 *
 * this class holds a virtual matrix that will mimic the real world matrix.
 * It contains functions that read input from a serial port or mouse, then use that
 * input to determine the location of the object or mouse on the grid  
 *
 */

class Matrix {

  // general variables used accross class
  final int x = 0; final int y = 1;                                      // variables to use with matrix size array
  
  // matrix and cell related variables
  final int [] cellNumber = {5, 5};                                      // number of cells on the horizontal axis of the matrix
  final float [] cellSize = new float [2];                               // width and height of each cell of the matrix       
  int [] matrixLoc = new int [2];                                        // location of the overall matrix
  final float [] matrixSize = new float [2];                             // the total height and width of the matrix
  float [] xCellLoc = new float [cellNumber[x]];                         // location of each cell on the grid
  float [] yCellLoc = new float [cellNumber[y]];                         // location of each cell on the grid
  Boolean [][] cellState = new Boolean [cellNumber[x]][cellNumber[y]];   // holds whether the mouse or serial object is hovering over a cell
  color activeColor = color (255,0,0);                                   // holds color of active cells
  color inactiveColor = color (255);                                     // holds color of inactive cells
  int [] previousState = {0,0};                                          // holds prevous state of the cell

  // variables for reading serial input
  float [] serialLoc = {0,0};                                            // holds Y reading from the serial port


  // Matrix Object Constructor
  Matrix (int XLoc, int YLoc, int cellWidth, int cellHeight) {
      matrixLoc[x] = XLoc;                                                    // set X and Y location of the virtual matrix
      matrixLoc[y] = YLoc;
      cellSize[x] = cellWidth;                                                // set the size of each cell on the grid of the virtual matrix
      cellSize[y] = cellHeight; 
      matrixSize[x] = cellNumber[x] * cellSize[x];                            // calculate width of the matrix
      matrixSize[y] = cellNumber[y] * cellSize[y];                            // calculate height of the matrix
      
      // sets the location of each cell on the grid
      for (int xCounter = 0; xCounter < xCellLoc.length; xCounter++) {
            xCellLoc[xCounter] = xCounter * cellSize[x]; }
      for (int yCounter = 0; yCounter < yCellLoc.length; yCounter++){
            yCellLoc[yCounter] = yCounter * cellSize[y]; }  
    
      // sets the status of each cell to false
      for (int xCounter = 0; xCounter < cellState.length; xCounter++) {
          for (int yCounter = 0; yCounter < cellState[xCounter].length; yCounter++) {
            cellState[xCounter][yCounter] = false; }
      }
  }  // close the constructor



 // function that returns the height of the matrix
 float getMatrixHeight(){
   return matrixSize[x];
 }


 // function that returns the width of the matrix
 float getMatrixWidth(){
   return matrixSize[y];
 }


 // function that draws the matrix on the screen
 void drawMatrix() { 
   for (int xCounter = 0; xCounter < xCellLoc.length; xCounter++){                 // loop through each element in the xCellLoc array
       for (int yCounter = 0; yCounter < yCellLoc.length; yCounter++){             // loop through each element in the yCellLoc array
         if (cellState[xCounter][yCounter] == true) { fill(activeColor); }         // if the cellState is true then change the color of the cell
         else { fill(inactiveColor);}                                              // if the cellState is false then don't change the color of the cell
         rect(xCellLoc[xCounter]+matrixLoc[x], yCellLoc[yCounter]+matrixLoc[y], cellSize[x], cellSize[y]);    // draw rectangle
       }  
   }
 }  // close drawMatrix() function


/* SERIAL CODE COMMENTED OUT FOR WEB UPLOAD
 // function that reads the input from the serial port
 void readSerialInput (Serial Arduino) {
   if (!isStarted) {                                                                 // if this is the first time we are establishing a connection
    isStarted = true;                                                                // set isStarted to true
    arduino.write("n");                                                              // respond to arduino to request more data
  } else {                                                                           // if this is NOT the first time we have received data from the arduino
    String bufferString = arduino.readString();                                      // read the buffer into the bufferString variable 
    if (bufferString != null) {                                                      // if bufferString holds data then process the data
       bufferString = bufferString.substring(0, bufferString.length() - 1);             // trim the string
       String[] serialValues = splitTokens(bufferString, " ");                          // separate the two values from the string and save them in the serialValues variable
      serialLoc[x] = float(serialValues[x]);                                                  // assign value to serialLoc[x]
      serialLoc[y] = float(serialValues[y]);                                               // assign value to serialLoc[y]
    }
    arduino.write("n");                                                              // respond to arduino to request more data
  }
} // close readSerialInput() function
  
  
// returns an array with the unfiltered x and y locations from the serial monitor (may need to filter data based on range of serial input and requirements of music objects)
int[] getSerialXY() {
  return int(serialLoc);
}
*/


// returns an array with the unfiltered x and y locations from the mouse-based interface (may need to filter data based on requirements of music object)
int [] setMmouseXY() {
   int [] mouseXY = {mouseX, mouseY};
   return mouseXY; 
}


 // check if a cell on virtual Matrix is active based on the mouse location
 void isCellActiveMouse () {                                              
  int XLocMouse = mouseX - matrixLoc[x];                                        // adjust variable to account for location of Matrix within window
  int YLocMouse = mouseY - matrixLoc[y];                                        // adjust variable to account for location of Matrix within window
  isCellActive(XLocMouse, YLocMouse);                                           // call the function to check if the cell is active based on current location of mouse
 }

/* SERIAL FUNCTION
 // check if a cell on virtual Matrix is active based on the current physical location/state of an external object
 void isCellActiveSerial () {
   int xLocSerial = int(map(serialLoc[x], 0, 1024, 0, matrixSize[x]));                // adjust variable to account for location of Matrix within window
   int yLocSerial = int(map(serialLoc[y], 0, 1024, 0, matrixSize[y]));                // adjust variable to account for location of Matrix within window
   isCellActive(xLocSerial, yLocSerial);                                        // call the function to check if the cell is active based on current location of mouse

 }
*/

 // function that checks whether a specific cell is Active
 void isCellActive (int tXloc, int tYloc) {
  int xLoc = tXloc;                                                                  // set the location of the X coordinate where the mouse or serial object is located
  int yLoc = tYloc;                                                                  // set the location of the Y coordinate where the mouse or serial object is located 
   
  for (int xCounter = 0; xCounter < xCellLoc.length; xCounter++){                     // loop through each element in the xCellLoc array
       for (int yCounter = 0; yCounter < yCellLoc.length; yCounter++){                // loop through each element in the yCellLoc array
 
           // check out what are the mouse or serial object is intersecting
           if (  (xLoc > xCellLoc[xCounter] && xLoc < (xCellLoc[xCounter] + cellSize[x])) &&
                 (yLoc > xCellLoc[yCounter] && yLoc < (yCellLoc[yCounter] + cellSize[y]))    ) {
                        cellState[previousState[x]][previousState[y]] = false;        // set previous grid element to false
                        cellState[xCounter][yCounter] = true;                         // set current element to active status
                        previousState[x] = xCounter;                                  // set x number of previous active cell
                        previousState[y] = yCounter;                                  // set y number of previous active cell
                 }
       }  
  }
 }
 
 
}

