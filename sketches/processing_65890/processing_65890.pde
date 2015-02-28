


  // ===================== ADD PIECE =====================
void addPiece() {
  
  Piece first = (Piece) pieces.get(0);
  first.addSelected("0");
}

  // ===================== DELETE PIECE =====================
void deletePiece(int sel) {
  if(pieces.size() <= 1 || sel == 0) return;
  if(check) println("deleting piece " + sel);
  for(int i = 0; i < pieces.size(); i++) {
    Piece piece = (Piece) pieces.get(i);
    piece.delSelected(sel);
  }
  pieces.remove(sel);
  if(sP >= pieces.size()) sP = pieces.size() - 1;
}

  // ===================== CORRECT NUMBERS =====================
void corrNo() {
  for(int i = 0; i < pieces.size(); i++) {
    Piece piece = (Piece) pieces.get(i);
    if(piece.no != i) {
      int no1 = piece.no;
      int no2 = i;
      if(check) println("correcting no " + no1 + " to " + no2);
      for(int j = 0; j < pieces.size(); j++) {
        Piece corPiece = (Piece) pieces.get(j);
        corPiece.corrNo(no1, no2);
      }
    }
  }
}

  // ===================== RESTART =====================
void restart(int s) {
  pieces.clear();
  sP = 0;
  sA = 0;
  sides = s + 2;
  pieces.add(new Piece());
}

  // ===================== RANDOMIZE COLOR =====================
void randomizeColor() {
   for(int i = 0; i < pieces.size(); i++) {
     Piece piece = (Piece) pieces.get(i);
     piece.randomizeColor();
   }
}

