
Cell[][] board;
int cols = 3;
int rows = 3;
int player = 0; //0 = player1
int win = 0;  // 1 = player1   2 = player2;
int game = 0;  // 1 = game started
int full = 9;
void setup() {
  size(400, 400);
  smooth();  
  board = new Cell[cols][rows];
  for (int i = 0; i< cols; i++) {
    for ( int j = 0; j < rows; j++) {
      board[i][j] = new Cell(width/3*i, height/3*j, width/3, height/3);
    }
  }
}

void draw() {
  background(0);
  // intro
  if (game == 0) {
    fill(255);
    textSize(20);
    text("Press ENTER to Start", width/2-width/4, height/2);
  }

  //game start!
  if (game == 1) {
    checkGame();  // check if  player win
    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows; j++) {
        board[i][j].display();
      }
    }
  }
}

//mouse & key functions
void mousePressed() {
  if (game == 1) {
    if (win == 0) {
      for (int i = 0; i<cols; i++) {
        for (int j = 0; j<rows; j++) {
          board[i][j].click(mouseX, mouseY);
        }
      }
    }
  }
}

void keyPressed() {
  if (game == 0) {
    if ( key == ENTER) {
      game =1; //let's play
      full = 9;
    }
  } 
  else if (game == 1 && win == 0 && full == 0 ) {
    if ( key == ENTER) {
      game = 0; // start again
      for (int i = 0; i<cols; i++) {
        for (int j = 0; j<rows; j++) {
          board[i][j].clean();
          win = 0;
          full = 9;
        }
      }
    }
  }
  else if ( game == 1 && (win == 1 || win ==2)) {
    if ( key == ENTER) {
      game = 0; // start again
      for (int i = 0; i<cols; i++) {
        for (int j = 0; j<rows; j++) {
          board[i][j].clean();
          win = 0;
          full = 9;
        }
      }
    }
  }
}

void checkGame() {
  int row = 0;
  //check vertical & horizontal
  for (int col = 0; col< cols; col++) {
    if (board[col][row].checkState() == 1 && board[col][row+1].checkState() == 1)  {
      //println("vertical 0 win!");
      win = 1;
    } 
    else if (board[row][col].checkState() == 1 && board[row+1][col].checkState() == 1)  {
      //println("Horizontal 0 win!");
      win = 1;
    } 
    else if (board[row][col].checkState() == 2 && board[row+1][col].checkState() == 2)  {
      //println("Horizontal X win!");
      win = 2;
    }
    else if (board[col][row].checkState() == 2 && board[col][row+1].checkState() == 2)  {
      //println("vertical X win!");
      win = 2;
    }
  }

  //check diagonals
  if (board[row][row].checkState() == 1 && board[row+1].checkState() == 1) {
    //print(" diagonal 0 O win! ");
    win = 1;
  } 
  else if (board[row][row].checkState() == 2 && board[row+1].checkState() == 2) {
    //println("diagonal 0 x win!");
    win = 2;
  } 
  else if (board[0][row+2].checkState() == 1 && board[1][row+1].checkState() == 1) {
    //println("diagonal 1 O win!");
    win = 1;
  } 
  else if (board[0][row+2].checkState() == 2 && board[1][row+1].checkState() == 2) {
    //println("diagonal 1 X win!");
    win = 2;
  }


  //write text 
  fill(255);
  textSize(10);
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      if ( win == 1) {
        text("Player 1 \n WINS!", board[i][j].checkX()+40, board[i][j].checkY()+50);
      } 
      else if ( win == 2) {
        text("Player 2 \n WINS!", board[i][j].checkX()+40, board[i][j].checkY()+50);
      }
    }
  }


  if (win == 1 || win == 2) {
    fill(0, 255, 0);
    textSize(35);
    text("ENTER to Start Again", width/2-width/2+23, height/2-height/6-20);
  }

  if ( win == 0 && full == 0) {  // no win ;( 
    fill(0, 255, 0);
    textSize(35);
      text("ENTER to Start Again", width/2-width/2+23, height/2-height/6-20);
  }
}





//CELL CLASS

class Cell {
  int x;
  int y ;
  int w;
  int h;
  int state = 0;

  Cell(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
  }  

  void click(int tx, int ty) {
    int mx = tx;
    int my = ty;
    if (mx > x && mx < x+w && my > y && my < y+h) {

      if (player == 0 && state == 0) {
        state = 1;
        full -= 1;
        player = 1;
      } 
      else if (player == 1 && state == 0) {
        state = 2;
        full -= 1;
        player = 0;
      }
    }
  }
  
  void clean(){
    state = 0;  
  }
  
  int checkState(){
    return state;  
  }
  
  int checkX(){
    return x;  
  }
  
  int checkY(){
    return y;  
  }

  void display() {
    noFill();
    stroke(255);
    strokeWeight(3);
    rect(x, y, w, h);
    if (state == 1) {
      stroke(0,200, 0);
      line(x, y, x+w, y+h); 
      line(x+w, y, x, y+h);
    } 
    else if ( state == 2) {
      stroke(255, 0, 0);
      line(x, y, x+w, y+h); 
      line(x+w, y, x, y+h);
    } 
  }
}




