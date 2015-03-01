
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
// modifiedy by Jing Wood to complete course exercise in 2.5
//---------Future Enhancements; darken overlap edges, fix gap around edging
 */
 
void setup() {
  size(580, 580);
  rectMode(CORNER);
  noStroke();
  frameRate(1.5);  // set the frame rate to 2 draw() call per second
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
  int xgap = 18;
  int ygap = 18;
 
while (rowCurrent < rowMax) {// row loop
    while (columnCurrent < columnMax) { // column loop
      if (random(4,8) >7 && redSquare < 5) { // determine if red or brown square
          fill (209,81,89,230);  //set square fill to red
          redSquare++;
        } else {
           fill (109,81,91,230); //set square fill to brown
        }
      rect (xgap+random(-10,10)+rowCurrent * squareSize,ygap+random(-10,10)+columnCurrent*squareSize,squareSize,squareSize); 
      println (columnCurrent, rowCurrent); // debugging
  

   
   if (keyPressed)
  {
    switch(key)
    {
      case 's':
        saveFrame("Molnar.jpg");
        break;
    }
  }
   
  // save as jpeg / pdf / reset image
 
     ++columnCurrent;
    } // end columnCount while
    columnCurrent = 0; // had to remember to reset my column counter!!!
    ++rowCurrent;  
     }  // end rowCount while
     
} //end of draw



