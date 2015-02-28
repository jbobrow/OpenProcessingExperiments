
/*
 Kamee Bentley
 17th May 2011
 ART443R
 */
// { imaginary opening code block for global variables
// global variables

int xPos = 225;  // data type | variable name = value
int yPos = 225;

void setup() {  // opening code block
  size(450, 450);

  // local variables
  int stageWidth = width;
  int stageHeight = height;
  println("stageHeight is " + stageHeight);
  //

  background(255, 255, 255);
  smooth();
  stroke(0, 0, 0);
  strokeWeight(4);
  noFill();
}  // closing code block

void draw() {

  background(255, 255, 255);

  xPos = 300;  // update the global variable xPos to 300

    // loop to create each column
  for (int cols = 0; cols < 3; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 4; rows++) {
      drawTile(180 * cols, 114 * rows);
    }
  }
}

void drawTile (int xPos, int yPos) {

  rect(xPos-58, yPos+24, 56, 49);//far left square
  rect(xPos+0, yPos +23, 25, 12);//small square
  rect(xPos-19, yPos+74, 72, 33);//left big bottom square
  rect(xPos-19, yPos+107, 71, 15);//left bottom small square 
  rect(xPos+53, yPos+74, 71, 33); //right big bottom square
  rect(xPos+87, yPos+24, 37, 49);//right tall square
  rect(xPos+72, yPos+9, 72, 40);//top right square

  fill (140, 140, 140); // grey square
  rect(xPos+53, yPos+107, 71, 15);// grey square 
  fill(0, 0, 0);//black square
  rect(xPos+0, yPos+50, 62, 40);//black square
  fill (0, 160, 198); //blue square
  rect(xPos+25, yPos+23, 62, 39); //blue square
  fill (208, 16, 177); //purple square
  rect(xPos+25, yPos+61, 62, 12);// purple square
  fill (255, 255, 0); // yellow square
  rect(xPos+8, yPos+70, 17, 13); //yellow square
  noFill();//top square
  rect(xPos+0, yPos+9, 72, 40);//top square left
}
// } imaginary closing code block for global variables


