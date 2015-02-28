
//copyright Matthew Weidner 7/9/2013
//UltimateTTT: ultimate tic-tac-toe

final int EMPTY = 0, X_MARKER = 1, O_MARKER = 2, TIE_MARKER = 3;

OneBoard[][] wholeBoard;
int[][] boardWinners;
int wholeBoardWinner = EMPTY;
int currentPlayer;
/* The minorRow and minorCol of the previous move, which
   is necessarily the majorRow and majorCol of the current
   move.  (-1, -1) indicates that their is no previous move
   and thus the first player can go anywhere.
*/
int lastRow = -1, lastCol = -1;

void setup()
{
  size(300, 300);
  if (frame != null) {
    frame.setResizable(true);
  }
  
  ellipseMode(CORNER);
  textAlign(LEFT, BOTTOM);
  
  //initilize wholeBoard
  wholeBoard = new OneBoard[3][3];
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      wholeBoard[row][col] = new OneBoard(row, col);
    }
  }
  boardWinners = new int[3][3];
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      boardWinners[row][col] = EMPTY;
    }
  }
  
  //x goes first
  currentPlayer = X_MARKER;
}

void draw()
{
  background(240);
  
  //draw major board outline
  stroke(0);
  drawBoardOutline(width, height);
  
  //draw inner boards
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      wholeBoard[row][col].drawBoard();
    }
  }
  
  //draw major winner
  drawMarker(0, 0, width, height, wholeBoardWinner);
  
  //draw who has to go next, and where
  drawNextMoveIndicator();
  
  //draw description text
  fill(50);
  stroke(70);
  text("Ultimate TicTacToe by Matthew Weidner", 0, height);
}

/* Draws a tic-tac-toe board with its top left corner at
   the origin and with total width w and total height h.
*/
void drawBoardOutline(float w, float h)
{
  float wSpace = w / 3.0;
  float hSpace = h / 3.0;
  float wPad = w / 15.0;
  float hPad = h / 15.0;
  strokeWeight(w/60.0);
  line(wSpace, hPad, wSpace, h - hPad);
  line(2*wSpace, hPad, 2*wSpace, h - hPad);
  line(wPad, hSpace, w - wPad, hSpace);
  line(wPad, 2*hSpace, w - wPad, 2*hSpace);
}

int findWinner(int[][] board)
{
  for(int i = 0; i < 3; i++) {
    //check row i
    if(board[i][0] != EMPTY &&
        board[i][0] == board[i][1] &&
        board[i][1] == board[i][2]) {
      return board[i][0];
    }
    //check col i
    if(board[0][i] != EMPTY &&
        board[0][i] == board[1][i] &&
        board[1][i] == board[2][i]) {
      return board[0][i];
    }
  }
  //check diagonals
  if(board[0][0] != EMPTY &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
    return board[0][0];
  }
  if(board[0][2] != EMPTY &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
    return board[0][2];
  }
  
  return EMPTY;
}

boolean isBoardFull(int[][] board)
{
  for(int row = 0; row < 3; row++) {
    for(int col = 0; col < 3; col++) {
      if(board[row][col] == EMPTY) return false;
    }
  }
  return true;
}

void drawMarker(float x, float y, float w, float h,
    int marker)
{
  drawMarker(x, y, w, h, marker, false);
}

/* If specialXColorHack is true, then the color of the
   X_MARKER is changed slightly so that a minor x marker
   in the middle of a board can be seen against the major
   x marker for that board.
*/
void drawMarker(float x, float y, float w, float h,
    int marker, boolean specialXColorHack)
{
  if(marker == EMPTY) return;
  
  //padding
  float wPad= w / 7.0;
  float hPad = h / 7.0;
  x += wPad;
  w -= 2*wPad;
  y += hPad;
  h -= 2*hPad;
  
  //draw
  noFill();
  strokeWeight(w / 10.0);
  if(marker == X_MARKER) {
    if(specialXColorHack) {
      stroke(0, 0, 0);
    }
    else {
      stroke(160, 0, 0);
    }
    line(x, y, x + w, y + h);
    line(x + w, y, x, y + h);
  }
  else if(marker == O_MARKER) {
    stroke(0, 0, 160);
    ellipse(x, y, w, h);
  }
  else {
    assert(marker == TIE_MARKER);
    stroke(128);
    line(x, y + h/2.0, x + w, y + h/2.0);
  }
}

