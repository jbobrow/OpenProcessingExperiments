
ScanLine[] scanLines;
ScanLine scanLine;

void setup() {
  scanLines = new ScanLine[1];
  scanLine = new ScanLine(0);
  scanLines[0] = scanLine;
  size (500, 500);
}

void draw() {
  int lineGray;
  scanLines[0].scanLinePosition = scanLines[0].scanLinePosition + 1;
 if (scanLines[0].scanLinePosition > height) scanLines[0].scanLinePosition = 0;
  background(255); 
   
    for (int i = 0 ; i < height; i++) {
        if (   (abs(i-scanLines[0].scanLinePosition)> 255)   ){
       lineGray = 255-(abs(i-scanLines[0].scanLinePosition)  % 255);
      }else{
       lineGray = abs(i-scanLines[0].scanLinePosition); 
      }
       stroke(lineGray);
      line(0,i,width,i);          
    }
   
   
    
  stroke(255);
  
//draw reference scan line  
//scanLines[0].drawLine();

}


class ScanLine{
  
  int scanLinePosition;
  
  ScanLine(int scanLinePosition_){
    scanLinePosition=0;
  }
  
  void drawLine(){
   line(0,scanLinePosition,width,scanLinePosition); 
  }
  
  
}


