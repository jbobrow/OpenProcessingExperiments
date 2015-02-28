
/* @pjs preload="Chess-Board.gif,Pawn.png,Pawn1.png,Rook.png,Rook1.png,Knight.png,Knight1.png,Bishop.png,Bishop1.png,Queen.png,Queen1.png,King.png,King1.png"; */

int Counter = 0;
int Pix0=0, Pix1=0, Pix01=0, Pix11=0 ;
boolean secondClick = false;
int VarCounter = 0;
PImage WPawn;
PImage BPawn;
PImage WRook;
PImage BRook;
PImage WKnight;
PImage BKnight;
PImage WBishop;
PImage BBishop;
PImage WQueen;
PImage BQueen;
PImage WKing;
PImage BKing;
PImage ChessBoard;
PImage[][] Board;


void setup() {
//  size(640, 640);
  size(640, 640);
  background(230, 0, 255);
  size(640, 640);
  fill(255, 255, 0);
  textSize(40);
  text("THE CHESS GAME!!!!", 125, 300);
  text("By William", 200, 400);
  fill(255, 0, 0);
  rect(225, 75, 200, 100);
  fill(0, 255, 255);
  text("PLAY", 275, 137.5);
  ChessBoard = loadImage("Chess-Board.gif");
  ChessBoard.resize(640, 640);
  background(ChessBoard);

  WKing = loadImage("King.png");
  BKing = loadImage("King1.png");
  WQueen = loadImage("Queen.png");
  BQueen = loadImage("Queen1.png");
  WPawn = loadImage("Pawn.png");
  BPawn = loadImage("Pawn1.png");
  WRook = loadImage("Rook.png");
  BRook = loadImage("Rook1.png");
  WKnight = loadImage("Knight.png");
  BKnight = loadImage("Knight1.png");
  WBishop = loadImage("Bishop.png");
  BBishop = loadImage("Bishop1.png");
  WKing.resize(100, 100);
  BKing.resize(80, 80);
  WQueen.resize(80, 80);
  BQueen.resize(80, 80);
  WPawn.resize(80, 80);
  BPawn.resize(80, 80);
  WRook.resize(80, 80);  
  BRook.resize(80, 80); 
  WKnight.resize(80, 80);
  BKnight.resize(80, 80);
  WBishop.resize(80, 80);  
  BBishop.resize(80, 80);
  Board = BoardArray();
}

void draw() {
  PrintBoard();
}  //Move(Board);



void mouseClicked() {
  if (secondClick) {
    Pix01 = round(mouseY/80-0.5);
    Pix11 = round(mouseX/80-0.5);
    
    println("Second click " +Pix01+" " + Pix11 );
    if (ValidMove(Pix0, Pix1, Pix01, Pix11) == true) {
      MovePiece(Pix0, Pix1, Pix01, Pix11);
      //      PrintBoard(Board);
      secondClick = false;
    }
  }
  else {
    Pix0 = round(mouseY/80-0.5);
    Pix1 = round(mouseX/80-0.5);
    println("First click " + Pix0 + " " + Pix1);
//    int x = Pix0*8+Pix1;
    if (Board[Pix0][Pix1] == null) {
      println("I am null");
      secondClick = false;
    }
    else {
      println("I am not null");
      secondClick = true;
    }
  }
}

PImage[][] BoardArray() {
  PImage [][] Board = new PImage[8][8];

  Board[0][0] = BRook;
  Board[0][1] = BKnight;
  Board[0][2] = BBishop;
  Board[0][3] = BQueen;
  Board[0][4] = BKing;
  Board[0][5] = BBishop;
  Board[0][6] = BKnight;
  Board[0][7] = BRook;
  Board[1][0] = BPawn;
  Board[1][1] = BPawn;
  Board[1][2] = BPawn; 
  Board[1][3] = BPawn;
  Board[1][4] = BPawn;
  Board[1][5] = BPawn;
  Board[1][6] = BPawn;
  Board[1][7] = BPawn;
  Board[6][0] = WPawn;
  Board[6][1] = WPawn;
  Board[6][2] = WPawn;
  Board[6][3] = WPawn;
  Board[6][4] = WPawn;
  Board[6][5] = WPawn;
  Board[6][6] = WPawn;
  Board[6][7] = WPawn;
  Board[7][0] = WRook;
  Board[7][1] = WKnight;
  Board[7][2] = WBishop;
  Board[7][3] = WQueen;
  Board[7][4] = WKing;
  Board[7][5] = WBishop;
  Board[7][6] = WKnight;
  Board[7][7] = WRook;
  return Board;
}

