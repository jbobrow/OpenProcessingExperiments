
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/74233*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

Puzzle puz;
int pieceSize = 64;
int minPieceSize = 64/(4);
int nSteps = 2*2*2*2;
int step = nSteps;
PImage img;

void setup(){
  frameRate(30);
  // Picture from Sukanto Debnath
  // http://www.flickr.com/photos/sukanto_debnath/2181170020
  img = loadImage("http://profile.ak.fbcdn.net/hprofile-ak-ash4/c66.66.824.824/s160x160/396472_10150565651718610_1646959548_n.jpg");
  size(pieceSize*(img.width/pieceSize),pieceSize*(img.height/pieceSize));

  puz = new Puzzle(new PVector(0,0),width,height,pieceSize,img);
}
 
void draw(){
  background(220);  

  puz.paint();
  if(step >= nSteps){
    puz.nextMove();
    step = 0;
  }
  puz.movePiece(nSteps);
  step++;
}

void mouseClicked() {
  minPieceSize /= 4;
  if(minPieceSize < 4){
    minPieceSize = 64;
  }
  puz = new Puzzle(new PVector(0,0),width,height,pieceSize,img);
}

class Hole{
  PVector pos;
  int holeSize;
  PImage img;
  PVector prevPos;
  PVector nextPos;
  
  Hole(PVector tempPos, int tempHoleSize, int tempXposImg, int tempYposImg,PImage tempPuzzleImg){
    pos = tempPos.get();
    holeSize = tempHoleSize;
    img = tempPuzzleImg.get(tempXposImg,tempYposImg,holeSize,holeSize);
    prevPos = pos.get();
    nextPos = pos.get();
  }
  
  void shiftPos(PVector delta){
    pos.add(delta);
    prevPos.add(delta);
    nextPos.add(delta);
  }
  
  void moveHole(PVector delta){
    pos.add(delta);
  }

  void nextMove(PVector minPos, PVector maxPos){
    switch((int) random(0,4)){
      case 0:
        if(pos.x + holeSize >= maxPos.x || pos.x + holeSize == prevPos.x){
          nextMove(minPos,maxPos);
        }
        else{
          prevPos.set(pos);
          nextPos = PVector.add(pos,new PVector(holeSize,0));
        }
        break;
      case 1:
        if(pos.y + holeSize >= maxPos.y || pos.y + holeSize == prevPos.y){
          nextMove(minPos,maxPos);
        }
        else{
          prevPos.set(pos);
          nextPos = PVector.add(pos,new PVector(0,holeSize));
        }
        break; 
      case 2:
        if(pos.x - holeSize < minPos.x || pos.x - holeSize == prevPos.x){
          nextMove(minPos,maxPos);
        }  
        else{
          prevPos.set(pos);
          nextPos = PVector.add(pos,new PVector(-holeSize,0));
        }
        break;
      case 3:
        if(pos.y - holeSize < minPos.y || pos.y - holeSize == prevPos.y){
          nextMove(minPos,maxPos);
        } 
        else{
          prevPos.set(pos);
          nextPos = PVector.add(pos,new PVector(0,-holeSize));
        }
        break;
    }
  }

  Piece getPieceOver(ArrayList pieces){
    int over = -1;
    for(int i = 0; i < pieces.size(); i++){
      Piece p = (Piece) pieces.get(i);
      if((p.pos.x - nextPos.x) == 0 && (p.pos.y - nextPos.y) == 0){
        over = i;
        break;
      }
    }
    return (Piece) pieces.get(over);
  }
  
  void paint(){
    //image(img,pos.x,pos.y);
  }
}


class Piece{
  PVector pos;
  int pieceSize;
  PImage img;
  boolean puzzleStarted;
  Puzzle puz;
  
  Piece(PVector tempPos, int tempPieceSize, int tempXposImg, int tempYposImg,PImage tempPuzzleImg){
    pos = tempPos.get();
    pieceSize = tempPieceSize;
    img = tempPuzzleImg.get(tempXposImg,tempYposImg,pieceSize,pieceSize);
    puzzleStarted = false;
  }
  
  void shiftPos(PVector delta){
    pos.add(delta);
    if(puzzleStarted){
      puz.shiftPos(delta);
    }
  } 
  
  void createPuzzle(int cellsPerSide){
    if(pieceSize/cellsPerSide >= minPieceSize && !puzzleStarted){
      puz = new Puzzle(pos,pieceSize,pieceSize,pieceSize/cellsPerSide,img);
      puzzleStarted = true;
    }
  }
  
  void paint(){
    if(puzzleStarted){
      puz.paint();
    }
    else{
      image(img,pos.x,pos.y);
    }
  }
}

class Puzzle{
  PVector pos;
  int xSize;
  int ySize;
  int pieceSize;
  Hole h;
  ArrayList pieces = new ArrayList();
  Piece movingPiece;
  
  Puzzle(PVector tempPos, int tempXsize, int tempYsize, int tempPieceSize, PImage tempImg){
    pos = tempPos.get();
    xSize = tempXsize;
    ySize = tempYsize;
    pieceSize = tempPieceSize;
    PImage img = tempImg.get();
    
    int xHole = int(random(0,xSize/pieceSize));
    int yHole = int(random(0,ySize/pieceSize));
    for(int y = 0; y < ySize/pieceSize; y++){
      for(int x = 0; x < xSize/pieceSize; x++){
        if(x == xHole && y == yHole){
          h = new Hole(PVector.add(pos,new PVector(x*pieceSize,y*pieceSize)),pieceSize,x*pieceSize,y*pieceSize,img);
        }
        else{
          Piece p = new Piece(PVector.add(pos,new PVector(x*pieceSize,y*pieceSize)),pieceSize,x*pieceSize,y*pieceSize,img);
          pieces.add(p);
        }
      }
    }
    movingPiece = (Piece) pieces.get(0);
  }

  void shiftPos(PVector delta){
    pos.add(delta);
    h.shiftPos(delta);
    for(int i = 0; i < pieces.size(); i++){
      Piece p = (Piece) pieces.get(i);
      p.shiftPos(delta);
    }
  } 
  
  void nextMove(){
    h.nextMove(pos,PVector.add(pos,new PVector(xSize,ySize)));
    movingPiece = h.getPieceOver(pieces);
    movingPiece.createPuzzle(4);
    for(int i = 0; i < pieces.size(); i++){
      Piece p = (Piece) pieces.get(i);
      if(p.puzzleStarted){
        p.puz.nextMove();
      }
    }
  }

  void movePiece(int nSteps){
    PVector delta = PVector.sub(h.nextPos,h.prevPos);
    delta.div(float(nSteps));
    h.moveHole(delta);
    delta.mult(-1.0);
    movingPiece.shiftPos(delta);
    for(int i = 0; i < pieces.size(); i++){
      Piece p = (Piece) pieces.get(i);
      if(p.puzzleStarted){
        p.puz.movePiece(nSteps);
      }
    }
  }  

  void paint(){
    h.paint();
    for(int i = 0; i < pieces.size(); i++){
      Piece p = (Piece) pieces.get(i);
      p.paint();
    }
  }
}



