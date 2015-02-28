
//define global variables
int xPos = 0; //define x-position as a variable
int yPos = 0; //define y-position as a variable

//setup
void setup() {
  size(450, 450); //set the window size
  background(255, 255, 255); //set background color
  smooth(); //anti-alias all vector images
}

//draw
void drawTile(int xPos, int yPos, int w, int h) { //call the drawTile function and set parameters
  stroke(0, 0, 0); //set stroke color
  fill(87, 63, 0); //set fill color for first box
  rect(xPos, yPos, w, h); //set position and size of first box
  fill(150, 90, 0); //set fill color for second box
  rect(xPos+w, yPos, w, h); //set position and size of second box
  fill(209, 101, 0); //set fill color for third box
  rect(xPos, yPos+h, h, w); //set position and size of third box
  fill(171, 55, 0); //set fill color for forth box
  rect(xPos+h, yPos+h, w, h); //set position and size of fourth box
  fill(122, 7, 0); //set fill color for fith box
  rect(xPos+h, yPos+w, w, h); //set position and size of fifth box
  fill(171, 55, 0); //set fill color of sixth box
  rect(xPos+w+h, yPos+h, h, w); //set position and size of sixth box
  fill(209, 101, 0); //set fill color of the seventh box
  rect(xPos, yPos+w+h, w, h); //set position and size of the seventh box
  fill(150, 90, 0); //set fill color of eigth box
  rect(xPos+w, yPos+w+h, w, h); //set position and size of the eigth box
  fill(87, 63, 0); //set fill color of ninth box
  rect(xPos+2*w, yPos, h, w); //set position and size of ninth box
  fill(150, 90, 0); //set fill color of tenth box
  rect(xPos+2*w, yPos+w, h, w); //set position and size of tenth box
  fill(209, 101, 0); //set fill color of eleventh box
  rect(xPos+2*w+h, yPos, w, h); //set position and size of eleventh box
  fill(171, 55, 0); //set fill color of twelth box
  rect(xPos+2*w+h, yPos+h, h, w); //set position and size of twelth box
  fill(122, 7, 0); //set fill color of thirteenth box
  rect(xPos+3*w, yPos+h, h, w); //set position and size of thriteenth box
  fill(171, 55, 0); //set fill color of fourteenth box
  rect(xPos+2*w+h, yPos+w+h, w, h); //set position and size of fourteenth box
  fill(209, 101, 0); //set fill color of fifteenth box
  rect(xPos+3*w+h, yPos, h, w); //set position and size of fifteenth box
  fill(122, 7, 0); //set fill color of sixteenth box
  rect(xPos+3*w+h, yPos+w, h, w); //set position and size of sixteenth box
}

//draw
void draw() {
  int w = 20; //define intial value of the variable w
  int h = w/2; //define inital value of the variable h
  for (int cols = 0; cols < 12; cols++) { //first loop using a cols variable, first set the position to default of 0, next ask if cols is less than 12, if the previous is true add in increments
    for (int rows = 0; rows < 12; rows++) { //second loop using a rows variable, first set the position of default to 0, next ask if rows is less than 12, if the previous i true add in increments
      drawTile(80 * cols, 40 * rows, w, h); //draw the drawTile function using 80 times the cols variable for the x-position, 40 times the rows variable for the y-position, w for the width, and h for the height
    }
  }
}


