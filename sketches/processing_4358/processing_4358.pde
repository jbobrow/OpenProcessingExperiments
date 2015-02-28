
class Board{
  int boardSide;
  int rowNumber; //always odd
  int cellSize;
  int[] colNumber; //each row has different number of columns
  private Cell[][] board; //hexagonal board has unused cells
  
  Board(){
    this(DEFAULT_BOARD_SIDE);
  }
  Board(int boardSide){
    this.boardSide = boardSide;
    this.rowNumber = 2*boardSide - 1;
    this.cellSize = width/rowNumber; //in pixel
    
    colNumber = new int[rowNumber];
    for(int i = 0; i < rowNumber/2; i++){
      colNumber[i] = boardSide + i;
    }
    for(int i = rowNumber/2; i < rowNumber; i++){
      colNumber[i] = rowNumber - (i - rowNumber/2);
    }
    
    //cell positions
    this.board = new Cell[rowNumber][rowNumber];
    for(int row = 0; row < rowNumber; row++){
    for(int col = 0; col < colNumber[row]; col++){
      board[row][col] = new Cell();
      board[row][col].x = width/2 + (col-rowNumber/2)*cellSize + (rowNumber - colNumber[row])*cellSize/2;
      board[row][col].y = height/2 + int((row-rowNumber/2)*cellSize*1.732/2);
      board[row][col].board = this;
      board[row][col].row = row;
      board[row][col].col = col;
    }
    }
  }
  
  Cell getCell(int row, int col){
    if(row >= 0 && row < rowNumber && col >= 0 && col < colNumber[row]){
      return board[row][col];
    } else {
      return null;
    }
  }
  Cell getCellFromPixel(int x, int y){
    for(int row = 0; row < rowNumber; row++){
    for(int col = 0; col < colNumber[row]; col++){
      if(dist(board[row][col].x, board[row][col].y, x, y) <= cellSize/2){
        return board[row][col];
      }
    }
    }
    return null;
  }
  
  void display(){
    stroke(BLACK);
    fill(WHITE);
    beginShape();
      vertex(0, height/2);
      vertex(width/4, height/2 - width*1.732/4);
      vertex(3*width/4, height/2 - width*1.732/4);
      vertex(width, height/2);
      vertex(3*width/4, height/2 + width*1.732/4);
      vertex(width/4, height/2 + width*1.732/4);
    endShape(CLOSE);
    
    ellipseMode(CENTER);
    for(int row = 0; row < rowNumber; row++){
    for(int col = 0; col < colNumber[row]; col++){
      board[row][col].display(cellSize - 3); //offset is manually added
    }
    }
  }
  
  void checkWinCond(){ //search all cells for 3 orientations
    for(int row = 0; row < rowNumber - WIN_COND; row++){
    for(int col = 0; col < colNumber[row]; col++){
      if(board[row][col].getOwner() == NOBODY){
        continue;
      }
      //E direction
      int L = 1; 
      Cell c = board[row][col].E();
      while(c != null && board[row][col].getOwner() == c.getOwner()){
        L++;
        if(L >= WIN_COND){
          stroke(RED);
          line(c.x, c.y, board[row][col].x, board[row][col].y);
          //return true;
        }
        c = c.E();
      }
      //SW direction
      L = 1; 
      c = board[row][col].SW();
      while(c != null && board[row][col].getOwner() == c.getOwner()){
        L++;
        if(L >= WIN_COND){
          stroke(RED);
          line(c.x, c.y, board[row][col].x, board[row][col].y);
          //return true;
        }
        c = c.SW();
      }
      //SE direction
      L = 1; 
      c = board[row][col].SE();
      while(c != null && board[row][col].getOwner() == c.getOwner()){
        L++;
        if(L >= WIN_COND){
          stroke(RED);
          line(c.x, c.y, board[row][col].x, board[row][col].y);
          //return true;
        }
        c = c.SE();
      }
    }
    }
  }
}

