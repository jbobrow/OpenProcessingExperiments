
class Cell {
  int state;
  int xPos,yPos;
  PGraphics xPiece, oPiece;
  
  Cell(int number) {
    state = 0;
    
    xPos = number%cGridSize;
    yPos = number/cGridSize;
    
    createXPiece();
    createOPiece();
  }
  
  // debug constructor
  Cell(int number, int _state) {
    state = _state;
    
    xPos = number%cGridSize;
    yPos = number/cGridSize;
    
    createXPiece();
    createOPiece();
  }
  
  void drawPiece() {
    if (state == 0 && ((mouseX/cSize)%cGridSize == xPos) && ((mouseY/cSize)%cGridSize == yPos)) {
      fill(360);
      noStroke();
      rect(xPos*cSize,yPos*cSize,cSize,cSize);
    } else if (state == 1) {
      image(xPiece,xPos*cSize,yPos*cSize);
    } else if (state == 2){
      image(oPiece,xPos*cSize,yPos*cSize);
    }    
  }
  
  void changeState(int _player) {
    state = _player;
  }
  
  void createXPiece() {
    xPiece = createGraphics(cSize,cSize,P2D);
    xPiece.beginDraw();
    for (int i=0; i<10;i++) {
      xPiece.strokeWeight(random(5,10));
      xPiece.stroke(setColor());
      xPiece.line(random(0, 20), random(0, 20), random(cSize-20, cSize), random(cSize-20, cSize));
      xPiece.stroke(setColor());
      xPiece.line(random(0, 20), random(cSize-20, cSize), random(cSize-20, cSize), random(0, 20));
    }
    xPiece.endDraw();
  }
  
  void createOPiece() {
    oPiece = createGraphics(cSize,cSize,P2D);
    oPiece.beginDraw();
    oPiece.noFill();
    for (int i=0; i<10;i++) {
      oPiece.stroke(setColor());
      oPiece.strokeWeight(random(5,10));
      oPiece.arc(cSize/2,cSize/2,random(cSize-20,cSize-10),random(cSize-20,cSize-10),radians(random(360)),radians(random(720)));
    }
    oPiece.endDraw();
  }
}

