
/*
 * Creative Coding
 * Week 2.4; Vera Molnar 25 squares
 **** Requirements for assignment / modifications required to w2_03
// all squares same size
// 5 x 5; 100x100 w/ gap of ~20 pixels between
// slight shift of x & y by 25 pixels + / -
// red; count of five; rgb(138,8,19)
// brown; count of 20; rgb(133,64,61)
// alpha @ 50%
// delete drop shadow
//---------Future Enhancements; darken overlap edges, fix gap around edging
 */

void setup() {
  size(580, 580);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(180); // clear the screen to grey
  
  int redSquare = 0; //counter for number of red squares in output
  int squareSize = 100;
  int rowCurrent = 0;
  int columnCurrent = 0;
  int rowMax = 5;
  int columnMax = 5;
  int xgap = 35;
  int ygap = 35;

while (rowCurrent < rowMax) {// row loop
    while (columnCurrent < columnMax) { // column loop
      if (random(2,10) >7 && redSquare < 5) { // determine if red or brown square
          fill (138,8,19,230);  //set square fill to red
          redSquare++;
        } else {
           fill (133,64,61,230); //set square fill to brown
        }
      rect (xgap+random(-10,10)+rowCurrent * squareSize,ygap+random(-10,10)+columnCurrent*squareSize,squareSize,squareSize);  
      println (columnCurrent, rowCurrent); // debugging
      ++columnCurrent;
    } // end columnCount while
    columnCurrent = 0; // had to remember to reset my column counter!!!
    ++rowCurrent;
  }  // end rowCount while
  
  // save as jpeg / pdf / reset image
  
} //end of draw 

