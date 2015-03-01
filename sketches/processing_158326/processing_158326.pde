
/*  A recreation of Sol LeWitt's instruction-based artwork:

    WORK FROM INSTRUCTIONS (1971):
    
    USING A BLACK, HARD CRAYON DRAW A TWENTY INCH SQUARE.
    DIVIDE THIS SQUARE INTO ONE INCH SQUARES. WITHIN EACH
    ONE INCH SQUARE, DRAW NOTHING, OR DRAW A DIAGONAL
    STRAIGHT LINE FROM CORNER TO CORNER OR TWO CROSSING
    STRAIGHT LINES DIAGONALLY FROM CORNER TO CORNER.
*/

int vertSquareCount = 20;
int horizSquareCount = 20;
int squareSize = 30;
int num;
boolean isDone;

void setup() {
  //size(squareSize*(vertSquareCount+2), squareSize*(horizSquareCount+2));  // this one does not work in JavaScript :(
  // so let's hard-code the size of the window:
  size (660, 660);
  isDone = false;
}

void draw () {
  if (!isDone) {
    background(255);
    stroke(0);

    for (int i = 0; i < vertSquareCount; i = i+1) {
      for (int j = 0; j < horizSquareCount; j = j+1) {
        //draw square
        rect(20 + squareSize*i, 20 + squareSize*j, squareSize, squareSize);
        num = (int)random(0,3);
        switch(num) {
          case 0:
          // do nothing
          break;
          case 1:
          //draw one diagonal
          line((20 + squareSize*i)+squareSize, (20 + squareSize*j)+squareSize, 20 + squareSize*i, 20 + squareSize*j);
          break;
          case 2:
          // draw two diagonals
          line((20 + squareSize*i)+squareSize, (20 + squareSize*j)+squareSize, 20 + squareSize*i, 20 + squareSize*j);
          line(20 + squareSize*i, (20 + squareSize*j)+squareSize, (20 + squareSize*i)+squareSize, 20 + squareSize*j); 
          break;
        }
      }
    }
  }
  isDone = true;
}


