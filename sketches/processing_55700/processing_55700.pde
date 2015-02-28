


class facePiece{
  PImage facePiece;
  String fileName;
  int faceNum;
  int facePart;
  float x;
  float y;
  
  
  
  facePiece(String fileInfo, int faceID, int partID, float xPos, float yPos){
    this.fileName=fileInfo;
    this.faceNum=faceID;
    this.facePart=partID;
    facePiece=loadImage(fileName);
    this.x=xPos;
    println(xPos);
    this.y=yPos;
  }
  
  void display() {
    
    image(facePiece, x, y);
    
  }
}


