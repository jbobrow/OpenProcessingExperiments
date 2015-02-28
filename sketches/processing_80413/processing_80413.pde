
/* @pjs preload="pacman.png"; 
 */

int gridSize = 30;        //size of the grid
int gridSizeX,gridSizeY;  //number of lines and columns in grid
int px,py;                //posicion of person in grid
PImage p;
char[][] grid;

//Java Mode needs chars to be defined with single quotes
//char WALL =  'x';
//char EMPTY = '-';  
//char ME =    '@';
//Javascript Mode needs chars to be defined with double quotes
char WALL =  "x";
char EMPTY = "-";  
char ME =    "@";

void setup(){
  size(600,300);
  gridSizeX = width/gridSize;
  gridSizeY = height/gridSize;
  grid = new char[gridSizeX][gridSizeY];
  p = loadImage ("pacman.png");
  loadGrid("lab1.txt");
}

void draw() {
  background(0);
  drawGrid();
  image(p, px*gridSize, py*gridSize, gridSize, gridSize);
}

void loadGrid(String file){
  String[] lines = loadStrings(file);
  for (int y=0; y<lines.length; y++){
    for (int x=0; x<lines[y].length(); x++){
      grid[x][y] = lines[y].charAt(x);
      //persona
      if (lines[y].charAt(x) == ME) {
        //set initial position of person
        px = x;
        py = y;
        //reset position in grid with empty sign
        grid[x][y] = EMPTY;
      } 
    }
  }
}

void drawGrid(){
  for (int x=0; x<gridSizeX; x++){
    for (int y=0; y<gridSizeY; y++){
      if (grid[x][y] == WALL) rect(x*gridSize,y*gridSize,gridSize,gridSize);
    }
  }
}

void keyPressed() {
  if (keyCode==UP) {
    char c = grid[px][py-1];
    if (c == EMPTY) py--;
  }
  else if (keyCode==DOWN){  
    char c = grid[px][py+1];
    if (c == EMPTY) py++;
  }
  else if (keyCode==RIGHT) {
    char c = grid[px+1][py];
    if (c == EMPTY) px++;
  }
  else if (keyCode==LEFT){
    char c = grid[px-1][py];
    if (c == EMPTY) px--;
  } 
}


