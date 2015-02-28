
// add in global variables

// declare name, assign value
int xPos = 220;  
int yPos = 220;
String firstname = "nathansmith";

void setup() {
  //document size  
  size(450, 450);

  //add in local variables
  int stageWidth = width;
  int stageHeight = height;

  background(50, 130, 150);
  smooth();
  stroke(0, 0, 0);
  strokeWeight(1);
}

void draw() {

  background(50, 130, 150);

  strokeWeight(1);
  fill(color(215, 200, 150, 120)); 

  //loop for columns
  for (int cols = 0; cols < 19; cols++) {  
    // loop for rows
    for (int rows = 0; rows < 12; rows++) {
      drawTile(25 * cols, 40 * rows, 20);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {

  ellipse(xPos, yPos + 2, d, d);
  ellipse(xPos, yPos + 2, 9, d);
  ellipse(xPos, yPos + 2, d, 9);
  ellipse(xPos + 13, yPos +22, 24, 24);
  ellipse(xPos + 13, yPos +22, 12, 12);
}


