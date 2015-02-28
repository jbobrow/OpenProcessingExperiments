
/*
 * Game of Life Converter
 * (c) Andy Wallace
 * 2010
 *
 * Takes an image, converts it to black and white
 * and plays Conway's Game of Life with the pixels
 *
 * Hold mouse down to advance 
 *
 * Image is of Suleiman The Magnificent
 */

//cell is a two dimensional array that will hold every cell of the board.
//tru if the cell is alive. False if the cell is dead
int rows=450;
int columns=637;
boolean[][] cell= new boolean[columns][rows];
float cellSize=5;

//newCell will hold weather cells should be alive or dead at the beginiing of the next round
boolean[][] nextCell=new boolean[columns][rows];

//image info
PImage img;
color colorTest=color(110);  //a grey color to test each pixel against. 
//The higher the number, the more black in the final image
//110 seems to work best for Sultan

void setup() {
  frameRate(30);
  //noStroke();
  fill(0);
  size(319,450);
  
  ParseImage();
}

void draw() {
  if (mousePressed)
    AdvanceRound();
}

//breaks the image down into individual pixels in the cell[][]
void ParseImage(){
  //load the image
  img=loadImage("SultanGrey.jpg");  //can sub in "Bartlett.jpg"
  image(img,0,0);  //display the image
  
  loadPixels();
  
  //check each pixel and determine if it is alive (black) or dead (white)
  for (int r=0; r<rows-2; r++) {
    for (int c=0; c<columns-2; c++) {
      //is the pixel lighter in color than the grey test pixel?
      if (pixels[GetPixel(c,r)]>colorTest)
        cell[c][r]=false;  //if it is white, the cell is dead
      else
        cell[c][r]=true;  //if it is black, the cell is alive
        
      
    }
  }
  
  background(255);
  for (int r=0; r<rows-2; r++) {
    for (int c=0; c<columns-2; c++) {
      DrawCell(c,r);  //draw the cell
    }
  }
}

//returns the locaiton in pixels[] of the point (x,y)
int GetPixel(int x, int y) {
  return(x+y*width);
}

void DrawCell(int c, int r) {
  //check if the cell is alive
  if (cell[c][r]) {
    point(c,r);
  }
}

//checks every cell to see if it will be alive or dead in the next round
//store this information in nextCell[][]
void AdvanceRound() {
  //set nextCell[][]
  for (int r=0; r<rows; r++) {
    for (int c=0; c<columns; c++) {
      //is the cell currently alive?
      if (cell[c][r]){
        //cell is alive
        //kill it if it has less than two neighbors or more than three
        //removing the "more than three" clause creates interesting patterns
        if (CheckNeighbors(c,r)<2 || CheckNeighbors(c,r)>3)
          nextCell[c][r]=false;
        else
          nextCell[c][r]=true; //if it has 2 or 5 neighbors, it will live next round
      }else{
        //cell is dead
        //if it has exactly three neighbors, it comes to life next round
        if (CheckNeighbors(c,r)==3)
          nextCell[c][r]=true;
        else
          nextCell[c][r]=false; //otherwise it will remain dead
      }
    }
  }
  //clear the screen
  background(255);
  //make cell[][] the same as nextCell[][] and draw it
  for (int r=0; r<rows; r++) {
    for (int c=0; c<columns; c++) {
      cell[c][r]=nextCell[c][r];
      DrawCell(c,r);
    }
  }
  //we're done advancing the round
}

//checks how many living neighbors cell[c][r] has and returns that value
int CheckNeighbors(int c,int r) {
  int neighbors=0;  //start with no living neighbors

  //horizontal and vertical
  if (c>0) {
    if (cell[c-1][r])  //left
      neighbors++;
  }
  if (c<columns-1) {
    if (cell[c+1][r])  //right
      neighbors++;
  }
  if (r>0) {
    if (cell[c][r-1])  //up
      neighbors++;
  }
  if (r<rows-1) {
    if (cell[c][r+1])  //down
      neighbors++;
  }

  //diagonals
  if (c>0 && r>0) {
    if (cell[c-1][r-1])  //top left
      neighbors++;
  }
  if (c<columns-1 && r<rows-1) {
    if (cell[c+1][r+1])  //bottom right
      neighbors++;
  }
  if (c<columns-1 && r>0) {
    if (cell[c+1][r-1])  //bottom left
      neighbors++;
  }
  if (c>0 && r<rows-1) {
    if (cell[c-1][r+1])  //top right
      neighbors++;
  }

  return neighbors;
}

/*
void mouseReleased(){
  AdvanceRound();
}
*/



