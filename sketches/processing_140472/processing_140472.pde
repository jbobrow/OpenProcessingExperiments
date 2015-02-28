
int[][] gameBoard = new int[6][7];
// 2D array for game board
int turn = 1; // track which player
 
void setup() {
  size(700, 600);
  gameBoard[0][0]=2; // testing
}
 
void draw() {
  drawGameBoard();
}
 
 
void mousePressed() {
  // change the gameboard with mouse click
  // WARNING doesn't check if click is outside gameboard!
  gameBoard[int(mouseY/100)][int(mouseX/100)] = turn; 
   
  // my gameboard starts at 0,0 and each cell is 100x100
   
   
  // alternate turns
  if (turn == 1) {
    turn = 2;
  } else {
    turn = 1;
  }
   
}
 
  
 
 
void drawGameBoard() {
  // draw connect 4 game board using 2D array
  // WARNING! does not leave any room for other stuff!
   
  for (int y=0; y<6; y++) {  // loop through rows
 
    for (int x=0; x<7; x++) { // loop through columns
 
      fill(255,255,255); // default white fill
       
      if (gameBoard[y][x] == 1) {
        fill(200,0,0);
      }
      if (gameBoard[y][x] == 2) {
        fill(0,0,200);
      }
       
      ellipse(x*100+50, y*100+50, 40, 40); // draw piece
        
    }
  }
 
}

