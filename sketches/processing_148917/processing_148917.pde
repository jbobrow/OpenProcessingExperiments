
PFont f;

// 2D Array of objects
Cell[][] grid;
int[][] puzzle, press;

// Number of columns and rows in the grid
int rows = 5;
int cols = 6;
int Wcell=50;
int fsize=24;

void setup() {
  
  size(300,250);
  
  f = createFont("Arial",fsize,true); 
  textFont(f);
  
  grid = new Cell[rows][cols];
  
  puzzle = new int[rows+1][cols+2];
  press = new int[rows+1][cols+2];
  
  for (int c = 0; c < cols; c++) {
    for (int r = 0; r < rows; r++) {
      // Initialize each object
      grid[r][c] = new Cell(c*Wcell,r*Wcell,Wcell,Wcell,0);
      if (random(1)>0.5) {grid[r][c] = new Cell(c*Wcell,r*Wcell,Wcell,Wcell,1);}
    }
  }
  
  for ( int r=0; r<6; r++ ) 
    press[r][0] = press[r][7] = 0; 
  for ( int c=1; c<7; c++ ) 
    press[0][c] = 0; 
  for(int r=1; r<6; r++) 
    for(int c=1; c<7; c++)
       puzzle[r][c]=int(grid[r-1][c-1].ccolor); 
  
  enumerate ();
  
  String s;
  for(int r=1; r<6; r++){
    s=""; 
    for(int c=1; c<7; c++) { 
      s=s+" "+str(press[r][c]);
    }  
    println(s);
  }
 
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
    for (int r = 0; r < rows; r++) {
  for (int c = 0; c < cols; c++) {
      // Oscillate and display each object
      //grid[i][j].oscillate();
      grid[r][c].display();
    }
  }
  
  fill(0,127,0);
  for(int r=1; r<6; r++){
    for(int c=1; c<7; c++) { 
      text(str(press[r][c]),grid[r-1][c-1].x+Wcell/2-fsize/2,int(grid[r-1][c-1].y)+Wcell/2+fsize/2); 
    }  
  }
}

void mouseClicked() {
  
  int r,c;
  
  c=mouseX/Wcell;
  r=mouseY/Wcell;
  grid[r][c].toggle();
  
  //top left corner
  if (c==0 && r==0) {
        grid[r][c+1].toggle();
        grid[r+1][c].toggle();
  }  
  
  //top right corner
  if (c==cols-1 && r==0) {
        grid[r][c-1].toggle();
        grid[r+1][c].toggle();
  }
  
  //bottom left corner
  if (c==0 && r==rows-1) {
        grid[r-1][c].toggle();
        grid[r][c+1].toggle();
  }  
  
  //bottom right corner
  if (c==cols-1 && r==rows-1) {
        grid[r-1][c].toggle();
        grid[r][c-1].toggle();
  }
//--------------------------------------
  //bottom 
  if (c>0 && c<cols-1 && r==rows-1) {
        grid[r-1][c].toggle();
        grid[r][c+1].toggle();
        grid[r][c-1].toggle();
  }  

  // top
  if (c>0 && c<cols-1 && r==0) {
        grid[r+1][c].toggle();
        grid[r][c-1].toggle();
        grid[r][c+1].toggle();
  }  
  
  //left 
  if (r>0 && r<rows-1 && c==0) {
        grid[r+1][c].toggle();
        grid[r-1][c].toggle();
        grid[r][c+1].toggle();
  }  
  
  //right 
  if (r>0 && r<rows-1 && c==cols-1) {
        grid[r-1][c].toggle();
        grid[r+1][c].toggle();
        grid[r][c-1].toggle();
  }  
//-----------------------------------------------
  //inner cells
  for (c = 1; c < cols-1; c++) {
    for (r = 1; r < rows-1; r++) {
      if (mouseX > grid[r][c].x && mouseX < grid[r][c].x+Wcell && mouseY > grid[r][c].y && mouseY < grid[r][c].y+Wcell) {
        grid[r-1][c].toggle();
        grid[r+1][c].toggle();
        grid[r][c-1].toggle();
        grid[r][c+1].toggle();
      } 
    }
  }
  
  
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float ccolor; // color 

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempcolor) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    ccolor = tempcolor;
  } 
  
  // clicked
  void toggle() {
    if (ccolor==0) {
      ccolor=255;
    } else {
      ccolor=0;
    } 
  }

  void display() {
    stroke(255);
    fill(ccolor*255);
    rect(x,y,w,h); 
  }
}

void enumerate (){ 
 int c;
 boolean success; 
 for ( c=1; c<7; c++) 
 press[1][c] = 0; 
 while(guess()==false){ 
 press[1][1]++; 
 c = 1; 
 while (press[1][c] > 1) { 
 press[1][c] = 0; 
 c++; 
 press[1][c]++; 
 } 
 } 
 return; 
} 

boolean guess(){ 
 int c, r; 
 for(r=1; r<5; r++) 
 for(c=1; c<7; c++) 
 press[r+1][c] = (puzzle[r][c]+press[r][c]+ 
 press[r-1][c]+ press[r][c-1]+press[r][c+1]) %2; 
 for(c=1; c<7; c++) 
 if ((press[5][c-1] + press[5][c] + press[5][c+1] + 
 press[4][c]) %2 != puzzle[5][c] ) 
 return(false); 
 return(true); 
}

