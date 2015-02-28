
int[][] board = new int[7][7];
int[][] cacheBoard = new int[7][7];
boolean isFinished = false;

// 0 for RECT, 1 for CIRCLE 
int turn = 0;

int tileSize = 70;
int padding = 11;

void setup() {
  size(512, 512);
  initBoard();
  noLoop();
}

void initBoard() {

  // reset board
  clearBoard(board);

  isFinished = false;
  // reset turn for player1
  turn = 0;

  redraw();
}

void clearBoard(int[][] board) {
  // fill board with 0
  fillBoard(board, 0, 0, 7, 7, 0);
}

void draw() {

  // clear screen
  background(200);

  // count player's pieces
  int player1 = 0;
  int player2 = 0;

  // draw board
  fill(255);
  for (int i=0; i<7; i++) {
    for (int j=0; j<7; j++) {
      rect(
      padding+j*tileSize, 
      padding+i*tileSize, 
      tileSize, tileSize
        );
      switch(board[i][j]) {
      case 0:
        // blank;
        break;
      case 1:
        rect(
        padding+(j+0.25)*tileSize, 
        padding+(i+0.25)*tileSize, 
        tileSize/2, tileSize/2);
        player1++;
        break;
      case 2:
        ellipse(
        padding+(j+0.5)*tileSize, 
        padding+(i+0.5)*tileSize, 
        tileSize/2, tileSize/2);
        player2++;
        break;
      }
    }
  }

  // draw counts
  fill(180);
  textSize(14);
  textAlign(LEFT, CENTER);
  text("Rect: "+player1, 20, 30);
  text("Circle: "+player2, 20, 44);

  // draw result
  if (isFinished) {
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);

    if (player1<player2) {
      text("Circle won!", width/2, height/2);
    }
    else if (player1==player2) {
      // in fact, this game can not draw
      text("Draw!", width/2, height/2);
    }
    else {
      text("Rect won!", width/2, height/2);
    }

    fill(100);
    textSize(20);
    text("Press 'r' to reset game", width/2, height/4*3);
  }
}

void mouseReleased() {

  // chedk if game finished
  if (isFinished)
    return;

  int tileX = floor((mouseX-padding)/(float)tileSize);
  int tileY = floor((mouseY-padding)/(float)tileSize);

  // check if mouse in board 
  if (tileX<0 || 6<tileX || tileY<0 || 6<tileY)
    return;

  // check if mouse in a blank tile
  if (board[tileY][tileX] == 0) {

    // put a piece into tile
    board[tileY][tileX] = turn + 1;

    // check symmetry
    checkBoard(tileX, tileY);

    // check finished
    isFinished = checkFinished();   

    // switch turn
    turn = 1 - turn;

    redraw();
  }
}

void keyTyped() {
  switch(key) {
  case 'r':
    // pressed r to reset game;
    initBoard();
    break;
  default:
    println("keyTyped:"+key);
  }
}

void checkBoard(int x, int y) {

  // cache board
  copyBoard(board, cacheBoard);

  // find the rectangle range that includes piece(x,y)  
  for (int i=7; i>1; i--) {        
    int sx = max(0, x+1-i);
    int ex = min(x+i, 7)-i;
    int sy = max(0, y+1-i);
    int ey = min(y+i, 7)-i;

    // go through thoes rectangles
    for (int r=sy; r<=ey; r++) {
      for (int c=sx; c<=ex;c++) {

        // check if a rectangle full of pieces
        if (checkFull(cacheBoard, c, r, i, i)) {

          // check symmetry
          if (checkSymmetryV(cacheBoard, c, r, i, i)
            ||checkSymmetryH(cacheBoard, c, r, i, i)) {

            // swallow pieces             
            fillBoard(board, c, r, i, i, turn+1);
          };
        }
      }
    }      
  }
}

boolean checkFinished() {
  return checkFull(board, 0, 0, 7, 7);
}

boolean checkFull(int[][] board, int x, int y, int w, int h) {
  for (int r=y; r<y+h; r++) {
    for (int c=x; c<x+w; c++) {
      if (board[r][c]==0)
        return false;
    }
  }
  return true;
}

boolean checkSymmetryV(int[][] board, int x, int y, int w, int h) {
  for (int r=y; r<y+h/2; r++) {
    for (int c=x; c<x+w; c++) {
      if (board[r][c]!=board[y+h-1-(r-y)][c])
        return false;
    }
  }
  return true;
}

boolean checkSymmetryH(int[][] board, int x, int y, int w, int h) {
  for (int r=y; r<y+h; r++) {
    for (int c=x; c<x+w/2; c++) {
      if (board[r][c]!=board[r][x+w-1-(c-x)])
        return false;
    }
  }
  return true;
}

void fillBoard(int[][] board, int x, int y, int w, int h, int n) {
  for (int r=y; r<y+h; r++) {
    for (int c=x; c<x+w; c++) {
      board[r][c] = n;
    }
  }
}

void copyBoard(int[][] from, int[][] to) {
  for (int i=0; i<7; i++) {
    for (int j=0; j<7; j++) {      
        to[i][j] = from[i][j];
    }
  }
}
