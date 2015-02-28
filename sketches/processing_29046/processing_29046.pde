
/**Chelsey Ellison
   Art443R
   Repeating Pattern**/
   
// GLOBAL VARIABLES CAN CALL FROM ANYWHERE
//interger of xPosition. Declared name & type
int xPos = 40;
int yPos = 40;

void setup() {
  noLoop();
  size(450, 450);
  // These are your local Variables
  int stageWidth = width;
  int stageHeight = height;
  background(225, 206, 94);
  stroke (120, 120, 120);
  strokeWeight(4);
  smooth();
  fill (250, 250, 250);
}

void draw() {

  xPos = 20; 
  //Defines global variable.(You can change xPos at any point
  int d = 140;

  //c++ means add 1 to c each time loop is draw. 
  for ( int c = 0; c < 7 ; c++) {
    for (int r = 0; r < 7; r++)

      //times creates spacing because it's timsing by whatever the c number is. 
      drawTile (70 * c, 70 * r, d);
  }
}

//Void means function is coming. DrawTile is a function
void drawTile(int xPos, int yPos, int d) { 
  // First top left corner
  beginShape();
  //top left of square
  vertex(xPos, yPos);
  //end of top left line
  vertex (xPos + 10, yPos);
  //start of curve
  curveVertex (xPos + 10, yPos);
  curveVertex (xPos + 10, yPos);
  curveVertex (xPos + 15, yPos - 6); 
  //peak of curve
  curveVertex (xPos + 25, yPos - 10);
  curveVertex (xPos + 35, yPos - 6);
  curveVertex (xPos + 40, yPos);
  curveVertex (xPos + 40, yPos);
  //end top curve begining of top right line
  vertex(xPos + 50, yPos);
  vertex(xPos + 50, yPos + 10);
  curveVertex (xPos + 50, yPos + 10);
  curveVertex (xPos + 50, yPos + 10);
  curveVertex (xPos + 56, yPos + 15);
  //Peak Right Curve
  curveVertex (xPos + 60, yPos +25);
  curveVertex (xPos + 56, yPos +35);
  curveVertex (xPos + 50, yPos + 40);
  curveVertex (xPos + 50, yPos + 40);
  vertex(xPos + 50, yPos + 50);
  vertex(xPos + 40, yPos + 50);
  //Bottom Curve Start
  curveVertex (xPos + 40, yPos + 50);
  curveVertex (xPos + 40, yPos + 50);
  curveVertex (xPos + 35, yPos + 56);
  //peak of  bottom curve
  curveVertex (xPos + 25, yPos + 60);
  curveVertex (xPos + 15, yPos + 56);
  curveVertex (xPos + 10, yPos + 50);
  curveVertex (xPos + 10, yPos + 50);
  //Bottom Curve End
  vertex(xPos + 10, yPos + 50);
  vertex(xPos, yPos + 50);
  vertex(xPos, yPos + 40);
  //Begin Left Curve
  curveVertex (xPos, yPos + 40);
  curveVertex (xPos, yPos + 40);
  curveVertex (xPos - 6, yPos + 35);
  //Left Curve Peak
  curveVertex (xPos - 10, yPos + 25);
  curveVertex (xPos - 6, yPos + 15);
  curveVertex (xPos, yPos + 10);
  curveVertex (xPos, yPos + 10);
  //End Left Curve




  endShape(CLOSE);
}


