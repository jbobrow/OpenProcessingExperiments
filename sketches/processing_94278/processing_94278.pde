
import processing.pdf.*;  //for the vector export

cell [] grid;
int unit = 2; // the size of the cell... changing this will change the total size of the spaceinvader
int count;
int wideCount = 12; //length of the spaceinvader
int highCount = 8; //height of the invader

void setup() {  
  /*
  //export vector PDF
  size(480, 780, PDF, "spaceinvaders.pdf");
  */
  size(476, 776);
  noStroke();
  background(255);
  count = wideCount * highCount; //number of cells per spaceinvader
  grid = new cell[count];  //initiate array of cell objects equal to the number of cell per spaceinvaders

  // 2d Arrays
  for (int a=0; a< width; a+= unit*14) {  //big grid
    for (int b=0; b< height; b+= unit*14) {
      pushMatrix();
      translate(a, b);
      for (int x=0; x< wideCount; x++) { //invaders grid
        for (int y=0; y< highCount; y++) {
          //start creating objects
          grid[x*y] = new cell (x*unit, y*unit, unit); // X & Y position is defined by size of the cell per x and y of the index ... x will be 0, 8, 16 and so forth
          grid[x*y].display();
        }
      }
      popMatrix();
    }
  }
}

void draw() {
 /*
 //use exit(); if you want to export the PDF
 exit();  
 */
}

class cell {
  float x, y;
  float side;
  int col;
  int chance;

  cell (float tempX, float tempY, float tempSide) {
    x = tempX;
    y = tempY;
    side = tempSide;
  }

  void display() {
    //This bit can go in to the Tile construct too and it would work anyway
    float fate = random(2);
    chance = int(fate * 1.4);
    //first define the fill 
    if (chance<=1) {
      fill(0);
    } 
    else {
      fill(255);
    }
    //then draw the cell
    rect (x, y, side, side);
    rect (11*unit-x, y, side, side); //right
  }
}