void drawNextMoveIndicator()
{
  if(wholeBoardWinner != EMPTY) {
    //game is over
    return;
  }
  /* Draw a translucent sqaure in currentPlayer's color
     around the board at (lastRow, lastCol).
  */
    
  float wSpace = width / 3.0;
  float hSpace = height / 3.0;
  noFill();
  strokeWeight(width / 30.0);
  if(currentPlayer == X_MARKER) {
    stroke(160, 0, 0, 128);
  }
  else {
    stroke(0, 0, 160, 128);
  }
  if(lastRow == -1 || wholeBoard[lastRow][lastCol].isFull) {
    /* Either this is the first move, or the target board is
       already full; either way, the player can go anywhere in
       the whole board.
    */
    float wPad = width / 60.0;
    float hPad = height / 60.0;
    rect(wPad, hPad, width - 2*wPad, height - 2*hPad);
  }
  else {
    rect(wSpace * lastCol, hSpace * lastRow, wSpace, hSpace);
  }
}

void mousePressed()
{
  if(wholeBoardWinner != EMPTY) {
    //game is over
    return;
  }
  //update the board
  int rowMod9 = (int) (9.0 * mouseY / height);
  int colMod9 = (int) (9.0 * mouseX / width);
  if(rowMod9 > 8 || rowMod9 < 0 || colMod9 > 8 || colMod9 < 0) return;
  int majorRow = rowMod9 / 3;
  int majorCol = colMod9 / 3;
  /* This move must be in the board specified by the last
     move; first move can be anywhere (-1 if first move).
  */
  if((lastRow == -1 && lastCol == -1) ||
      (wholeBoard[lastRow][lastCol].isFull) ||
      (majorRow == lastRow && majorCol == lastCol)) {
    int minorRow = rowMod9 % 3;
    int minorCol = colMod9 % 3;
    OneBoard 
    if(oneBoard.board[minorRow][minorCol] == EMPTY) {
      oneBoard.board[minorRow][minorCol] = currentPlayer;
      oneBoard.updateState();
      if(oneBoard.winner != EMPTY) {
        boardWinners[majorRow][majorCol] = oneBoard.winner;
        wholeBoardWinner = findWinner(boardWinners);
        if(isBoardFull(boardWinners)) {
          wholeBoardWinner = TIE_MARKER;
        }
      }
      
      //change players
      if(currentPlayer == X_MARKER) currentPlayer = O_MARKER;
      else currentPlayer = X_MARKER;
      
      //record the move
      lastRow = minorRow;
      lastCol = minorCol;
    }
  }
}

class OneBoard {
  int[][] board;
  int rowIndex, colIndex;
  int winner = EMPTY;
  boolean isFull = false;
  
  OneBoard(int rowIndex, int colIndex)
  {
    this.rowIndex = rowIndex;
    this.colIndex = colIndex;
    board = new int[3][3];
    for(int row = 0; row < 3; row++) {
      for(int col = 0; col < 3; col++) {
        board[row][col] = EMPTY;
      }
    }
  }
  
  //checks if anyone won this board
  void updateState()
  {
    winner = findWinner(board);
    if(isBoardFull(board)) {
      isFull = true;
      if(winner == EMPTY) {
        winner = TIE_MARKER;
      }
    }
  }
  
  void drawBoard()
  {
    pushMatrix();
    
    float majorWSpace = width / 3.0;
    float majorHSpace = height / 3.0;
    translate(this.colIndex*majorWSpace,
        this.rowIndex*majorHSpace);
    float wSpace = majorWSpace / 3.0;
    float hSpace = majorHSpace / 3.0;
    //board outline
    strokeWeight(width / 100.0);
    stroke(128);
    drawBoardOutline(majorWSpace, majorHSpace);
    //x's and o's
    for(int row = 0; row < 3; row++) {
      for(int col = 0; col < 3; col++) {
        drawMarker(col*wSpace, row*hSpace, wSpace, hSpace,
            board[row][col]);
      }
    }
    //overall x or o
    drawMarker(0, 0, majorWSpace, majorHSpace, winner);
    /* Hack: if the overall marker is an x, then it can be
       ambiguous as to whether the center space contains an
       x or is empty; if it contains an x, draw a ghost of
       the x overtop of the major x.
    */
    if(winner == X_MARKER && board[1][1] == X_MARKER) {
      drawMarker(1*wSpace, 1*hSpace, wSpace, hSpace,
            board[1][1], true);
    }
    
    popMatrix();
  }
}