void PrintBoard() {
  background(ChessBoard);
  for (int i = 0; i<8; i++) {
    for (int j = 0; j<8; j++) {
      if (Board[i][j] != null) {
        image(Board[i][j], j*80, i*80);
      }
    }
  }
}

void MovePiece(int i0, int j0, int i1, int j1) {
  int Old = i0*8+j0;
  int New = i1*8+j1;

  Board[i1][j1] = Board[i0][j0];
  Board[i0][j0] = null;
}



boolean ValidMove(int Pix0, int Pix1, int Pix01, int Pix11) {
  //  println(Pix0 + ""+ Pix1 +""+ Pix01+""+ Pix11);
  PImage ImageCheck0 = Board[Pix0][Pix1];
  PImage ImageCheck1 = Board[Pix01][Pix11];
  int NumCheck0 = Pix0*8+Pix1;
  int NumCheck1 = Pix01*8+Pix11;


  if (ImageCheck0 == WPawn) {
    println("White Pawn");
    if (Board[Pix0-1][Pix1] != null) {
      return false;
    }
    else if (NumCheck1 == NumCheck0-8) {
      return true;
    }
    else if (NumCheck0 > 47 && NumCheck0 <56) {
      if (NumCheck1 == NumCheck0-16) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (Board[Pix0-1][Pix1+1] != null||Board[Pix0-1][Pix1-1] != null) {
      if (Pix01 == Pix0-1 && Pix11 == Pix1 +1 || Pix01 == Pix0-1 && Pix11 == Pix1-1) {
        return true;
      }
    }
    else {
      return false;
    }
  } 
  else if (ImageCheck0 == BPawn) {
    println("Black Pawn");
    if (Board[Pix0+1][Pix1] != null) {
      return false;
    }
    else if (NumCheck1 == NumCheck0+8) {
      return true;
    }
    else if (NumCheck0 > 7 && NumCheck0 <16) {
      if (NumCheck1 == NumCheck0+16) {
        return true;
      }
    }
    else if (Board[Pix0+1][Pix1+1] != null||Board[Pix0+1][Pix1-1] != null) {
      if (Pix01 == Pix0+1 && Pix11 == Pix1 + 1 || Pix01 == Pix0 + 1 && Pix11 == Pix1-1) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  else if (ImageCheck0 == BKnight||ImageCheck0 == WKnight) {
    println("Knight");
    if (NumCheck1 == NumCheck0-15||NumCheck1 == NumCheck0-17||NumCheck1 == NumCheck0-6||NumCheck1 == NumCheck0-10||NumCheck1 == NumCheck0+6||NumCheck1 == NumCheck0+10||NumCheck1 == NumCheck0+17||NumCheck1 == NumCheck0+15) {
      return true;
    }
    else {
      return false;
    }
  }
  else if (ImageCheck0 == WKing||ImageCheck0 == BKing) {
    if (NumCheck1 == NumCheck0-7 || NumCheck1 ==NumCheck0-8 || NumCheck1 == NumCheck0-9 ||NumCheck1 == NumCheck0+1 || NumCheck1 == NumCheck0-1 || NumCheck1 == NumCheck0 + 7 || NumCheck1 == NumCheck0 + 8 || NumCheck1 == NumCheck0 + 9) {
      return true;
    }
    else {
      return false;
    }
  }
  //else {
  return true;
  //}
}



