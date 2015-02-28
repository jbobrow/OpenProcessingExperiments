
public class Drawing extends Thread{
  PImage XImage, OImage, finalFrame, xWin, oWin, tie, pressMouse, playAgain;
  int[][] moves;
  PGraphics offScreenBuffer;
  
  public Drawing(PImage XImage, PImage OImage, PImage xWin, PImage oWin, PImage tie, PImage pressMouse, PImage playAgain){
    super("drawing");
    this.XImage = XImage;
    this.OImage = OImage;
    this.xWin = xWin;
    this.oWin = oWin;
    this.tie = tie;
    this.pressMouse = pressMouse;
    this.playAgain = playAgain;
    moves = new int[3][3];
    for(int i = 0; i < 3; i++){
      for(int k = 0; k < 3; k++){
        moves[i][k] = 0;
      }
    }
    offScreenBuffer = createGraphics(332,332,P2D);
    finalFrame = offScreenBuffer;
  }
  
  public void drawGrid(Input in){
    this.moves = in.moves;
    run();
  }
  
  public void drawTieText(){
    offScreenBuffer.beginDraw();
      offScreenBuffer.tint(abs(255*cos(frameCount*.01)), 255, 255);
      offScreenBuffer.image(tie, 65, 60);
    offScreenBuffer.endDraw();
  }
  
  public void drawAgainText(){
    offScreenBuffer.beginDraw();
      offScreenBuffer.tint(abs(255*cos(frameCount*.01)), 255, 255);
      offScreenBuffer.image(pressMouse, 30, 160);
      offScreenBuffer.tint(abs(255*cos(frameCount*.01)), 255, 255);
      offScreenBuffer.image(playAgain, 20, 210);
    offScreenBuffer.endDraw();
  }
  
  public PImage getFrame(){
    return finalFrame;
  }
        
  //Dotlassie's Superfast blur. 
  void fastSmallBlur(PImage a, PImage b){ //a=src, b=dest img
    a.loadPixels();
    b.loadPixels();
    int pa[]=a.pixels;
    int pb[]=b.pixels;
    int h=a.height;
    int w=a.width;
    final int mask=(0xFF&(0xFF<<2))*0x01010101;
    for(int y=1;y<h-1;y++){ //edge pixels ignored
      int rowStart=y*w  +1;
      int rowEnd  =y*w+w-1;
      for(int i=rowStart;i<rowEnd;i++){
        pb[i]=(
          ( (pa[i-w]&mask) // sum of neighbours only, center pixel ignored
           +(pa[i+w]&mask)
           +(pa[i-1]&mask)
           +(pa[i+1]&mask)
          )>>2)
          |0xFF000000 //alpha -> opaque
          ;
      }
    }
  }
  
  public void run(){offScreenBuffer.beginDraw();
    //draw pre-existing moves
    //if(frameCount%10 ==0){
    for(int i = 0; i < 3; i++){
      for(int k = 0; k < 3; k++){
        switch (moves[i][k]){
          case 0 : break;
          case 1 : offScreenBuffer.tint(abs(255*cos(frameCount*.0051)), 255, 255);
                   offScreenBuffer.image(XImage, 8+(108*i), 8+(108*k)); break;
          case 2 : offScreenBuffer.tint(abs(255*cos(frameCount*.0051)), 255, 255);
                   offScreenBuffer.image(OImage, 8+(108*i), 8+(108*k)); break;
          default: break;
        }
      }
    //}
    }
    offScreenBuffer.colorMode(HSB);
    offScreenBuffer.stroke(abs(255*sin(frameCount*.01)), 255, 255);
    offScreenBuffer.strokeWeight(8);
    //vertical lines, including border.
    offScreenBuffer.line(4,0, 4, offScreenBuffer.height);
    offScreenBuffer.line(112, 0, 112, offScreenBuffer.height);
    offScreenBuffer.line(220, 0, 220, offScreenBuffer.height);
    offScreenBuffer.line(328, 0, 328, offScreenBuffer.height);
    //horizontal lines, including border.
    offScreenBuffer.line(0, 4, offScreenBuffer.width, 4);
    offScreenBuffer.line(0, 112, offScreenBuffer.width, 112);
    offScreenBuffer.line(0, 220, offScreenBuffer.width, 220);
    offScreenBuffer.line(0, 328, offScreenBuffer.width, 328);
    //handle post effects and return a copy of the frame
    fastSmallBlur(offScreenBuffer, finalFrame);
    offScreenBuffer.endDraw();
  }
  
  public void drawWinText(int winningPlayer){
    if(winningPlayer != 0){
      offScreenBuffer.beginDraw();
        offScreenBuffer.tint(abs(255*cos(frameCount*.01)), 255, 255);
        switch(winningPlayer){
          case 1: offScreenBuffer.image(xWin, 15, 60);break;
          case 2: offScreenBuffer.image(oWin, 15, 60);break;
          default: break;
        }
      offScreenBuffer.endDraw();
    }
  }
    
}
    

