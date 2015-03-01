
int gridSize = 25;
boolean lineDone = true; //a boolean to know then the grid is full
boolean gridFull = true; //a boolean to know then the grid is full

int drawTime = 0; //to know how manytime it drws the dagger

int xCell = 0; //used for cell coordinate
int yCell = 0; //same

void setup() {
  size(500, 500);
  background(124); 
  smooth();
  strokeWeight(1);
  stroke(0);
}

void draw() {

  noFill(); //to make a sort of grid, don't know if it's needed...
  rect(xCell, yCell, gridSize, gridSize);
  fill(255);
  drawSword( xCell-gridSize/2, yCell+gridSize/2, gridSize);
  xCell = xCell + gridSize; //prepare the variable for the next draw at 25 pixel right

  drawTime++; //keeps tracks of the # of time it draws a cell
  if (drawTime > width/gridSize) { //everytime it completes a row of swords,
    yCell = yCell + gridSize;   // it set the value 25 pixel down
    xCell = 0; // and resets the xCell value so it starts back at the left
    drawTime = 0; //and resets the draw counter
  }
}



void drawSword(int x, int y, int size) {
  y = y - size/3; //this is used to corent the center position on the Y axis.
  swordHilt(x, y, size); //draws the hilt
  swordBlade(x, y, size); //draws the blade
}


void swordBlade(int x, int y, int size) {
  triangle( x, y-size/5, x-size/6, y+size/2, x+size/6, y+size/2); //using a triangle function to do the blade
}

void swordHilt(int x, int y, int size) {
  rectMode(CENTER); //make the drawing of the handle easier.
  rect(x, y+size/2+size/10, size/10, size/3); //the handle
  rectMode(CORNER); 
  rect(x-size/4, y+size/2, size/2, size/10); //the guard (?)
}



