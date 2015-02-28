
//Number of rows and columns, and margin are adjustable
int nRows = 20;
int nCols = 12;
int margin = 30;

float sqSize;

void setup() {
  size(360, 600);
  noLoop();
  noFill();
  //Square sizes depend on set margin, 
  //and number of columns and rows
  sqSize = min((width-(2*margin))/nCols, 
  (height-(2*margin))/nRows);
}


void draw() {
  background(200);
  for (int row=0; row<nRows; row++) {
    for (int col=0; col<nCols; col++) {
      //Draw squares in each row left to right
      float left = col*sqSize+margin;
      float top = row*sqSize+margin;

      //Make each square's disorder depend on its row
      float shiftX = random(-row, row)/2;
      float shiftY = random(-row, row)/2;
      float shiftAngle = random(-PI/2, PI/2)*(1.0*row*row/nRows/nRows);

      pushMatrix();
      translate(left+shiftX, top+shiftY);
      rotate(shiftAngle);
      rect(0, 0, sqSize, sqSize);
      popMatrix();
    }
  }
}
