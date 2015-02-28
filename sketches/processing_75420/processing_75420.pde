
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


