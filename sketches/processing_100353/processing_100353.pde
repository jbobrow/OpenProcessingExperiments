
// John Conway's Game of Life simulation 
// author: Phoebe Mirman 
 
// Rules: 
// 1. A living cell with fewer than two live neighbours dies.
// 2. A living cell with two or three live neighbours lives on to the next generation.
// 3. A living cell with more than three live neighbours dies.
// 4. A dead cell with exactly three live neighbours becomes a live cell.
 
import java.util.*; 

int cellsize = 10;
int col, row;
int[][] current_live_cells, live, colors;
int Generation = 0; // keeps track of the number of generations
 
void setup()
{
  size(800, 500);  
  smooth();
  background(0);
 
  

  //initialize row, columns and set-up arrays
  col = width/cellsize;
  row = height/cellsize;
  current_live_cells = new int[col][row];
  live = new int[col][row];
  colors = new int[col][row];
  colorMode(RGB,255,255,255,100);
 
  //call function to fill array with random values 0 or 1
  initBoard();
  frameRate(30); 
 
}
 
void draw()
{
  fill(#ffffff);
  stroke(0, 102, 153);
  rect(710,455,70,30);
  fill(0, 102, 153);
 
  text("Restart", 722,475); // button to restart the board 
  text("Generation: " + Generation, 10, 475); 
  
  fill(#ffffff);
  stroke(0, 102, 153);
  rect(610,455,70,30);
  fill(0, 102, 153);
  text("Slow", 630,475); // button to make cells slower
  
  fill(#ffffff);
  stroke(0, 102, 153);
  rect(510,455,70,30);
  fill(0, 102, 153);
  text("Fast", 530,475); // button to make cells faster
  
 
  
  fill(0,40);
  rectMode(CORNER);
  noStroke();
  rect(0,0,width,height);
  check();
  render();
}
 
void check() {
  Random ColorGenerator = new Random();
  // loop through every spot in the array and checks the neighbors
  for (int x = 0; x < col;x++) {
    for (int y = 0; y < row;y++) {
      int nb = 0; // neighbor counter
      // if the neighbor is alive or has a value of one, nb is incremented
      // above row
    if (current_live_cells[(x+col-1)% col][(y+row-1) % row] == 1) { nb++; }
    if (current_live_cells[x][(y+row-1) % row ] == 1) { nb++; }
    if (current_live_cells[(x+1)% col ][(y+row-1) % row] == 1) { nb++; }
      // middle row
    if (current_live_cells[(x+col-1)% col ][y] == 1) { nb++; }
    if (current_live_cells[(x+1)% col ][y] == 1) { nb++; }
      // bottom row
    if (current_live_cells[(x+col-1)%col][(y+1)% row] == 1) { nb++; }
    if (current_live_cells[x][(y+1)% row] == 1) { nb++; }
    if (current_live_cells[(x+1)% col][(y+1)% row] == 1) { nb++; }
      
      // generates random numbers for colors
      float r = (float) ColorGenerator.nextGaussian();
      float g = (float) ColorGenerator.nextGaussian();
      float b = (float) ColorGenerator.nextGaussian(); 
      float w = (float) ColorGenerator.nextGaussian();
 
      // constrains the color 
      float sd = 50; float mean = 100;
      r = constrain((r * sd) + mean,0,255);
      sd = 50; mean = 200;
      g = constrain((g * sd) + mean,0,255);
      sd = 50; mean = 150;
      b = constrain((b * sd) + mean,0,255);
      sd = 50; mean = 150;
      w = constrain((w * sd) + mean,0,255);
      
    //Rules of "Life" 
    if ((current_live_cells[x][y] == 1) && (nb <  2)) { live[x][y] = 0; colors[x][y] = color(w);  } // assigned a zero, dies of "loneliness" 
    else if ((current_live_cells[x][y] == 1) && (nb >  3)) { live[x][y] = 0; colors[x][y] = color(r,25,100); } // assigned a zero, dies of "overpopulation"
    else if ((current_live_cells[x][y] == 0) && (nb == 3)) { live[x][y] = 1; colors[x][y] = color(10,120,b); } // assigned a one, reproduces, becomes alive
    else {live[x][y] = current_live_cells[x][y]; colors[x][y] = color(10,g,50); }  // if it fits into none of these categories, it stays the same as was in previous generation
    }
  } 
}
 
void render() {
  for ( int i = 0; i<col; i++) {
    for ( int j = 0; j<row; j++) {
      if ((live[i][j] == 1)) {
       fill(colors[i][j]);
       noStroke();
       ellipse(i*cellsize,j*cellsize,cellsize,cellsize);
        // if the cell is alive, it is shown on the board
      }
    }
  }
 
  //swap old and new game of life boards, the old generation becomes the new one
  int[][] tmp = current_live_cells;
  current_live_cells = live;
  live = tmp;
  Generation++; 
}
 
//init board with random "alive" squares, current_live_cells is assigned
void initBoard() {
  background(0);
  for (int i =0;i < col;i++) {
    for (int j =0;j < row;j++) {
      if (int(random(10))>7) { // if the random number generated is bigger than 7, the cell is alive
        current_live_cells[i][j] = 1;
      } else {
        current_live_cells[i][j] = 0;
      }
    }
  }
}
 
void mousePressed() {
  if (mouseX>710 && mouseY>455 && mouseX<780 && mouseY<485) {
    initBoard(); 
    Generation=0;
     // when the restart button is pressed, the board restarts and the generations are back to zero
  }
  
  if (mouseX>610 && mouseY>455 && mouseX<680 && mouseY<485) {
    frameRate(10);
    // the slow button, decreases the frameRate
  } 
  
  if (mouseX>510 && mouseY>455 && mouseX<580 && mouseY<485) {
    frameRate(80);
    // the fast button, increases the frameRate
  } 
}
 
// when mouse is dragged new alive cells are added 
void mouseDragged() {
  if (mouseX<width && mouseX >0 && mouseY <height && mouseY > 0) {
  int newx;
  int newy;
  
  newx = mouseX/cellsize;
  newy = mouseY/cellsize;
  //current_live_cells[newx][newy] = 1;
  live[newx][newy] = 1;
  render();
  }
}
 
// when the space bar is pressed, board is reset and generations return to zero 
void keyPressed() {
 if (keyCode == ' ') {
     initBoard();
     Generation= 0; 
 } 
}
