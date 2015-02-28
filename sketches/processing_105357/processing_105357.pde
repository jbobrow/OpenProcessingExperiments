
int Counter = 0;
int Pix0=0, Pix1=0, Pix01=0, Pix11=0 ;
boolean secondClick = false;
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


void setup() {
size(640,640);
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
  ChessBoard = loadImage("Chess-Board.gif");
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
  ChessBoard.resize(640, 640);
  background(230, 0, 255);
  fill(255, 255, 0);
  textSize(40);
  text("THE CHESS GAME!!!!", 125, 400);
  text("By Alan and William", 150, 450);
  fill(255, 0, 0);
  fill(0, 255, 255);
  text("Wait for it to load", 130, 150);
  text("By the way, it takes a while.", 50, 200);
}

PImage[][] Board;
void draw() {

  if (Counter <1) {
    if (mouseX > 149 && mouseX < 351) {
      if (mouseY > 74 && mouseY < 175) {
        Counter = Counter + 1;
        Board = BoardArray();
        PrintBoard();
      }
    }
  } 
  else {
    PrintBoard();
  }
}  //Move(Board);



void mouseClicked() {
  if (secondClick) {
    Pix01 = mouseY/80;
    Pix11 = mouseX/80;
    if (ValidMove(Pix0, Pix1, Pix01, Pix11) == true) {
      MovePiece(Pix0, Pix1, Pix01, Pix11);
      //      PrintBoard(Board);
      secondClick = false;
    }
  }
  else {
    Pix0 = mouseY/80;
    Pix1 = mouseX/80;
    int x = Pix0*8+Pix1;
    if (Board[Pix0][Pix1] == null) {
      secondClick = false;
    }
    else {
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
    if (NumCheck1 == NumCheck0-8) {
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
    else {
      return false;
    }
  }
  else if (ImageCheck0 == BPawn) {
    if (NumCheck1 == NumCheck0+8) {
      return true;
    }
    else if (NumCheck0 > 7 && NumCheck0 <16) {
      if (NumCheck1 == NumCheck0+16) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  else if (ImageCheck0 == BKnight|ImageCheck0 == WKnight) {
    if (NumCheck1 == NumCheck0-15|NumCheck1 == NumCheck0-17|NumCheck1 == NumCheck0-6|NumCheck1 == NumCheck0-10|NumCheck1 == NumCheck0+6|NumCheck1 == NumCheck0+10|NumCheck1 == NumCheck0+17|NumCheck1 == NumCheck0+15) {
      return true;
    }
    else {
      return false;
    }
  }
  else if (ImageCheck0 == WKing|ImageCheck0 == BKing) { 
    if (NumCheck1 == NumCheck0-1|NumCheck1 == NumCheck0+1|NumCheck1 == NumCheck0-8|NumCheck1 == NumCheck0+8|NumCheck1 == NumCheck0-9|NumCheck1 == NumCheck0+9|NumCheck1 == NumCheck0-7|NumCheck1 == NumCheck0+7) {
      return true;
    }
  }
  return true;
}



